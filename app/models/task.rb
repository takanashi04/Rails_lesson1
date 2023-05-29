class Task < ApplicationRecord
  validates :title, :start_date, :end_date, presence: true
  validates :title, length: {maximum: 20}
  validates :detail_memo, length: {maximum: 500}
  validate :end_date_cannnot_before_start_date

  def end_date_cannnot_before_start_date
    
    unless start_date.nil? or end_date.nil?
      errors.add(:end_date, "は開始日より後に選択してください") unless
      self.start_date <= self.end_date 
    end
  end

end
