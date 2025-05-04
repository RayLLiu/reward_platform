class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [ :signup, :signin ]

  def signup
    user = User.new(user_params)
    if user.save
      token = jwt_encode(user_id: user.id)
      render json: { token: token, user: user.as_json(except: :password_digest) }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def signin
    user = User.find_by(email: params[:email].downcase)
    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id)
      render json: { token: token, user: user.as_json(except: :password_digest) }
    else
      render json: { error: "Invalid email or password" }, status: :unauthorized
    end
  end

  def get_user_details
    render json: {
       name: @current_user.name,
       points_balance: @current_user.point_balance,
       points_accumulated: @current_user.all_points,
       points_redeemed: @current_user.points_used,
       redemption_history: @current_user.serialized_redemptions(5),
       rewards: @current_user.serialized_rewards(5),
       earned_points: @current_user.serialized_earned_point(5),
       tier: @current_user.tier,
       point_to_next_tier: @current_user.point_to_next_tier,
       next_tier: @current_user.next_tier
    }, status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
