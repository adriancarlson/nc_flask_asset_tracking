"""empty message

Revision ID: 412b1aea1d70
Revises: 
Create Date: 2022-03-04 19:29:28.076813

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '412b1aea1d70'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('schools')
    op.drop_table('devices_users')
    op.drop_table('users')
    op.drop_table('user_accounts')
    op.drop_constraint('devices_serial_number_key', 'devices', type_='unique')
    op.drop_constraint('fk_devices_schools', 'devices', type_='foreignkey')
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_foreign_key('fk_devices_schools', 'devices', 'schools', ['school_id'], ['id'])
    op.create_unique_constraint('devices_serial_number_key', 'devices', ['serial_number'])
    op.create_table('user_accounts',
    sa.Column('id', sa.INTEGER(), server_default=sa.text("nextval('user_accounts_id_seq'::regclass)"), autoincrement=True, nullable=False),
    sa.Column('username', sa.TEXT(), autoincrement=False, nullable=False),
    sa.Column('password', sa.TEXT(), autoincrement=False, nullable=False),
    sa.Column('user_id', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], name='fk_user_accounts_users'),
    sa.PrimaryKeyConstraint('id', name='user_accounts_pkey'),
    sa.UniqueConstraint('username', name='user_accounts_username_key'),
    postgresql_ignore_search_path=False
    )
    op.create_table('users',
    sa.Column('id', sa.INTEGER(), server_default=sa.text("nextval('users_id_seq'::regclass)"), autoincrement=True, nullable=False),
    sa.Column('first_name', sa.TEXT(), autoincrement=False, nullable=False),
    sa.Column('last_name', sa.TEXT(), autoincrement=False, nullable=False),
    sa.Column('middle_name', sa.TEXT(), autoincrement=False, nullable=True),
    sa.Column('grade', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('user_type', sa.TEXT(), autoincrement=False, nullable=True),
    sa.Column('user_account_id', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.Column('school_id', sa.INTEGER(), autoincrement=False, nullable=True),
    sa.ForeignKeyConstraint(['school_id'], ['schools.id'], name='fk_users_schools'),
    sa.ForeignKeyConstraint(['user_account_id'], ['user_accounts.id'], name='fk_users_user_accounts_users'),
    sa.PrimaryKeyConstraint('id', name='users_pkey'),
    postgresql_ignore_search_path=False
    )
    op.create_table('devices_users',
    sa.Column('device_id', sa.INTEGER(), autoincrement=False, nullable=False),
    sa.Column('user_id', sa.INTEGER(), autoincrement=False, nullable=False),
    sa.ForeignKeyConstraint(['device_id'], ['devices.id'], name='fk_devices_users_devices'),
    sa.ForeignKeyConstraint(['user_id'], ['users.id'], name='fk_devices_users_users'),
    sa.PrimaryKeyConstraint('device_id', 'user_id', name='devices_users_pkey')
    )
    op.create_table('schools',
    sa.Column('id', sa.INTEGER(), autoincrement=True, nullable=False),
    sa.Column('name', sa.TEXT(), autoincrement=False, nullable=False),
    sa.Column('address_line_1', sa.TEXT(), autoincrement=False, nullable=False),
    sa.Column('address_line_2', sa.TEXT(), autoincrement=False, nullable=True),
    sa.Column('city', sa.TEXT(), autoincrement=False, nullable=False),
    sa.Column('state', sa.CHAR(length=2), autoincrement=False, nullable=False),
    sa.Column('zip', sa.INTEGER(), autoincrement=False, nullable=False),
    sa.PrimaryKeyConstraint('id', name='schools_pkey'),
    sa.UniqueConstraint('name', name='schools_name_key')
    )
    # ### end Alembic commands ###