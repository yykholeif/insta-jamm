helpers do

  def login(musician)
    session[:musician_id] = musician.id
  end

  def logged_in?
    !!session[:musician_id]
  end

  def current_user
    if logged_in?
      User.find(session[:musician_id])
    end
  end

  def logout
    session[:musician_id] = nil
  end

end
