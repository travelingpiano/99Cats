class CatRentalRequestsController < ApplicationController
  def index
    @requests = CatRentalRequest.all
    render :index
  end

  def update
    @request = CatRentalRequest.find_by(id: params[:id])
    if @request.update_attributes(cat_rental_requests_params)
      render :show
    else
      redirect_to edit_cat_rental_request_url
    end
  end

  def edit
    @request = CatRentalRequest.find_by(id: params[:id])
    if @request
      render :edit
    else
      redirect_to cat_rental_requests_url
    end
  end

  def create
    @request = CatRentalRequest.new(cat_rental_requests_params)
    if @request.save
      render :index
    else
      redirect_to new_cat_rental_request_url
    end
  end

  def new
    @request = CatRentalRequest.new
    render :new
  end

  def destroy
  end

  def show
    @request = CatRentalRequest.find_by(id: params[:id])
    if @request
      render :show
    else
      redirect_to cat_rental_requests_url
    end
  end

  private
  def cat_rental_requests_params
    params.require(:cat_rental_request).permit(:cat_id,:start_date,:end_date,:status)
  end
end
