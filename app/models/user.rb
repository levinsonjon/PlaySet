class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
# has many :requests
# has_many :setlists, through: :requests

#  devise :database_authenticatable, :registerable,
#          :recoverable, :rememberable, :trackable, :validatable
end
