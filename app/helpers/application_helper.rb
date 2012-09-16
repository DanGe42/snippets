module ApplicationHelper
  def better_button_to (button_text, action_path, form_options = {}, button_options = {})
    form_tag(action_path, form_options) do
      content_tag(:div, :class => "visible-fields") do
        tag(:input, {:type => "submit", :value => button_text}.merge(button_options), true)
      end
    end
  end
end
