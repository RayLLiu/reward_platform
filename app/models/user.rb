class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :name, presence: true

  before_save :downcase_email

  has_many :redemptions, dependent: :destroy_async
  has_many :rewards, dependent: :destroy_async
  has_many :earned_points, dependent: :destroy_async

  def tier
    @tier ||= calculate_tier
  end

  def next_tier
    case tier
    when "Silver"
      "Gold"
    when "Gold"
      "Platinum"
    else
      "Platinum"
    end
  end

  def point_to_next_tier
    case tier
    when "Silver"
      1000 - point_balance
    when "Gold"
      5000 - point_balance
    else
      0
    end
  end

  def point_balance
    all_points - points_used
  end

  def all_points
    earned_points.sum(&:point)
  end

  def points_used
    redemptions.sum(&:price)
  end

  def serialized_earned_point(size = nil)
    points = if size
      earned_points.last(size)
    else
      earned_points
    end

    points.map do |p|
      {
        id: p.id,
        date: p.created_at,
        merchant: p.merchant,
        amount: p.amount,
        point: p.point
      }
    end
  end

  def serialized_redemptions(size = nil)
    filtered_redemptions = if size
      redemptions.last(size)
    else
      redemptions
    end

    filtered_redemptions.map do |r|
      reward = r.reward
      {
        id: r.id,
        date: r.created_at,
        name: reward.name || "empty",
        category: reward&.category,
        price: r.price
      }
    end
  end

  def serialized_rewards(size = nil)
    filtered_rewards = if size
      rewards.last(size)
    else
      rewards
    end

    filtered_rewards.map do |r|
      {
        id: r.id,
        date: r.created_at,
        name: r.name,
        category: r.category,
        points_required: r.points_required
      }
    end
  end

  private

  def calculate_tier
    case point_balance
    when 0..1000
      "Silver"
    when 1001..5000
      "Gold"
    else
      "Platinum"
    end
  end

  def downcase_email
    self.email = email.downcase
  end
end
