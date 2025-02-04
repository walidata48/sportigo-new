from flask import Flask, render_template, request, jsonify, redirect, url_for, flash, session, g
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime, timedelta
import calendar
from werkzeug.security import generate_password_hash, check_password_hash
from functools import wraps
from flask_migrate import Migrate
from flask.cli import FlaskGroup
from sqlalchemy import distinct

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://waliy:12345@localhost/swim'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.secret_key = 'your-secret-key-here'  # Change this to a secure secret key
db = SQLAlchemy(app)
migrate = Migrate(app, db)

# Add the translate_day function and register it BEFORE any routes
def translate_day(day_name):
    translations = {
        'Monday': 'Senin',
        'Tuesday': 'Selasa',
        'Wednesday': 'Rabu',
        'Thursday': 'Kamis',
        'Friday': 'Jumat',
        'Saturday': 'Sabtu',
        'Sunday': 'Minggu'
    }
    return translations.get(day_name, day_name)

# Register the filter right after the function definition
app.jinja_env.filters['translate_day'] = translate_day

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
    presence_status = db.Column(db.String(20), default='pending')
    notes = db.Column(db.Text, nullable=True)
    location = db.relationship('Location', backref='bookings', lazy=True)

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(80), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password_hash = db.Column(db.String(255), nullable=False)
    is_admin = db.Column(db.Boolean, default=False)
    bookings = db.relationship('Booking', backref='user', lazy=True)

