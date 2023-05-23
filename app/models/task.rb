class Task < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  validates :detail_memo, length: {maximum: 500}
  # validates :start_date, :end_date, order_date: true
  # def order_date
  #   if start_date > end_date
  #     errors.add(:order_date, "終了日は開始日より後に入力してください")
  #   end
  # end
end
