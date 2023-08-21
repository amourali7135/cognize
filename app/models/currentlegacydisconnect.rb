class Currentlegacydisconnect < ApplicationRecord
  belongs_to :currentlegacy

  validates :reason, presence: true, length: { minimum: 5 }
  validates :missing, presence: true, length: { minimum: 5 }
  validates :pleased, presence: true
end
