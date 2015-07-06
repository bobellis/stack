FactoryGirl.define do
  factory(:user) do
    email('bob@aol.com')
    password('Password123')
    password_confirmation('Password123')
  end
end
