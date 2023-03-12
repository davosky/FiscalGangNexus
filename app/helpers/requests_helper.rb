module RequestsHelper
  def customer(request)
    "#{request.first_name} #{request.last_name}"
  end

  def unupdatable(request)
    request.processed == true || request.first_call == true || request.second_call == true || request.third_call == true
  end

  def processed(request)
    unless request.processed == true
      "tr-processed"
    else
      "tr-unprocessed"
    end
  end
end
