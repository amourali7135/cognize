class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :regretlist, dependent: :destroy
  has_many :regrets, through: :regretlist

  has_one :currentlegacy, dependent: :destroy
  has_many :currentlegacydisconnects, through: :currentlegacy

  has_one :futureregretlist, dependent: :destroy
  has_many :futureregrets, through: :futureregretlist

  has_one :badhabitlist, dependent: :destroy
  has_many :badhabits, through: :badhabitlist

  has_one :dreamlegacy, dependent: :destroy
  has_many :dreamlegacysteps, through: :dreamlegacy

  has_many :experiments, dependent: :destroy
end
