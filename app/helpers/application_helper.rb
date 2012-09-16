module ApplicationHelper
  include ActionView::Helpers::DateHelper
  
  def localize_time(time)
    return time_ago_in_words(time)
  end
  
end