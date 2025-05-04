require "dotenv/tasks"
require "random-word"

namespace :user do
  desc "Generate earned points list for a specific user by email"
  task :generate_earned_points, [ :email ] => :environment do |task, args|
    unless args[:email]
      puts "Error: Email is required"
      puts "Usage: bin/rake \"user:generate_earned_points[{email}]\" "
      exit 1
    end

    email = args[:email].strip

    user = User.find_by(email: email)

    sample_store = [ "KFC", "MC", "Burger King", "168 Sushi" ]
    20.times do
      amount = rand(50..100)
      user.earned_points.create(
        merchant: sample_store.sample,
        amount: amount,
        point: amount
      )
    end
  end

  desc "Generate rewards list for a specific user by email"
  task :generate_rewards, [ :email ] => :environment do |task, args|
    unless args[:email]
      puts "Error: Email is required"
      puts "Usage: bin/rake \"user:generate_rewards[{email}]\" "
      exit 1
    end

    email = args[:email].strip

    user = User.find_by(email: email)

    sample_status = [ "active", "expired" ]

    20.times do
      amount = rand(1..50)
      user.rewards.create(
        name: RandomWord.nouns.next,
        category: Reward::AVAILABLE_CATEGORIES.sample,
        points_required: amount * 100,
        status: sample_status.sample
      )
    end
  end
end
