class Experiment < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :obstacles, presence: true, length: { minimum: 5 }
  validates :initiate, presence: true, length: { minimum: 5 }
  validates :priority, presence: true
  validates :current_status, presence: true
end
