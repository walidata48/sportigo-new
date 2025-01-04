from app import app, db, Location, Quota, Booking, User
from datetime import time, datetime, timedelta
from werkzeug.security import generate_password_hash

with app.app_context():
    db.create_all()

    # Check if locations already exist
    if Location.query.count() == 0:
        # Add sample locations
        locations = [
            Location(name='Swimming Pool A'),
            Location(name='Swimming Pool B'),
            Location(name='Swimming Pool C')
        ]
        db.session.add_all(locations)
        db.session.commit()

        # Add quotas for each location
        days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
        time_slots = [
            (time(6, 0), time(9, 0)),  # 06:00-09:00
            (time(10, 0), time(12, 0)), # 10:00-12:00
            (time(14, 0), time(16, 0))  # 14:00-16:00
        ]

        quotas = []
        for location in locations:
            for day in days:
                for start_time, end_time in time_slots:
                    quota = Quota(
                        location_id=location.id,
                        day_name=day,
                        start_time=start_time,
                        end_time=end_time,
                        quota=10
                    )
                    quotas.append(quota)

        db.session.add_all(quotas)
        db.session.commit()
        print("Database initialized with sample data!")
    
    # Add sample users if they don't exist
    if User.query.count() == 0:
        sample_users = [
            {
                'username': 'john_doe',
                'email': 'john@example.com',
                'password': 'password123'
            },
            {
                'username': 'jane_smith',
                'email': 'jane@example.com',
                'password': 'password123'
            },
            {
                'username': 'bob_wilson',
                'email': 'bob@example.com',
                'password': 'password123'
            }
        ]

        users = []
        for user_data in sample_users:
            user = User(
                username=user_data['username'],
                email=user_data['email'],
                password_hash=generate_password_hash(user_data['password'])
            )
            users.append(user)
        
        db.session.add_all(users)
        db.session.commit()
        print("Sample users created!")

    # Add sample bookings if they don't exist
    if Booking.query.count() == 0:
        # Get existing users and locations
        users = User.query.all()
        locations = Location.query.all()
        quotas = Quota.query.all()

        # Create bookings for the next 7 days
        bookings = []
        today = datetime.now().date()
        
        for i in range(7):  # Next 7 days
            booking_date = today + timedelta(days=i)
            
            # Create 2 bookings per day
            for quota in quotas[:2]:  # Use first two time slots
                user = users[i % len(users)]  # Rotate through users
                location = locations[i % len(locations)]  # Rotate through locations
                
                booking = Booking(
                    user_id=user.id,
                    location_id=location.id,
                    session_date=booking_date,
                    start_time=quota.start_time,
                    end_time=quota.end_time
                )
                bookings.append(booking)

        db.session.add_all(bookings)
        db.session.commit()
        print(f"Created {len(bookings)} sample bookings!")
    else:
        print("Database already contains data. Skipping initialization.") 