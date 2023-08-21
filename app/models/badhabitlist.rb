class Badhabitlist < ApplicationRecord
  belongs_to :user
  has_many :badhabits, dependent: :destroy
end
