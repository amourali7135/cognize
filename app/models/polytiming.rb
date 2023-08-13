class Polytiming < ApplicationRecord
  belongs_to :era, polymorphic: true
end
