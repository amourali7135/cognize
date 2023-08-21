class Currentlegacy < ApplicationRecord
  belongs_to :user
  has_many :currentlegacydisconnects, dependent: :destroy
end
