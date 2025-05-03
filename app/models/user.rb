class User < ApplicationRecord
    has_many :rewards, dependent: :destroy_async
end
