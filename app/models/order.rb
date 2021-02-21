class Order < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category

  with_options presence: true do
    validates :date
    validates :amount
  end

  validates :category_id, numericality: { other_than: 1 } 
  validates :amount,
  numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 9_999_999, message: 'out of setting range' }
end
