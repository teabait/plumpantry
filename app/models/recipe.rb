class Recipe < ActiveRecord::Base
  validates :yummly_id, presence: true
  has_and_belongs_to_many :users, :ingredients
end