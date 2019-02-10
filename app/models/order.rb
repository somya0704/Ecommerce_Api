class Order < ApplicationRecord
  before_validation :set_total!
  belongs_to :user
  validates :total, presence: true,
                      numericality: { greater_than_or_equal_to: 0 }

  validates :title, :user_id, presence: true
  has_many :placements
  has_many :products, through: :placements
  def set_total!
    self.total = products.map(&:price).sum
  end
  def order_params
  params.require(:order).permit(:product_ids => [])
end


end
