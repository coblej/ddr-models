module Ddr::Models
  module Streamable
    extend ActiveSupport::Concern

    included do
      attribute :streamable_media_identifier, Valkyrie::Types::String.optional
      attribute :streamable_media_type, Valkyrie::Types::String.optional # replaces '#streamable_media_type'
    end

    def streamable_media
      @streamable_media ||= storage_adapter.find_by(id: streamable_media_identifier)
    end

    def streamable_media_extension
      extensions = Ddr::Models.preferred_file_extensions
      if extensions.include? streamable_media_type
        extensions[streamable_media_type]
      else
        default_extension(streamable_media_type)
      end
    end

    def streamable_media_path
      streamable_media.disk_path
    end

  end
end
