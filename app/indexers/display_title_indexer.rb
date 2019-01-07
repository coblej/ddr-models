# frozen_string_literal: true

class DisplayTitleIndexer

  attr_reader :resource

  def initialize(resource:)
    @resource = resource
  end

  def to_solr
    return {} unless decorated_resource.try(:display_title)
    { display_title_ssim: decorated_resource.display_title }
  end

  def decorated_resource
    @decorated_resource ||= resource.decorate
  end

end
