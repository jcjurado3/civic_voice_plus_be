class Api::V1::BillsController < ApplicationController
  def search
    @fetch_bills = BillSearchFacade.new(params).bills
    render json: ApiBillSerializer.new(@fetch_bills)
  end
end
