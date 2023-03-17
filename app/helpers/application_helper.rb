module ApplicationHelper
  def admin?
    current_operator.admin == true
  end

  def full_operator
    "#{current_operator.first_name} #{current_operator.last_name} - #{current_operator.category}"
  end

  def no_caaf_operator
    current_operator.category != "CAAF"
  end
end
