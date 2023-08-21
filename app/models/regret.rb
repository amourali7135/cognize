class Regret < ApplicationRecord
  belongs_to :regretlist
  
  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :root_cause, presence: true, length: { minimum: 5 }
  validates :prevention_later, presence: true, length: { minimum: 5 }
  validates :lesson_learned, presence: true, length: { minimum: 5 }
  validates :priority, presence: true
  validates :closure, presence: true
  validates :achieve_closure, presence: true, length: { minimum: 5 }


end
