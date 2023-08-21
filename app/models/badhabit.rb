class Badhabit < ApplicationRecord
  belongs_to :badhabitlist

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :reason, presence: true, length: { minimum: 5 }
  validates :initiate, presence: true, length: { minimum: 5 }
  validates :priority, presence: true
  validates :obstacles, presence: true, length: { minimum: 5 }
  validates :current_status, presence: true
  
end
