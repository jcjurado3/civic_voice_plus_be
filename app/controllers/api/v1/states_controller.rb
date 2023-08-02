class Api::V1::StatesController < ApplicationController
  def index
    render json: StateSerializer.new(State.all)
  end
end