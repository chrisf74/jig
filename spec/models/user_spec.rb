require 'spec_helper'

describe User do
  before :each do
    @user = User.new(email:"foo@example.com", password_digest:"foo")
  end

  it "should have email" do
    @user.valid?.should == true
  end

  it "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    @user.valid?.should_not == true
  end

  it "should allow valid email addresses" do
    valid_addresses = %w[
      user@example.com 
      USER@foo.COM 
      A_US-ER@foo.bar.org
      first.last@foo.jp alice+bob@baz.cn
    ]

    valid_addresses.each do |valid_address|
      @user.email = valid_address
      @user.valid?.should == true
    end
  end

  it "email validation should reject invalid addresses" do
    invalid_addresses = %w[
      user@example,com 
      user_at_foo.org 
      user.name@example.
      foo@bar_baz.com foo@bar+baz.com 
      foo@bar..com
    ]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      @user.valid?.should_not == true
    end
  end 
end