module RequestsHelper
  def customer(request)
    "#{request.first_name} #{request.last_name}"
  end

  def unupdatable(request)
    request.processed == true || request.first_call == true || request.second_call == true || request.third_call == true || request.unprocessable == true
  end

  def processed(request)
    if request.processed == true
      "tr-processed shadow"
    elsif request.unprocessable == true
      "tr-unprocessed shadow"
    else
      "tr-regular shadow"
    end
  end

  def first_call_check(request)
    request.first_call? || request.processed? || request.unprocessable?
  end

  def second_call_check(request)
    request.second_call? || request.processed? || request.unprocessable?
  end

  def third_call_check(request)
    request.third_call? || request.processed? || request.unprocessable?
  end

  def processed_check(request)
    request.processed == true || request.unprocessable == true
  end

  def unprocessable_check(request)
    request.unprocessable == true || request.processed == true
  end

  def deleteable(request)
    request.first_call == true \
      || request.second_call == true \
      || request.third_call == true \
      || request.processed == true \
      || request.unprocessable == true
  end

  def call_display(request)
    phone = ""
    if request.first_call == true && request.second_call != true && request.third_call != true
      phone = "<i class='fa-solid fa-phone-volume text-primary'></i>"
    elsif request.first_call == true && request.second_call == true && request.third_call != true
      phone = "<i class='fa-solid fa-phone-volume text-primary'></i>&nbsp;<i class='fa-solid fa-phone-volume text-primary'></i>"
    elsif request.first_call == true && request.second_call == true && request.third_call == true
      phone = "<i class='fa-solid fa-phone-volume text-primary'></i>&nbsp;<i class='fa-solid fa-phone-volume text-primary'></i>&nbsp;<i class='fa-solid fa-phone-volume text-primary'></i>"
    else
    end
    phone.html_safe
  end
end
