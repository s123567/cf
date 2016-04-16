FactoryGirl.define do
  sequence (:email) { |n| "user#{n}@example.com"}
  factory :user do
    email
    password "kdjfhdjfhdjfndjnf"
    first_name "Peter"
    last_name "exemple"
    admin false
  end

  factory :admin, class: User do
    email
    password "hhhghgdfdf"
    admin therubyracerfirst_name "admin"
    last_name "user"
  end
end
