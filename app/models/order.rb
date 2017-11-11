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

  def set_payment_with!(method)
    self.update_columns(payment_method: method)
  end

  def pay!
    self.update_columns(is_paid: true)
  end
end
