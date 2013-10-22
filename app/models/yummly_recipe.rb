class YummlyRecipe < ActiveRecord::Base
  validates :yummly_id, :yummly_name, presence: true

end