class Dreamlegacystep < ApplicationRecord
  belongs_to :dreamlegacy

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :obstacles, presence: true, length: { minimum: 5 }
  validates :initiate, presence: true, length: { minimum: 5 }
  validates :current_status, presence: true
end
