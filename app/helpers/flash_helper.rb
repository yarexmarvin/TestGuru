module FlashHelper
    
  def flash_messages(messages)
    flashes_html = messages.map do |key, value|
      content_tag(:p, value.to_s.html_safe, class: "alert alert-#{key === "alert" ? "danger" : "primary"}")
    end.join("").html_safe
  end
end
