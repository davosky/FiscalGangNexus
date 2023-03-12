class RequestsController < ApplicationController
  before_action :set_request, only: %i[ show edit update destroy ]

  def index
    @operator = current_operator
    @q = Request.ransack(params[:q])
    @requests = if @operator.category == "CESI" || @operator.category == "CAAF" || @operator.category == "AMMINISTRAZIONE"
        @q.result(distinct: true).order("created_at DESC").page(params[:page])
      else
        @q.result(distinct: true).order("created_at DESC").where(operator_id: current_operator.id).page(params[:page])
      end
  end

  def show
    @request = Request.find(params[:id])
  end

  def new
    @request = Request.new
  end

  def edit
  end

  def create
    @request = current_operator.requests.build(request_params)

    if @request.save
      redirect_to requests_path, notice: "request was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @operator = current_operator
    @full_operator = "#{@operator.first_name} #{@operator.last_name}"
    @request.updater = @full_operator
    if @request.update(request_params)
      redirect_to requests_path, notice: "request was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @request.destroy
    redirect_to requests_url, notice: "request was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_request
    @request = Request.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def request_params
    params.require(:request).permit(:name, :date, :practice_id, :first_name, :last_name, :mobile, :email, :subscriber, :category_id, :note, :operator_id, :processed, :updater, :unprocessable, :unprocessable_reason, :first_call, :second_call, :third_call, :first_call_date, :second_call_date, :third_call_date, :first_call_updater, :second_call_updater, :third_call_updater)
  end
end
