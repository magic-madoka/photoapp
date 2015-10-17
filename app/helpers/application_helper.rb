module ApplicationHelper

  def user_full_name user
    "#{user.name} #{user.last_name}"
  end
end
