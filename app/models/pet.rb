class Pet < ApplicationRecord
  has_and_belongs_to_many :dog_walkings
end
