class Futureregret < ApplicationRecord
  belongs_to :futureregretlist

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :action, presence: true, length: { minimum: 5 }
  validates :priority, presence: true
  validates :root_cause, presence: true, length: { minimum: 5 }
  validates :obstacles, presence: true, length: { minimum: 5 }
  validates :prevention, presence: true, length: { minimum: 5 }
end
