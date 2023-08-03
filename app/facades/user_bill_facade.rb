class UserBillFacade
  def get_bills(user_id)
    bill_ids = get_bill_ids(user_id)
    find_bills(bill_ids)
  end

  def get_bill_ids(user_id)
    UserBill.where(user_id: user_id).pluck(:bill_id)
  end

  def find_bills(bill_ids)
    Bill.where(id: bill_ids)
  end
end