class Coupon(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    code = db.Column(db.String(20), unique=True, nullable=False)
    discount_amount = db.Column(db.Integer, nullable=False)  # Store as fixed amount (e.g., 50000)
    valid_until = db.Column(db.Date, nullable=True)
    is_active = db.Column(db.Boolean, default=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=True)  # NULL means coupon for all users
    
    # Add relationship to User model
    user = db.relationship('User', backref='coupons')

class ASAPool(db.Model):
    __tablename__ = 'asa_packages'
    id = db.Column(db.Integer, primary_key=True)
    package_name = db.Column(db.String(100), nullable=False)
    price = db.Column(db.Integer, nullable=False)
    description = db.Column(db.Text, nullable=True)
    is_morning_available = db.Column(db.Boolean, default=False)  # For "Reguler + Pagi"
    sessions_per_month = db.Column(db.Integer, default=12)  # Both packages have 12 sessions
    is_trial = db.Column(db.Boolean, default=False)  # Add this line

class ASASchedule(db.Model):
    __tablename__ = 'asa_schedules'
    id = db.Column(db.Integer, primary_key=True)
    package_id = db.Column(db.Integer, db.ForeignKey('asa_packages.id'), nullable=False)
    day_name = db.Column(db.String(10), nullable=False)
    start_time = db.Column(db.Time, nullable=False)
    end_time = db.Column(db.Time, nullable=False)
    quota = db.Column(db.Integer, default=20)  # Adjust default quota as needed
    
    package = db.relationship('ASAPool', backref='schedules')

class ASABooking(db.Model):
    __tablename__ = 'asa_bookings'
    id = db.Column(db.Integer, primary_key=True)
    user_id = db.Column(db.Integer, db.ForeignKey('user.id'), nullable=False)
    package_id = db.Column(db.Integer, db.ForeignKey('asa_packages.id'), nullable=False)
    booking_date = db.Column(db.DateTime, default=datetime.utcnow)
    payment_status = db.Column(db.String(20), default='pending')
    applied_discount = db.Column(db.Integer, default=0)  # Store actual discount amount
    
    package = db.relationship('ASAPool', backref='bookings')
    user = db.relationship('User', backref='asa_bookings')
    sessions = db.relationship('ASABookingSession', backref='booking')

class ASABookingSession(db.Model):
    __tablename__ = 'asa_booking_sessions'
    id = db.Column(db.Integer, primary_key=True)
    booking_id = db.Column(db.Integer, db.ForeignKey('asa_bookings.id'), nullable=False)
    schedule_id = db.Column(db.Integer, db.ForeignKey('asa_schedules.id'), nullable=False)
    session_date = db.Column(db.Date, nullable=False)
    start_time = db.Column(db.Time, nullable=False)
    end_time = db.Column(db.Time, nullable=False)
    status = db.Column(db.String(20), default='scheduled')  # scheduled, completed, cancelled
    
    schedule = db.relationship('ASASchedule')

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session:
            return redirect(url_for('login'))
        return f(*args, **kwargs)
    return decorated_function

def admin_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if 'user_id' not in session:
            return redirect(url_for('login'))
        user = User.query.get(session['user_id'])
        if not user or not user.is_admin:
            flash('Access denied. Admin privileges required.', 'error')
            return redirect(url_for('index'))
        return f(*args, **kwargs)
    return decorated_function

@app.before_request
def load_user():
    g.user = None
    if 'user_id' in session:
        g.user = User.query.get(session['user_id'])

@app.route('/')
def index():
    locations = Location.query.all()
    
    # Get regular package schedules
    regular_package = ASAPool.query.filter_by(package_name='Reguler').first()
    asa_regular_schedules = []
    if regular_package:
        asa_regular_schedules = ASASchedule.query.filter_by(package_id=regular_package.id).all()
    asa_regular_schedules = [
    {field.name: getattr(schedule, field.name).title() if isinstance(getattr(schedule, field.name), str) else getattr(schedule, field.name) 
     for field in ASASchedule.__table__.columns} 
    for schedule in asa_regular_schedules
    ]
    return render_template('dashboard.html', 
                         locations=locations, 
                         translate_day=translate_day,
                         asa_regular_schedules=asa_regular_schedules)

@app.route('/dashboard')
@login_required
def dashboard():
    locations = Location.query.all()
    
    # Get regular package schedules
    regular_package = ASAPool.query.filter_by(package_name='Reguler').first()
    asa_regular_schedules = []
    if regular_package:
        asa_regular_schedules = ASASchedule.query.filter_by(package_id=regular_package.id).all()

    
    return render_template('dashboard.html', 
                         locations=locations, 
                         translate_day=translate_day,
                         asa_regular_schedules=asa_regular_schedules)

@app.route('/get_available_slots', methods=['POST'])
@login_required
def get_available_slots():
    location_id = request.form.get('location_id')
    selected_date = datetime.strptime(request.form.get('date'), '%Y-%m-%d')
    day_name = calendar.day_name[selected_date.weekday()]
    print(day_name)

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
        discount_amount = 0
        if coupon_code:
            coupon = Coupon.query.filter_by(code=coupon_code, is_active=True).first()
            if coupon and (not coupon.valid_until or coupon.valid_until >= datetime.now().date()):
                discount_amount = coupon.discount_amount
        print(discount_amount)
        # Update payment status for all bookings with the same group_id
        bookings = Booking.query.filter_by(
            group_id=first_booking.group_id,
            user_id=session['user_id']
        ).all()
        
        for booking in bookings:
            booking.payment_status = 'paid'
            booking.applied_discount = discount_amount
        
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
        'discount_amount': coupon.discount_amount,
        'message': f'Kupon berhasil diterapkan! Diskon Rp {coupon.discount_amount:,}'
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

# Routes for ASA pool
@app.route('/asa')
def asa_packages():
    packages = ASAPool.query.all()
    return render_template('asa/packages.html', packages=packages)

@app.route('/asa/schedule/<int:package_id>')
@login_required
def asa_schedule(package_id):
    package = ASAPool.query.get_or_404(package_id)
    schedules = ASASchedule.query.filter_by(package_id=package_id).all()
    return render_template('asa/schedule.html', package=package, schedules=schedules)

@app.route('/asa/book/<int:package_id>', methods=['POST'])
@login_required
def asa_book(package_id):
    package = ASAPool.query.get_or_404(package_id)
    
    # Create booking
    booking = ASABooking(
        user_id=session['user_id'],
        package_id=package_id,
        payment_status='pending'  # Initial status
    )
    db.session.add(booking)
    
    try:
        db.session.commit()
        # Redirect to booking confirmation page
        return redirect(url_for('asa_booking_confirmation', booking_id=booking.id))
    except Exception as e:
        db.session.rollback()
        flash('An error occurred while processing your booking. Please try again.', 'error')
        return redirect(url_for('asa_packages'))

@app.route('/asa/booking_confirmation/<int:booking_id>')
@login_required
def asa_booking_confirmation(booking_id):
    booking = ASABooking.query.get_or_404(booking_id)
    package = ASAPool.query.get(booking.package_id)
    
    return render_template('asa/booking_confirmation.html', 
                         booking=booking,
                         package=package,
                         datetime=datetime)

@app.route('/update_asa_payment_status', methods=['POST'])
@login_required
def update_asa_payment_status():
    try:
        booking_id = request.form.get('booking_id')
        start_date_str = request.form.get('start_date')
        applied_discount = request.form.get('applied_discount', type=int) or 0
        
        if not start_date_str:
            return jsonify({
                'success': False,
                'message': 'Please select a start date'
            })
        
        booking = ASABooking.query.get_or_404(booking_id)
        package = ASAPool.query.get(booking.package_id)
        
        # Update booking with discount and payment status
        booking.applied_discount = applied_discount
        booking.payment_status = 'paid'
        booking.payment_date = datetime.now()
        
        # Different handling for trial vs regular packages
        if package.is_trial:
            # For trial, only create one session on the selected date
            start_date = datetime.strptime(start_date_str, '%Y-%m-%d').date()
            
            # Get available schedule for that day
            day_name = calendar.day_name[start_date.weekday()]
            # Convert English day name to Indonesian
            day_mapping = {
                'Monday': 'SENIN',
                'Tuesday': 'SELASA',
                'Wednesday': 'RABU',
                'Thursday': 'KAMIS',
                'Friday': 'JUMAT',
                'Saturday': 'SABTU',
                'Sunday': 'MINGGU'
            }
            indo_day = day_mapping.get(day_name)
            
            # Debug prints
            print("Debug Information:")
            print(f"Selected date: {start_date}")
            print(f"Day name from calendar: {day_name}")
            print(f"Converted to Indonesian: {indo_day}")
            
            # Get all schedules for debugging
            all_schedules = ASASchedule.query.filter_by(package_id=package.id).all()
            print("\nAvailable schedules in database:")
            for s in all_schedules:
                print(f"Day: {s.day_name}, Time: {s.start_time}-{s.end_time}")
            
            # Try to find the schedule
            schedule = ASASchedule.query.filter_by(
                package_id=package.id,
                day_name=indo_day
            ).first()
            
            if not schedule:
                return jsonify({
                    'success': False,
                    'message': f'Debug: Looking for {indo_day}, Available days: {[s.day_name for s in all_schedules]}'
                })
            
            session = ASABookingSession(
                booking_id=booking.id,
                schedule_id=schedule.id,
                session_date=start_date,
                start_time=schedule.start_time,
                end_time=schedule.end_time,
                status='scheduled'
            )
            db.session.add(session)
            
            db.session.commit()
            return jsonify({
                'success': True,
                'message': 'Trial session payment successful! Your session has been scheduled.'
            })
            
        else:
            # Regular package logic
            start_date = datetime.strptime(start_date_str, '%Y-%m-%d').date()
            end_date = start_date + timedelta(days=29)
            
            # Get schedules for this package
            asa_schedules = ASASchedule.query.filter_by(package_id=package.id).all()
            
            # Generate schedules until end date
            schedules = []
            current_date = start_date
            
            # Create day mapping
            day_mapping = {
                'SENIN': 0, 'SELASA': 1, 'RABU': 2, 'KAMIS': 3, 
                'JUMAT': 4, 'SABTU': 5, 'MINGGU': 6
            }
            
            while current_date <= end_date:
                for schedule in asa_schedules:
                    if current_date.weekday() == day_mapping[schedule.day_name]:
                        schedules.append(ASABookingSession(
                            booking_id=booking.id,
                            schedule_id=schedule.id,
                            session_date=current_date,
                            start_time=schedule.start_time,
                            end_time=schedule.end_time,
                            status='scheduled'
                        ))
                current_date += timedelta(days=1)
            
            # Verify we have at least 12 sessions for regular packages
            if len(schedules) < 12:
                return jsonify({
                    'success': False,
                    'message': 'Selected date range does not provide enough sessions. Please choose a different start date.'
                })
            
            db.session.add_all(schedules)
            db.session.commit()
            
            return jsonify({
                'success': True,
                'message': 'Payment successful! Your sessions have been scheduled.'
            })
        
    except Exception as e:
        db.session.rollback()
        return jsonify({
            'success': False,
            'message': f'Payment failed: {str(e)}'
        })

@app.route('/asa/my_schedule/<int:booking_id>')
@login_required
def asa_my_schedule(booking_id):
    booking = ASABooking.query.get_or_404(booking_id)
    package = ASAPool.query.get(booking.package_id)
    
    # Get all sessions ordered by date
    sessions = ASABookingSession.query\
        .join(ASASchedule)\
        .filter(ASABookingSession.booking_id == booking_id)\
        .order_by(ASABookingSession.session_date)\
        .all()
    
    return render_template('asa/my_schedule.html', 
                         booking=booking,
                         package=package,
                         sessions=sessions)

@app.route('/asa/payment', methods=['POST'])
@login_required
def asa_payment():
    package_id = request.form.get('package_id')
    payment_method = request.form.get('payment_method')
    
    package = ASAPool.query.get_or_404(package_id)
    
    # Create booking
    booking = ASABooking(
        user_id=session['user_id'],
        package_id=package_id
    )
    db.session.add(booking)
    
    try:
        db.session.commit()
        
        # If payment method is transfer, show transfer instructions
        if payment_method == 'transfer':
            return render_template('asa/payment_transfer.html', 
                                booking=booking,
                                package=package)
        # If payment method is QRIS, show QR code
        else:
            return render_template('asa/payment_qris.html',
                                booking=booking,
                                package=package)
                                
    except Exception as e:
        db.session.rollback()
        flash('An error occurred while processing your booking. Please try again.', 'error')
        return redirect(url_for('asa_packages'))

@app.route('/apply_asa_coupon', methods=['POST'])
@login_required
def apply_asa_coupon():
    coupon_code = request.form.get('coupon_code')
    package_price = request.form.get('package_price', type=int)
    
    # Query for either user-specific coupon or general coupon
    coupon = Coupon.query.filter(
        Coupon.code == coupon_code,
        Coupon.is_active == True,
        db.or_(
            Coupon.user_id == session['user_id'],  # User-specific coupon
            Coupon.user_id == None  # General coupon
        )
    ).first()
    
    if not coupon:
        return jsonify({
            'success': False,
            'message': 'Kode kupon tidak valid'
        })
    
    if coupon.valid_until and coupon.valid_until < datetime.now().date():
        return jsonify({
            'success': False,
            'message': 'Kupon sudah kadaluarsa'
        })

    if coupon.discount_amount > package_price:
        return jsonify({
            'success': False,
            'message': 'Nilai kupon melebihi harga paket'
        })
    
    return jsonify({
        'success': True,
        'discount_amount': coupon.discount_amount,
        'message': f'Kupon berhasil diterapkan! Diskon Rp {coupon.discount_amount:,}'
    })

# Function to initialize ASA packages and schedules
def initialize_asa_data():
    # Create packages
    regular_package = ASAPool(
        package_name='Reguler',
        price=350000,
        description='3x per minggu (Selasa, Kamis, Sabtu sore)',
        is_morning_available=False,
        sessions_per_month=12
    )

    morning_package = ASAPool(
        package_name='Reguler + Pagi',
        price=400000,
        description='6x per minggu (Senin, Rabu, Jumat pagi & Selasa, Kamis, Sabtu sore)',
        is_morning_available=True,
        sessions_per_month=12
    )

    trial_package = ASAPool(
        package_name='Trial',
        price=90000,
        description='1x Trial Session',
        is_morning_available=False,
        sessions_per_month=1,
        is_trial=True
    )

    db.session.add_all([regular_package, morning_package, trial_package])
    db.session.flush()

    # Create schedules
    schedules = []
    
    # Regular package schedules (afternoon only)
    regular_schedules = [
        ('SELASA', '16:00', '17:30'),
        ('KAMIS', '16:00', '17:30'),
        ('SABTU', '16:00', '17:30')
    ]

    for day, start, end in regular_schedules:
        schedules.append(ASASchedule(
            package_id=regular_package.id,
            day_name=day,
            start_time=datetime.strptime(start, '%H:%M').time(),
            end_time=datetime.strptime(end, '%H:%M').time()
        ))

    # Regular + Morning package schedules (morning and afternoon)
    morning_schedules = [
        ('SENIN', '05:00', '06:30'),
        ('SELASA', '16:00', '17:30'),
        ('RABU', '05:00', '06:30'),
        ('KAMIS', '16:00', '17:30'),
        ('JUMAT', '05:00', '06:30'),
        ('SABTU', '16:00', '17:30')
    ]

    for day, start, end in morning_schedules:
        schedules.append(ASASchedule(
            package_id=morning_package.id,
            day_name=day,
            start_time=datetime.strptime(start, '%H:%M').time(),
            end_time=datetime.strptime(end, '%H:%M').time()
        ))

    # Trial package schedules (same as regular afternoon schedule)
    trial_schedules = [
        ('SELASA', '16:00', '17:30'),
        ('KAMIS', '16:00', '17:30'),
        ('SABTU', '16:00', '17:30')
    ]

    for day, start, end in trial_schedules:
        schedules.append(ASASchedule(
            package_id=trial_package.id,
            day_name=day,
            start_time=datetime.strptime(start, '%H:%M').time(),
            end_time=datetime.strptime(end, '%H:%M').time()
        ))

    db.session.add_all(schedules)
    db.session.commit()

@app.route('/home')
@login_required
def home():
    # Add today's date
    today = datetime.now().date()
    
    # Get regular swimming school bookings
    swimming_school_bookings = Booking.query.filter_by(
        user_id=session['user_id']
    ).order_by(
        Booking.session_date.desc(),
        Booking.start_time
    ).all()
    
    # Group swimming school bookings by group_id
    grouped_bookings = {}
    single_bookings = []
    
    for booking in swimming_school_bookings:
        if booking.group_id:
            if booking.group_id not in grouped_bookings:
                grouped_bookings[booking.group_id] = []
            grouped_bookings[booking.group_id].append(booking)
        else:
            single_bookings.append(booking)
    
    # Get ASA club bookings
    asa_bookings = ASABooking.query.filter_by(
        user_id=session['user_id']
    ).order_by(
        ASABooking.booking_date.desc()
    ).all()
    
    return render_template('home.html',
                         grouped_bookings=grouped_bookings,
                         single_bookings=single_bookings,
                         asa_bookings=asa_bookings,
                         today=today)

@app.route('/admin')
@admin_required
def admin_dashboard():
    # Get filters from query params
    selected_date = request.args.get('date')
    selected_location = request.args.get('location', type=int)
    selected_time = request.args.get('time')

    if selected_date:
        selected_date = datetime.strptime(selected_date, '%Y-%m-%d').date()
    else:
        selected_date = datetime.now().date()

    # Base query
    bookings_query = Booking.query.filter(Booking.session_date == selected_date)

    # Apply filters
    if selected_location:
        bookings_query = bookings_query.filter(Booking.location_id == selected_location)
    if selected_time:
        bookings_query = bookings_query.filter(
            Booking.start_time == datetime.strptime(selected_time, '%H:%M').time()
        )

    # Get filtered bookings
    daily_bookings = bookings_query.order_by(
        Booking.start_time,
        Booking.location_id
    ).all()

    # Calculate bookings count
    bookings_count = {}
    for booking in daily_bookings:
        key = (booking.location_id, booking.start_time.strftime('%H:%M'))
        bookings_count[key] = bookings_count.get(key, 0) + 1

    # Get available times for filter
    available_times = db.session.query(distinct(Booking.start_time)).\
        order_by(Booking.start_time).\
        all()
    available_times = [time[0].strftime('%H:%M') for time in available_times]

    return render_template('admin/dashboard.html',
                         selected_date=selected_date,
                         selected_location=selected_location,
                         selected_time=selected_time,
                         daily_bookings=daily_bookings,
                         bookings_count=bookings_count,
                         locations=Location.query.all(),
                         available_times=available_times,
                         asa_bookings=ASABooking.query.all(),
                         asa_schedules=ASASchedule.query.all())

@app.route('/update_presence_batch', methods=['POST'])
@admin_required
def update_presence_batch():
    data = request.get_json()
    updates = data.get('updates', [])
    
    try:
        for update in updates:
            booking = Booking.query.get(update['booking_id'])
            if booking:
                booking.presence_status = update['presence_status']
                booking.notes = update['notes']
        
        db.session.commit()
        return jsonify({'success': True})
    except Exception as e:
        db.session.rollback()
        return jsonify({'success': False, 'error': str(e)})

@app.cli.command("create-admin")
def create_admin():
    """Create an admin user."""
    username = input("Enter admin username: ")
    email = input("Enter admin email: ")
    password = input("Enter admin password: ")
    
    try:
        admin = User(
            username=username,
            email=email,
            password_hash=generate_password_hash(password),
            is_admin=True
        )
        db.session.add(admin)
        db.session.commit()
        print("Admin user created successfully!")
    except Exception as e:
        db.session.rollback()
        print(f"Error creating admin user: {str(e)}")

@app.route('/admin/schedule_changes')
@admin_required
def admin_schedule_changes():
    # Get username filter from query parameters
    username_filter = request.args.get('username', '').strip()
    
    # Base query for all swimming school bookings
    bookings_query = Booking.query
    
    # Apply username filter if provided
    if username_filter:
        bookings_query = bookings_query.join(User).filter(
            User.username.ilike(f'%{username_filter}%')
        )
    else:
        # If no filter, don't show any bookings
        return render_template(
            'admin/schedule_changes.html',
            grouped_bookings={},
            single_bookings=[],
            locations=Location.query.all(),
            username_filter=''
        )
    
    # Get all bookings ordered by date
    bookings = bookings_query.order_by(
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
        'admin/schedule_changes.html',
        grouped_bookings=grouped_bookings,
        single_bookings=single_bookings,
        locations=Location.query.all(),
        username_filter=username_filter
    )

@app.route('/admin/update_schedule', methods=['POST'])
@admin_required
def update_schedule():
    try:
        booking_id = request.form.get('booking_id')
        new_date = request.form.get('new_date')
        new_time = request.form.get('new_time')
        
        if not all([booking_id, new_date, new_time]):
            return jsonify({
                'success': False,
                'message': 'Missing required information'
            })

        # Get the booking
        booking = Booking.query.get_or_404(booking_id)
        
        # Parse the new time slot (format: "HH:MM - HH:MM")
        start_time_str, end_time_str = new_time.split(' - ')
        new_start_time = datetime.strptime(start_time_str, '%H:%M').time()
        new_end_time = datetime.strptime(end_time_str, '%H:%M').time()
        
        # Update the booking with new date and time
        booking.session_date = datetime.strptime(new_date, '%Y-%m-%d').date()
        booking.start_time = new_start_time
        booking.end_time = new_end_time

        db.session.commit()
        
        return jsonify({
            'success': True,
            'message': 'Schedule updated successfully'
        })
        
    except Exception as e:
        db.session.rollback()
        print(f"Error updating schedule: {str(e)}")
        return jsonify({
            'success': False,
            'message': f'Error updating schedule: {str(e)}'
        })

@app.route('/check_quota_availability', methods=['POST'])
@admin_required
def check_quota_availability():
    try:
        booking_id = request.form.get('booking_id')
        new_date = request.form.get('new_date')
        new_time = request.form.get('new_time')  # New parameter for time slot
        location_id = request.form.get('location_id')
        
        if not all([booking_id, new_date, new_time]):
            return jsonify({
                'available': False,
                'message': 'Missing required information'
            })

        # Get the booking and its details
        booking = Booking.query.get_or_404(booking_id)
        
        # If no new location selected, use current location
        if not location_id:
            location_id = booking.location_id
        
        # Convert date string to datetime
        selected_date = datetime.strptime(new_date, '%Y-%m-%d').date()
        day_name = selected_date.strftime('%A')
        
        # Get time slot details
        time_parts = new_time.split('-')
        start_time = datetime.strptime(time_parts[0].strip(), '%H:%M').time()
        end_time = datetime.strptime(time_parts[1].strip(), '%H:%M').time()
        
        # Get quota for the selected location, day and time slot
        quota = Quota.query.filter_by(
            location_id=location_id,
            day_name=day_name,
            start_time=start_time,
            end_time=end_time
        ).first()
        
        if not quota:
            return jsonify({
                'available': False,
                'message': f'No schedule available for this time slot at the selected location'
            })
        
        # Count existing bookings
        existing_bookings = Booking.query.filter(
            Booking.location_id == location_id,
            Booking.session_date == selected_date,
            Booking.start_time == start_time,
            Booking.end_time == end_time,
            Booking.id != booking_id  # Exclude current booking
        ).count()
        
        available = existing_bookings < quota.quota
        remaining_slots = quota.quota - existing_bookings
        
        return jsonify({
            'available': available,
            'remaining_slots': remaining_slots,
            'message': f'Available slots: {remaining_slots}' if available else 'No slots available for this date and time'
        })
        
    except Exception as e:
        print(f"Error checking availability: {str(e)}")
        return jsonify({
            'available': False,
            'message': f'Error checking availability: {str(e)}'
        })

@app.route('/get_available_times', methods=['POST'])
@admin_required
def get_available_times():
    try:
        date = request.form.get('date')
        booking_id = request.form.get('booking_id')
        
        if not date or not booking_id:
            return jsonify({
                'success': False,
                'message': 'Date and booking ID are required'
            })
        
        # Get the booking to get its location
        booking = Booking.query.get_or_404(booking_id)
        location_id = booking.location_id
            
        # Convert date to day name (e.g., 'MONDAY', 'TUESDAY', etc.)
        day_name = datetime.strptime(date, '%Y-%m-%d').strftime('%A').upper()
        
        print(f"Fetching quotas for: Location={location_id}, Day={day_name}")  # Debug print
        
        # Get all quotas for this day and location
        quotas = Quota.query.filter_by(
            day_name=day_name,
            location_id=location_id
        ).all()
        
        print(f"Found {len(quotas)} quotas")  # Debug print
        
        time_slots = []
        for quota in quotas:
            time_slots.append({
                'id': quota.id,
                'time': f"{quota.start_time.strftime('%H:%M')} - {quota.end_time.strftime('%H:%M')}",
                'quota': quota.quota
            })
            print(f"Added time slot: {quota.start_time} - {quota.end_time}")  # Debug print
        
        return jsonify({
            'success': True,
            'time_slots': time_slots
        })
        
    except Exception as e:
        print(f"Error in get_available_times: {str(e)}")  # Debug print
        return jsonify({
            'success': False,
            'message': str(e)
        })

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5001)
