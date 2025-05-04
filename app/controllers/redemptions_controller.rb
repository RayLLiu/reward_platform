class RedemptionsController < ApplicationController
  def purchase
    reward = @current_user.rewards.where(id: redeem_params["reward_id"]).first
    if @current_user.point_balance < reward.points_required
      render json: { error: "Insufficient points" }, status: :unprocessable_entity
    else
      ActiveRecord::Base.transaction do
        redemption = @current_user.redemptions.new(
          price: reward.points_required,
          reward_id: reward.id
        )

        redemption.save!
      end

      render json: {}, status: :ok
    end
  end

  def get_redemptions
    render json: {
      redemptions: @current_user.serialized_redemptions
    }, status: :ok
  end

  private

  def redeem_params
    params.require(:redemption).permit(:reward_id)
  end
end
