"""Update models

Revision ID: efc324a03210
Revises: 
Create Date: 2024-06-20 15:13:19.752092

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'efc324a03210'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('user',
    sa.Column('id', sa.String(length=50), nullable=False),
    sa.Column('email', sa.String(length=100, collation='utf8mb4_vietnamese_ci'), nullable=True),
    sa.Column('phone', sa.String(length=50), nullable=True),
    sa.Column('password_hash', sa.String(length=255), nullable=True),
    sa.Column('gender', sa.Boolean(), nullable=True),
    sa.Column('full_name', sa.String(length=100, collation='utf8mb4_vietnamese_ci'), nullable=True),
    sa.Column('address', sa.Text(), nullable=True),
    sa.Column('avatar_url', sa.String(length=255), nullable=True),
    sa.Column('birthday', sa.DATE(), nullable=True),
    sa.Column('user_id_card', sa.String(length=255), nullable=True),
    sa.PrimaryKeyConstraint('id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('user')
    # ### end Alembic commands ###
