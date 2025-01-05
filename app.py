from flask import Flask, render_template, request, jsonify, redirect, url_for, flash, session
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime, timedelta
import calendar
from werkzeug.security import generate_password_hash, check_password_hash
from functools import wraps
from flask_migrate import Migrate

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://waliy:12345@localhost/swim'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.secret_key = 'your-secret-key-here'  # Change this to a secure secret key
db = SQLAlchemy(app)
migrate = Migrate(app, db)

# Models
class Location(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    monthly_price = db.Column(db.Integer, nullable=False)  # Price for 4 sessions package
    daily_price = db.Column(db.Integer, nullable=False)    # Price for single session
    quotas = db.relationship('Quota', backref='location', lazy=True)

class Quota(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    location_id = db.Column(db.Integer, db.ForeignKey('location.id'), nullable=False)
    day_name = db.Column(db.String(10), nullable=False)
    start_time = db.Column(db.Time, nullable=False)
    end_time = db.Column(db.Time, nullable=False)
    quota = db.Column(db.Integer, nullable=False)

class Booking(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    group_id = db.Column(db.String(50), nullable=True)
    location_id = db.Column(db.Integer, db.ForeignKey('location.id'), nullable=False)
    session_date = db.Column(db.Date, nullable=False)
    start_time = db.Column(db.Time, nullable=False)
    end_time = db.Column(db.Time, nullable=False)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    payment_status = db.Column(db.String(20), default='pending')
    location = db.relationship('Location', backref='bookings', lazy=True)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password_hash = db.Column(db.String(255), nullable=False)
    bookings = db.relationship('Booking', backref='user', lazy=True)

class Coupon(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(20), unique=True, nullable=False)
    discount_percentage = db.Column(db.Integer, nullable=False)  # Store as whole number (e.g., 10 for 10%)
    valid_until = db.Column(db.Date, nullable=True)
    is_active = db.Column(db.Boolean, default=True)

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session:
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated_function

@app.route('/')
def index():
    return render_template('dashboard.html')

@app.route('/dashboard')
@login_required
def dashboard():
    locations = Location.query.all()
    return render_template('dashboard.html', locations=locations)

@app.route('/get_available_slots', methods=['POST'])
@login_required
def get_available_slots():
    location_id = request.form.get('location_id')
    selected_date = datetime.strptime(request.form.get('date'), '%Y-%m-%d')
    day_name = calendar.day_name[selected_date.weekday()]

    # Get quotas for the selected location and day
    quotas = Quota.query.filter_by(
        location_id=location_id,
        day_name=day_name
    ).all()

    available_slots = []

    for quota in quotas:
        # Count existing bookings for the selected date and time slot
        bookings_count = Booking.query.filter_by(
            location_id=location_id,
            session_date=selected_date,
            start_time=quota.start_time,
            end_time=quota.end_time
        ).count()

        available_slots.append({
            'start_time': quota.start_time.strftime('%H:%M'),
            'end_time': quota.end_time.strftime('%H:%M'),
            'available': quota.quota - bookings_count,
            'total_quota': quota.quota
        })

    return jsonify({'available_slots': available_slots})

@app.route('/get_consecutive_dates', methods=['POST'])
@login_required
def get_consecutive_dates():
    location_id = request.form.get('location_id')
    selected_date = datetime.strptime(request.form.get('date'), '%Y-%m-%d')
    start_time = request.form.get('start_time')
    end_time = request.form.get('end_time')
    
    location = Location.query.get(location_id)
    consecutive_dates = []
    
    # Convert time strings to time objects once
    start_time_obj = datetime.strptime(start_time, '%H:%M').time()
    end_time_obj = datetime.strptime(end_time, '%H:%M').time()
    
    # Get current date and next 3 weeks
    current_date = selected_date
    for i in range(4):
        # Get day name for current date
        day_name = calendar.day_name[current_date.weekday()]
        
        # Get quota for this day
        quota_obj = Quota.query.filter_by(
            location_id=location_id,
            day_name=day_name,
            start_time=start_time_obj,
            end_time=end_time_obj
        ).first()

        if not quota_obj:
            return jsonify({
                'error': 'No quota available for selected time slot'
            }), 400

        # Count existing bookings for this specific date and time slot
        bookings_count = Booking.query.filter_by(
            location_id=location_id,
            session_date=current_date,
            start_time=start_time_obj,
            end_time=end_time_obj
        ).count()

        available_quota = quota_obj.quota - bookings_count

        date_info = {
            'date': current_date.strftime('%Y-%m-%d'),
            'formatted_date': current_date.strftime('%d %B %Y'),
            'start_time': start_time,
            'end_time': end_time,
            'available_quota': available_quota,
            'total_quota': quota_obj.quota,
            'is_available': available_quota > 0
        }
        consecutive_dates.append(date_info)
        current_date += timedelta(days=7)

    return jsonify({
        'location_name': location.name,
        'consecutive_dates': consecutive_dates
    })

@app.route('/confirm_booking', methods=['GET'])
@login_required
def confirm_booking():
    # Get parameters from URL
    location_id = request.args.get('location_id')
    selected_date = request.args.get('date')
    start_time = request.args.get('start_time')
    end_time = request.args.get('end_time')
    
    location = Location.query.get(location_id)
    
    return render_template(
        'confirm_booking.html',
        location=location,
        date=selected_date,
        start_time=start_time,
        end_time=end_time
    )

@app.route('/booking_confirmation/<int:booking_id>')
@login_required
def booking_confirmation(booking_id):
    # Get the first booking
    first_booking = Booking.query.get_or_404(booking_id)
    
    # Get all related bookings (4 consecutive weeks)
    bookings = Booking.query.filter_by(
        location_id=first_booking.location_id,
        start_time=first_booking.start_time,
        end_time=first_booking.end_time,
        user_id=session['user_id']
    ).filter(
        Booking.session_date >= first_booking.session_date
    ).order_by(Booking.session_date).limit(4).all()
    
    location = Location.query.get(first_booking.location_id)
    return render_template('booking_confirmation.html', 
                         bookings=bookings,
                         location=location)

@app.route('/book_session', methods=['POST'])
@login_required
def book_session():
    try:
        # Get form data
        location_id = request.form.get('location_id')
        date_str = request.form.get('date')
        start_time_str = request.form.get('start_time')
        end_time_str = request.form.get('end_time')

        # Validate input
        if not all([location_id, date_str, start_time_str, end_time_str]):
            return jsonify({
                'success': False,
                'message': 'Semua field harus diisi'
            })

        # Generate a unique group_id (timestamp + user_id)
        group_id = f"{int(datetime.now().timestamp())}_{session['user_id']}"

        # Parse dates and times
        first_session_date = datetime.strptime(date_str, '%Y-%m-%d')
        start_time = datetime.strptime(start_time_str, '%H:%M').time()
        end_time = datetime.strptime(end_time_str, '%H:%M').time()

        # Create bookings for 4 consecutive weeks
        bookings = []
        current_date = first_session_date
        
        for i in range(4):
            # Check quota availability for each date
            day_name = calendar.day_name[current_date.weekday()]
            quota = Quota.query.filter_by(
                location_id=location_id,
                day_name=day_name,
                start_time=start_time,
                end_time=end_time
            ).first()

            if not quota:
                return jsonify({
                    'success': False,
                    'message': f'Tidak ada kuota tersedia untuk tanggal {current_date.strftime("%d %B %Y")}'
                })

            # Count existing bookings
            existing_bookings = Booking.query.filter_by(
                location_id=location_id,
                session_date=current_date,
                start_time=start_time,
                end_time=end_time
            ).count()

            if existing_bookings >= quota.quota:
                return jsonify({
                    'success': False,
                    'message': f'Kuota penuh untuk tanggal {current_date.strftime("%d %B %Y")}'
                })

            # Create booking with group_id
            booking = Booking(
                group_id=group_id,  # Add the group_id
                location_id=location_id,
                session_date=current_date,
                start_time=start_time,
                end_time=end_time,
                user_id=session['user_id']
            )
            bookings.append(booking)
            current_date += timedelta(days=7)

        # Add all bookings to the session
        for booking in bookings:
            db.session.add(booking)
        
        db.session.commit()

        return jsonify({
            'success': True, 
            'message': 'Booking berhasil',
            'booking_id': bookings[0].id
        })

    except Exception as e:
        db.session.rollback()
        return jsonify({
            'success': False,
            'message': f'Terjadi kesalahan: {str(e)}'
        })

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method == 'POST':
        username = request.form.get('username')
        email = request.form.get('email')
        password = request.form.get('password')

        # Add validation for empty fields
        if not username or not email or not password:
            flash('All fields are required')
            return redirect(url_for('signup'))

        # Check if username or email already exists
        if User.query.filter_by(username=username).first():
            flash('Username already exists')
            return redirect(url_for('signup'))
        
        if User.query.filter_by(email=email).first():
            flash('Email already registered')
            return redirect(url_for('signup'))

        try:
            user = User(
                username=username,
                email=email,
                password_hash=generate_password_hash(password)
            )
            db.session.add(user)
            db.session.commit()

            flash('Registration successful! Please login.')
            return redirect(url_for('login'))
        except Exception as e:
            db.session.rollback()
            flash('An error occurred during registration. Please try again.')
            return redirect(url_for('signup'))

    return render_template('signup.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    # Redirect if user is already logged in
    if 'user_id' in session:
        return redirect(url_for('index'))

    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        
        # Add validation for empty fields
        if not username or not password:
            flash('Both username and password are required')
            return redirect(url_for('login'))

        try:
            user = User.query.filter_by(username=username).first()
            
            if user and check_password_hash(user.password_hash, password):
                session['user_id'] = user.id
                session.permanent = True  # Make the session permanent
                flash('Logged in successfully!')
                return redirect(url_for('index'))
            
            flash('Invalid username or password')
            return redirect(url_for('login'))
        except Exception as e:
            flash('An error occurred during login. Please try again.')
            return redirect(url_for('login'))

    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('user_id', None)
    flash('You have been logged out.')
    return redirect(url_for('login'))

@app.route('/booking_schedule')
@login_required
def booking_schedule():
    locations = Location.query.all()
    return render_template('booking_schedule.html', locations=locations)

@app.route('/process_booking', methods=['POST'])
@login_required
def process_booking():
    location_id = request.form.get('location')
    date = request.form.get('date')
    time_slot = request.form.get('timeSlot')
    
    if not all([location_id, date, time_slot]):
        flash('Please fill in all required fields')
        return redirect(url_for('booking_schedule'))
    
    start_time, end_time = time_slot.split('-')
    
    # Create booking
    booking = Booking(
        location_id=location_id,
        session_date=datetime.strptime(date, '%Y-%m-%d'),
        start_time=datetime.strptime(start_time, '%H:%M').time(),
        end_time=datetime.strptime(end_time, '%H:%M').time(),
        user_id=session['user_id']
    )
    
    try:
        db.session.add(booking)
        db.session.commit()
        flash('Booking successful!')
        return redirect(url_for('booking_confirmation', booking_id=booking.id))
    except:
        db.session.rollback()
        flash('An error occurred. Please try again.')
        return redirect(url_for('booking_schedule'))

@app.route('/update_payment_status', methods=['POST'])
@login_required
def update_payment_status():
    try:
        booking_id = request.form.get('booking_id')
        coupon_code = request.form.get('coupon_code')
        
        first_booking = Booking.query.get_or_404(booking_id)
        
        # Apply coupon if provided
        discount_percentage = 0
        if coupon_code:
            coupon = Coupon.query.filter_by(code=coupon_code, is_active=True).first()
            if coupon and (not coupon.valid_until or coupon.valid_until >= datetime.now().date()):
                discount_percentage = coupon.discount_percentage
        
        # Update payment status for all bookings with the same group_id
        bookings = Booking.query.filter_by(
            group_id=first_booking.group_id,
            user_id=session['user_id']
        ).all()
        
        for booking in bookings:
            booking.payment_status = 'paid'
            booking.applied_discount = discount_percentage  # You might want to add this field to the Booking model
        
        db.session.commit()
        return jsonify({'success': True, 'message': 'Payment status updated successfully'})
    except Exception as e:
        db.session.rollback()
        return jsonify({'success': False, 'message': str(e)})

@app.route('/cancel_bookings', methods=['POST'])
@login_required
def cancel_bookings():
    try:
        booking_id = request.form.get('booking_id')
        first_booking = Booking.query.get_or_404(booking_id)
        
        # Delete all bookings with the same group_id
        bookings = Booking.query.filter_by(
            group_id=first_booking.group_id,
            user_id=session['user_id']
        ).all()
        
        for booking in bookings:
            db.session.delete(booking)
        
        db.session.commit()
        return jsonify({'success': True, 'message': 'Bookings cancelled successfully'})
    except Exception as e:
        db.session.rollback()
        return jsonify({'success': False, 'message': str(e)})

@app.route('/apply_coupon', methods=['POST'])
@login_required
def apply_coupon():
    coupon_code = request.form.get('coupon_code')
    
    coupon = Coupon.query.filter_by(code=coupon_code, is_active=True).first()
    
    if not coupon:
        return jsonify({
            'success': False,
            'message': 'Kode kupon tidak valid'
        })
    
    if coupon.valid_until and coupon.valid_until < datetime.now().date():
        return jsonify({
            'success': False,
            'message': 'Kode kupon sudah kadaluarsa'
        })
    
    return jsonify({
        'success': True,
        'discount_percentage': coupon.discount_percentage,
        'message': f'Kupon berhasil diterapkan! Diskon {coupon.discount_percentage}%'
    })

@app.route('/my_schedules')
@login_required
def my_schedules():
    # Get all bookings for the current user, ordered by date
    bookings = Booking.query.filter_by(
        user_id=session['user_id']
    ).order_by(
        Booking.session_date.desc(),
        Booking.start_time
    ).all()
    
    # Group bookings by group_id for package bookings
    grouped_bookings = {}
    single_bookings = []
    
    for booking in bookings:
        if booking.group_id:
            if booking.group_id not in grouped_bookings:
                grouped_bookings[booking.group_id] = []
            grouped_bookings[booking.group_id].append(booking)
        else:
            single_bookings.append(booking)
    
    return render_template(
        'my_schedules.html',
        grouped_bookings=grouped_bookings,
        single_bookings=single_bookings
    )

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5001)
