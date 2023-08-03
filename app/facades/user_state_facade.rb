class UserStateFacade
  def get_states(user_id)
    state_ids = get_state_ids(user_id)
    find_states(state_ids)
  end

  def get_state_ids(user_id)
    UserState.where(user_id: user_id).pluck(:state_id)
  end

  def find_states(state_ids)
    State.where(id: state_ids)
  end
end
