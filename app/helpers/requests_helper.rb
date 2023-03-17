module RequestsHelper
  def customer(request)
    "#{request.first_name} #{request.last_name}"
  end

  def request_creator(request)
    "#{request.operator.first_name} #{request.operator.last_name}"
  end

  def request_creator_phone(request)
    "#{request.operator.phone}"
  end

  def request_creator_category(request)
    "#{request.operator.category}"
  end

  def is_subscriber(request)
    subscription_status = ""
    unless request.subscriber != true
      if request.sex_id == 1
        subscription_status = "Iscritta&emsp;<i class='fa-solid fa-square text-danger'></i>"
      elsif request.sex_id == 2
        subscription_status = "Iscritto&emsp;<i class='fa-solid fa-square text-danger'></i>"
      else
        subscription_status = "Iscritt*&emsp;<i class='fa-solid fa-square text-danger'></i>"
      end
    else
      if request.sex_id == 1
        subscription_status = "Non Iscritta&emsp;<i class='fa-solid fa-square text-success'></i>"
      elsif request.sex_id == 2
        subscription_status = "Non Iscritto&emsp;<i class='fa-solid fa-square text-success'></i>"
      else
        subscription_status = "Non Iscritt*&emsp;<i class='fa-solid fa-square text-success'></i>"
      end
    end
    subscription_status.html_safe
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

  def gender_icon(request)
    gendericon = ""
    if request.sex_id == 1
      gendericon = "<i class='fa-solid fa-venus'></i>"
    elsif request.sex_id == 2
      gendericon = "<i class='fa-solid fa-mars'></i>"
    else
      gendericon = "<i class='fa-solid fa-venus-mars'></i>"
    end
    gendericon.html_safe
  end
end
