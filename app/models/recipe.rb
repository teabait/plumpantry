class Recipe < ActiveRecord::Base
  validates :yummly_object, presence: true
  has_and_belongs_to_many :users
end