"""add payment

Revision ID: 96865d1104ab
Revises: c1d8d80ed580
Create Date: 2025-01-04 19:42:32.490099

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = '96865d1104ab'
down_revision = 'c1d8d80ed580'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('booking', schema=None) as batch_op:
        batch_op.drop_column('payment_date')

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('booking', schema=None) as batch_op:
        batch_op.add_column(sa.Column('payment_date', mysql.DATETIME(), nullable=True))

    # ### end Alembic commands ###
