class Api::V1::BillsController < ApplicationController
  def index
    fetch_bills = BillSearchFacade.new(params).bills

    if fetch_bills
      render json: ApiBillSerializer.new(fetch_bills)
    # else
    #   render json: {data: { no bills found}}
    end
  end

  def show
    bill_details = BillSearchFacade.new(params).bill
    render json: ApiBillSerializer.new(bill_details)
  end
end
