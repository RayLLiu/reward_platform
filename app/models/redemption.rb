class Redemption < ApplicationRecord
    def reward
        @reward ||= Reward.find(reward_id)
    end
end
