class Regretlist < ApplicationRecord
  belongs_to :user
  has_many :regrets, dependent: :destroy
end
