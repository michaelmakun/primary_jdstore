class Order < ApplicationRecord
  before_create :generate_token
  belongs_to :user

  validates_presence_of :billing_name
  validates_presence_of :billing_address
  validates_presence_of :shipping_name
  validates_presence_of :shipping_address

  has_many :product_lists
  def generate_token
    self.token = SecureRandom.uuid
  end
end
