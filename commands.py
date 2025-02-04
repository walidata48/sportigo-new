import click
from flask.cli import with_appcontext
from app import db, ASAPool, ASASchedule
from datetime import datetime

@click.command(name='init-asa')
@with_appcontext
def init_asa_command():
    """Initialize ASA pool data."""
    
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

    click.echo('ASA pool data initialized!') 