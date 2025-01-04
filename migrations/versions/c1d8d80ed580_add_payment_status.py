"""add payment status

Revision ID: c1d8d80ed580
Revises: 3b2bfc1a6275
Create Date: 2025-01-04 19:27:09.302073

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'c1d8d80ed580'
down_revision = '3b2bfc1a6275'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('booking', schema=None) as batch_op:
        batch_op.add_column(sa.Column('payment_status', sa.String(length=20), nullable=True))
        batch_op.add_column(sa.Column('payment_date', sa.DateTime(), nullable=True))

    with op.batch_alter_table('quota', schema=None) as batch_op:
        batch_op.drop_constraint('quota_ibfk_1', type_='foreignkey')
        batch_op.create_foreign_key(None, 'location', ['location_id'], ['id'])

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('quota', schema=None) as batch_op:
        batch_op.drop_constraint(None, type_='foreignkey')
        batch_op.create_foreign_key('quota_ibfk_1', 'location', ['location_id'], ['id'], ondelete='CASCADE')

    with op.batch_alter_table('booking', schema=None) as batch_op:
        batch_op.drop_column('payment_date')
        batch_op.drop_column('payment_status')

    # ### end Alembic commands ###
