class Service < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 5}
  validates :price, presence: true, numericality: true
end
