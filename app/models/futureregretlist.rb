class Futureregretlist < ApplicationRecord
  belongs_to :user
  has_many :futureregrets, dependent: :destroy
end
