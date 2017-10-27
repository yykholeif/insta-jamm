helpers do
  def logged_in?
    !!session[:id]
  end

  def current_user
    @current_user ||= Musician.find(session[:id]) if logged_in?
  end
end
