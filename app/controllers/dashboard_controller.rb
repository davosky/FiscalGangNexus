class DashboardController < ApplicationController
  def index
    @requests = Request.all
    @categories = Category.all
    @practices = Practice.all
    @operators = Operator.all.order(last_name: :asc)
    @subscribers_requests = Request.where.not(category_id: nil)
    @not_subscribers_requests = Request.where(category_id: nil)
    @processed_requests = Request.where(processed: true)
    @not_processed_requests = Request.where(unprocessable: true)
    @males = Request.where(sex_id: 2)
    @females = Request.where(sex_id: 1)
  end

  def credits
  end
end
