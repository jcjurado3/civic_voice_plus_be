class Api::V1::UserBillsController < ApplicationController
  def index
    user_bills = UserBillFacade.new.get_bills(params[:user_id])
    render json: BaseBillSerializer.new(user_bills)
  end

  def create
    if UserBill.find_by(user_id: params[:user_id], bill_id: params[:bill_id])
      render json: { "error": "User has already saved this bill" }, status: 422
    else
      user_bill = UserBill.create(user_id: params[:user_id], bill_id: params[:bill_id])
      render json: UserBillSerializer.new(user_bill), status: 201
    end
  end

  def destroy
    user_bill = UserBill.find_by(user_id: params[:user_id], bill_id: params[:bill_id])
    user_bill.destroy
  end
end