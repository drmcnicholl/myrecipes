class Chef < ActiveRecord::Base
  validates :chefname, presence: true, length: { minimum: 3, maximum: 40}
  validates :email, presence: true, length: { minimum: 9, maximum: 100}
end