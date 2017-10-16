helpers do

  def login(user)
    session[:user_id] = user.id
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    if logged_in?
      User.find(session[:user_id])
    end
  end

  def logout
    session[:user_id] = nil
  end

end
