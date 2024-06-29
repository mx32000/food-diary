# frozen_string_literal: true

# represents a food (and quantity of that food) eaten by a user at a given time
class Entry < ApplicationRecord
  belongs_to :food
  belongs_to :user
  validates :quantity, numericality: { greater_than: 0 }
end

# == Schema Information
#
# Table name: entries
#
#  id          :integer          not null, primary key
#  consumed_at :datetime
#  quantity    :float            default(1.0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  food_id     :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_entries_on_food_id  (food_id)
#  index_entries_on_user_id  (user_id)
#
# Foreign Keys
#
#  food_id  (food_id => foods.id)
#  user_id  (user_id => users.id)
#
