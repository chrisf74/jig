FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "test#{n}@example.com"
    end
    password "foobar"
    password_confirmation "foobar"
  end
end