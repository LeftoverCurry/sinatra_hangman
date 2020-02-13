# frozen_string_literal: true

def pull_or_create(user_name)
  if User.exists?(user_name: user_name)
    User.find_by(user_name: user_name)
  else
    # create new user
    User.create(user_name: user_name)
  end
end
