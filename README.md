# Reward Platform

A Ruby on Rails application for managing user rewards, points, and redemptions.

## Features

- User management with secure authentication
- Point earning and tracking system
- Tier-based rewards system (Silver, Gold, Platinum)
- Reward redemption functionality
- Merchant integration for point earning

## Models

### User
- Manages user accounts and authentication
- Tracks point balance and tier status
- Associated with earned points and redemptions

### EarnedPoint
- Records points earned from merchant transactions
- Tracks merchant, amount, and points earned
- Associated with users

### Reward
- Defines available rewards
- Specifies point requirements and categories
- Manages reward status (active/inactive)

### Redemption
- Records reward redemptions
- Tracks points spent
- Links users to rewards

## Database Schema

### Users
- name (string)
- email (string, unique)
- password_digest (string)
- timestamps

### EarnedPoints
- amount (decimal)
- merchant (string)
- point (integer)
- user_id (reference)
- timestamps

### Rewards
- name (string)
- category (string)
- points_required (integer)
- status (string)
- user_id (reference)
- timestamps

### Redemptions
- price (float)
- user_id (reference)
- reward_id (reference)
- timestamps

## Setup with Docker (recommended)
prerequisite: install docker on your machine.

`docker-compose build && docker-compose up`

## Setup(local)

1. Clone the repository
2. Install dependencies:
   ```bash
   bundle install
   ```
3. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   ```
4. Seed data:
   ```bash
   rails db:setup 

   rails db:migrate
   
   rails db:seed
   
   bin/rake "user:generate_rewards[test@test.com]"
   
   bin/rake "user:generate_earned_points[test@test.com]"
   ```

5. Start server:
  `rails s`

6. Go to http://localhost:5174/ and use email: test@test.com and password: password to login. (if you need more points just run `bin/rake "user:generate_rewards[test@test.com]"` more times)
  

## Testing

For demo purpose i only created unit tests for users model.

`rails test test/models/user_test.rb` => make sure you setup the local db for testing.

The application includes comprehensive test coverage for:
- User validations and authentication
- Point calculations and tier assignments
- Reward creation and management
- Redemption processing

Fixtures are provided for testing various scenarios:
- Users in different tiers
- Various reward types and categories
- Point earning and redemption scenarios

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.


