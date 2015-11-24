require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid empty a name' do
    user = build(:user, name: '')
    expect(user).to be_invalid
  end

  it 'is invalid empty a email' do
    user = build(:user, email: '')
    expect(user).to be_invalid
  end

  it 'is invalid be too long' do
    user = build(:user, name: 'a'*256)
    expect(user).to be_invalid
  end

  it 'is invalid be too long' do
    user = build(:user, email: 'a'*256 + '@example.com')
    expect(user).to be_invalid
  end

  it 'reject invalid addresses' do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      user = build(:user, email: invalid_address)
      expect(user).to be_invalid
    end
  end

  it "email addresses be unique" do
    user = build(:user)
    duplicate_user = user.dup
    duplicate_user.email = user.email.upcase
    user.save
    expect(duplicate_user).to be_invalid
  end

  it "password be present (nonblank)" do
    user = build(:user)
    user.password = user.password_confirmation = " " * 8
    expect(user).to be_invalid
  end

  it "password have a minimum length" do
    user = build(:user)
    user.password = user.password_confirmation = "a" * 7
    expect(user).to be_invalid
  end
end
