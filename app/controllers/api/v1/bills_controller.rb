class Api::V1::BillsController < ApplicationController
  def index
    fetch_bills = BillSearchFacade.new(params).bills
    render json: ApiBillSerializer.new(fetch_bills)
  end

  def show
    bill_details = BillSearchFacade.new(params).bill
    render json: ApiBillSerializer.new(bill_details)
  end
end
