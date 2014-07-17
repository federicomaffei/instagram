# This will guess the User class
FactoryGirl.define do
  factory :user do
   	email 'customer@yo.com'
   	password '12345678'
   	password_confirmation '12345678'
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email 'admin@admin.com'
   	password '12345678'
   	password_confirmation '12345678'
  end
end