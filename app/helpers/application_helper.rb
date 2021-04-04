module ApplicationHelper

  def full_title(title = "")
    app_name = "Bottletter"
    title.empty? ? app_name
                 : "#{title} | #{app_name}"
  end
end
