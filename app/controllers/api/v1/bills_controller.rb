class Api::V1::BillsController < ApplicationController
  def index
    fetch_bills = BillSearchFacade.new(params).bills#.paginate(:page => params[:page])
    if !Bill.present?
      render json: ApiBillSerializer.new(fetch_bills).paginate(:page => params[:page])
    else
      @bills = Bill.paginate(:page => params[:page])
      # @bills = ApiBillSerializer.new(Bill.where("state LIKE ?", "%#{params[:state]}%").page(params[:page]))
      render json: 
            {
              bills: @bills,
              page: @bills.current_page,
              pages: @bills.total_pages
            }
    end
  end

  def show
    bill_details = BillSearchFacade.new(params).bill
    render json: ApiBillSerializer.new(bill_details)
  end
end
