class Api::V1::UserStatesController < ApplicationController
  def index
    user_states = UserStateFacade.new.get_states(params[:user_id])
    render json: StateSerializer.new(user_states)
  end

  def create
    u_state = UserState.find_by(user_id: params[:user_id])

    if u_state
      u_state.update!(user_id: params[:user_id], state_id: params[:state_id])
      render json: UserStateSerializer.new(u_state), status: 200
    else
      new_user_state = UserState.create(user_id: params[:user_id], state_id: params[:state_id])
      render json: UserStateSerializer.new(new_user_state), status: 201
    end
  end
end