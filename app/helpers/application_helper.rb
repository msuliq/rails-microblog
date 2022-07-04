# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  # provides full title to the webpage
  def full_title(page_title = '')
    base_title = 'Sample microblog app'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
