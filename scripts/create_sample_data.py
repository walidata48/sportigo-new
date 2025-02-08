from app import app, db, Coach, Pool
import json

def create_sample_data():
    with app.app_context():
        # Delete existing data
        Coach.query.delete()
        Pool.query.delete()
        
        # Sample Coaches
        coaches = [
            Coach(
                name="John Anderson",
                profile_image="/static/images/coaches/coach1.jpg",  # You'll need to add actual images
                specialization="Competitive Swimming",
                experience_years=15,
                bio="""Coach John Anderson is a former national swimming champion with over 15 years of coaching experience. 
                He specializes in competitive swimming techniques and has trained multiple regional champions. 
                His coaching philosophy emphasizes proper technique, mental preparation, and personalized training plans.""",
                certifications="""ASCA Level 4 Certification
USA Swimming Coach Certification
Red Cross Water Safety Instructor
Advanced Life Support Certification
High Performance Coaching Certificate""",
                achievements="""Coached 3 National Swimming Champions
Developed 12 Regional Record Holders
2018 Coach of the Year - Regional Swimming Association
Former National Team Coach
Published Author of "Advanced Swimming Techniques\"""",
                is_active=True
            ),
            Coach(
                name="Sarah Martinez",
                profile_image="/static/images/coaches/coach2.jpg",
                specialization="Youth Development",
                experience_years=8,
                bio="""Sarah Martinez is passionate about introducing young swimmers to the sport. 
                With a background in child development and competitive swimming, she creates engaging 
                and effective training programs that focus on building confidence and proper technique.""",
                certifications="""Youth Swimming Development Specialist
Early Childhood Swimming Instructor
Water Safety Instructor
First Aid and CPR Certified
Child Psychology Certificate""",
                achievements="""Developed award-winning youth swimming program
Featured in Swimming World Magazine
2020 Youth Coach of the Year
Successfully trained over 1000 young swimmers
Created innovative learn-to-swim methodology""",
                is_active=True
            ),
            Coach(
                name="Michael Chen",
                profile_image="/static/images/coaches/coach3.jpg",
                specialization="Performance Training",
                experience_years=12,
                bio="""Michael Chen combines his background in sports science with advanced swimming techniques 
                to help athletes reach their peak performance. His holistic approach includes nutrition guidance, 
                mental conditioning, and advanced training methodologies.""",
                certifications="""Masters in Sports Science
Elite Performance Coach Certification
Swimming Biomechanics Specialist
Sports Nutrition Advisor
Mental Performance Coaching Certificate""",
                achievements="""Trained 2 Olympic Swimmers
Developed 5 National Record Holders
International Swimming Conference Speaker
Published Research on Swimming Biomechanics
Sports Science Innovation Award 2019""",
                is_active=True
            )
        ]
        
        # Sample Pools
        pools = [
            Pool(
                name="Aqua Center Elite",
                address="123 Swimming Lane, Waterfront District",
                description="""Our flagship facility features an Olympic-sized swimming pool with state-of-the-art 
                training equipment and facilities. The pool maintains perfect temperature control and uses the latest 
                in water purification technology.""",
                features="""Olympic-sized pool,Electronic timing system,Diving platforms,Heated pool,
                Spectator seating,Professional starting blocks,Anti-wave lane lines,Underwater viewing windows""",
                main_image="/static/images/pools/pool1_main.jpg",
                gallery_images="/static/images/pools/pool1_gallery1.jpg,/static/images/pools/pool1_gallery2.jpg,/static/images/pools/pool1_gallery3.jpg",
                opening_hours=json.dumps({
                    "Monday": "6:00 AM - 9:00 PM",
                    "Tuesday": "6:00 AM - 9:00 PM",
                    "Wednesday": "6:00 AM - 9:00 PM",
                    "Thursday": "6:00 AM - 9:00 PM",
                    "Friday": "6:00 AM - 8:00 PM",
                    "Saturday": "7:00 AM - 6:00 PM",
                    "Sunday": "8:00 AM - 4:00 PM"
                }),
                contact_info="Phone: (555) 123-4567\nEmail: info@aquacenterelite.com",
                is_active=True
            ),
            Pool(
                name="Sunshine Swimming Complex",
                address="456 Beach Road, Coastal Area",
                description="""A modern swimming facility designed for both training and recreation. Features multiple 
                pools including a dedicated training pool, leisure pool, and children's pool. The complex offers 
                a bright, welcoming atmosphere with excellent natural lighting.""",
                features="""Multiple pools,Children's pool,Leisure pool,Training pool,
                Modern changing rooms,Cafe,Pro shop,Parking facilities""",
                main_image="/static/images/pools/pool2_main.jpg",
                gallery_images="/static/images/pools/pool2_gallery1.jpg,/static/images/pools/pool2_gallery2.jpg,/static/images/pools/pool2_gallery3.jpg",
                opening_hours=json.dumps({
                    "Monday": "7:00 AM - 8:00 PM",
                    "Tuesday": "7:00 AM - 8:00 PM",
                    "Wednesday": "7:00 AM - 8:00 PM",
                    "Thursday": "7:00 AM - 8:00 PM",
                    "Friday": "7:00 AM - 7:00 PM",
                    "Saturday": "8:00 AM - 6:00 PM",
                    "Sunday": "8:00 AM - 4:00 PM"
                }),
                contact_info="Phone: (555) 987-6543\nEmail: contact@sunshineswim.com",
                is_active=True
            ),
            Pool(
                name="Downtown Swim Center",
                address="789 Urban Street, City Center",
                description="""Conveniently located in the heart of the city, our facility offers professional 
                swimming training in an urban setting. The indoor heated pool is perfect for year-round swimming 
                with modern amenities and expert staff.""",
                features="""Indoor heated pool,Professional coaching,Fitness center,Sauna,
                Steam room,Massage services,Locker rooms,Swimming gear shop""",
                main_image="/static/images/pools/pool3_main.jpg",
                gallery_images="/static/images/pools/pool3_gallery1.jpg,/static/images/pools/pool3_gallery2.jpg,/static/images/pools/pool3_gallery3.jpg",
                opening_hours=json.dumps({
                    "Monday": "5:30 AM - 10:00 PM",
                    "Tuesday": "5:30 AM - 10:00 PM",
                    "Wednesday": "5:30 AM - 10:00 PM",
                    "Thursday": "5:30 AM - 10:00 PM",
                    "Friday": "5:30 AM - 9:00 PM",
                    "Saturday": "7:00 AM - 8:00 PM",
                    "Sunday": "7:00 AM - 6:00 PM"
                }),
                contact_info="Phone: (555) 246-8135\nEmail: info@downtownswim.com",
                is_active=True
            )
        ]

        # Add to database
        db.session.add_all(coaches)
        db.session.add_all(pools)
        
        # Commit changes
        try:
            db.session.commit()
            print("Sample data created successfully!")
        except Exception as e:
            db.session.rollback()
            print(f"Error creating sample data: {str(e)}")

if __name__ == "__main__":
    create_sample_data() 