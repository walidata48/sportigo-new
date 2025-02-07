"""add recurring payment

Revision ID: 63cb2802e810
Revises: 97f3d520dafa
Create Date: 2025-02-07 10:39:35.222327

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '63cb2802e810'
down_revision = '97f3d520dafa'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('asa_bookings', schema=None) as batch_op:
        batch_op.add_column(sa.Column('recurring_payment_date', sa.Integer(), nullable=True))
        batch_op.add_column(sa.Column('next_payment_date', sa.Date(), nullable=True))
        batch_op.add_column(sa.Column('is_active', sa.Boolean(), nullable=True))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('asa_bookings', schema=None) as batch_op:
        batch_op.drop_column('is_active')
        batch_op.drop_column('next_payment_date')
        batch_op.drop_column('recurring_payment_date')

    # ### end Alembic commands ###
