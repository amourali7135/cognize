class Polylistitem < ApplicationRecord
  belongs_to :list_item, polymorphic: true
end
