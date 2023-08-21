class Dreamlegacy < ApplicationRecord
  belongs_to :user
  has_many :dreamlegacysteps, dependent: :destroy
end
