class Request < ApplicationRecord
  belongs_to :practice, optional: true
  belongs_to :category, optional: true
  belongs_to :operator, optional: true
  belongs_to :sex, optional: true

  enum sex: [:M, :F]

  before_create :set_name, :set_date

  def set_name
    last_name = Request.maximum(:name)
    self.name = last_name.to_i + 1
  end

  def set_date
    self.date = Date.today
  end

  before_save :set_first_call, :set_second_call, :set_third_call

  def set_first_call
    if first_call? && first_call_date?
    elsif first_call?
      self.first_call_date = Date.today
    end
  end

  def set_second_call
    if second_call? && second_call_date?
    elsif second_call?
      self.second_call_date = Date.today
    end
  end

  def set_third_call
    if third_call? && third_call_date?
    elsif third_call?
      self.third_call_date = Date.today
    end
  end

  def first_call?
    first_call
  end

  def first_call_date?
    first_call_date
  end

  def second_call?
    second_call
  end

  def second_call_date?
    second_call_date
  end

  def third_call?
    third_call
  end

  def third_call_date?
    third_call_date
  end

  def unprocessable?
    unprocessable
  end

  def subscriber?
    subscriber
  end

  def category?
    category_id
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sex, presence: true
  validates :mobile, presence: true
  validates :mobile, length: { maximum: 15 }
  validates :practice_id, presence: true
  validates :unprocessable_reason, presence: true, if: :unprocessable?
  validates :unprocessable, presence: true, if: :unprocessable_reason?
  validates :category_id, presence: true, if: :subscriber?
  validates :subscriber, presence: true, if: :category?

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "date", "email", "first_call", "first_call_date", "first_call_updater", "first_name", "id", "last_name", "mobile", "name", "note", "operator_id", "practice_id", "processed", "second_call", "second_call_date", "second_call_updater", "sex_id", "subscriber", "third_call", "third_call_date", "third_call_updater", "unprocessable", "unprocessable_reason", "updated_at", "updater"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "operator", "practice", "sex"]
  end
end
