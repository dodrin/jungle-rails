require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validation' do
    it 'should create a valid user' do
      user = User.create(
        first_name: 'Kuma',
        last_name: 'Kumatest',
        email: 'test@test.com',
        password: 'test123',
        password_confirmation: 'test123'
      )
      expect(user).to be_valid
    end

    # Step 1 tests
    it 'should have matching password and password_confirmation' do
      user = User.create(
        first_name: 'Kuma',
        last_name: 'Kumatest',
        email: 'test@test.com',
        password: 'test123',
        password_confirmation: 'test345'
      )
      expect(user).not_to be_valid
    end

    it 'is not valid if the email is not unique' do
      user1 = User.create(
        first_name: 'Kuma',
        last_name: 'Kumatest',
        email: 'test@test.com',
        password: 'test123',
        password_confirmation: 'test345'
      )

      user2 = User.create(
        first_name: 'Tanuki',
        last_name: 'Araikuma',
        email: 'TEST@TEST.com',
        password: 'test123',
        password_confirmation: 'test345'
      )
      expect(user2).to_not be_valid
    end

    it 'should have email' do
      user = User.create(
        first_name: 'Kuma',
        last_name: 'Kumatest',
        password: 'test123',
        password_confirmation: 'test345'
      )
      expect(user).to_not be_valid
    end

    it 'should have first name' do
      user = User.create(
        last_name: 'Kumatest',
        email: 'test@test.com',
        password: 'test123',
        password_confirmation: 'test345'
      )
      expect(user).to_not be_valid    
    end
    
    it 'should have last name' do
      user = User.create(
        first_name: 'Kuma',
        email: 'test@test.com',
        password: 'test123',
        password_confirmation: 'test345'
      )
      expect(user).to_not be_valid    
    end

    it 'should have password' do
      user = User.create(
        first_name: 'Kuma',
        last_name: 'test',
        email: 'test@test.com',
        password_confirmation: 'test345'
      )
      expect(user).to_not be_valid   
    end

    it 'should have password confirmation' do
      user = User.create(
        first_name: 'Kuma',
        last_name: 'test',
        email: 'test@test.com',
        password: 'test123'
      )
      expect(user).to_not be_valid   
    end

    # Step 2 test
    it 'should have minimum 5 characters of password' do
      user = User.create(
        first_name: 'Kuma',
        last_name: 'Kumada',
        email: 'test@test.com',
        password: 'test',
        password_confirmation: 'test'
      )
      expect(user).to_not be_valid   
    end
  end

  describe 'authenticate_with_credentials' do
    it 'returns nil if password is incorrect' do
      user = User.create(
        first_name: 'Rina',
        last_name: 'Kuma',
        email: 'test@test.com',
        password: 'password',
        password_confirmation: 'password',
      )

      auth = User.authenticate_with_credentials('test@test.com', 'kuma')
      expect(auth).to be_nil

    end
  end
end
