module ApplicationHelper
  include ActionView::Helpers::DateHelper
  
  def localize_time(time)
    return time_ago_in_words(time)
  end
  
  def current_user?(user)
    current_user == user
  end
  
end