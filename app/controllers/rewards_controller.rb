class RewardsController < ApplicationController
  def get_rewards
    render json: {
       rewards: @current_user.serialized_rewards
    }, status: :ok
  end
end
