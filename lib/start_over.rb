# frozen_string_literal: true

def start_over(user_name)
  user = User.find_by(user_name: user_name)
  user.destroy
end
