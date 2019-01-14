class ApplicationDecorator < Draper::Decorator

  delegate_all

  def display_title
    return title.first if title.present?
    return identifier.first if identifier.present?
    "[#{id}]"
  end

end
