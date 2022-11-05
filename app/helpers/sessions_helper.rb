module SessionsHelper
    
  def show_flash
    content_tag(:p, flash[:alert], class: 'flash alert')
  end
end
