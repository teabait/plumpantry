class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  has_and_belongs_to_many :recipes
  has_secure_password

  def favorites
    self.recipes.map do |r|
      r.name
    end
  end
end