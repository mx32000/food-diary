# frozen_string_literal: true

# represents a food (and quantity of that food) eaten by a user at a given time
class Entry < ApplicationRecord
  belongs_to :food
  belongs_to :user
  validates :quantity, numericality: { greater_than: 0 }
end
