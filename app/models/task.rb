class Task < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  validates :title, length: {maximum: 20}
  validates :detail_memo, length: {maximum: 500}
  validate :end_date, :end_date_cannnot_before_start_date

  def end_date_cannnot_before_start_date
    if end_date < start_date
      errors.add(:end_date, "の日付を開始日より後にしてください")
    end
  end
end
