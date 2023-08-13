class Polypriority < ApplicationRecord
  belongs_to :priority, polymorphic: true
end
