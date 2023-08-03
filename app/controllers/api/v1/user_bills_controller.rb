class Api::V1::UserBillsController < ApplicationController
  def index
    user_bills = UserBillFacade.new.get_bills(params[:user_id])
    render json: ApiBillSerializer.new(user_bills)
  end

  def create
    if UserBill.find_by(user_id: params[:user_id], bill_id: params[:bill_id])
      render json: { "error": "User has already saved this bill" }, status: 422
    else
      new_bill = Bill.create!(bill_id: params[:bill_id])
      bill_id = new_bill.id

      user_bill = UserBill.create!(user_id: params[:user_id], bill_id: bill_id)
      render json: UserBillSerializer.new(user_bill), status: 201
    end
  end

  def destroy
    bill_id = params[:bill_id].to_i
    bill = Bill.find_by(bill_id: bill_id)
    user_bill = UserBill.find_by(user_id: params[:user_id], bill_id: bill.id)

    user_bill.destroy
  end
end