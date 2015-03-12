module ApplicationHelper

  def log_in(developer)
    session[:developer_id] = developer.id
  end

  def current_developer
    @current_developer ||= Developer.find_by(id: session[:developer_id])
  end

  def logged_in?
    !current_developer.nil?
  end

end
