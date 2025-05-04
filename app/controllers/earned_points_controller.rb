class EarnedPointsController < ApplicationController
  def get_point_histories
    render json: {
      earned_points: @current_user.serialized_earned_point
    }, status: :ok
  end
end
