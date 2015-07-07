FactoryGirl.define do
  factory(:user) do
    email('bob@aol.com')
    password('Password123')
    password_confirmation('Password123')
  end

  factory(:question) do
    text('How do you hamster')
  end

  factory(:answer) do
    text('Ask Kevin')
  end
end
