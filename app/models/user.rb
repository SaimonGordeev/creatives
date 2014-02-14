class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :trackable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable, :validatable

  has_many :creatives
  belongs_to :gallery
  has_many :comments, :dependent => :destroy

  def self.find_for_authentication(conditions)
    user = super
    return nil if user.lock?
    user
  end

  def admin?
    admin
  end

  def lock?
    locking
  end
end
