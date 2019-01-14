require 'mime-types'

module Ddr
  module Models
    module Captionable
      extend ActiveSupport::Concern

      included do
        attribute :caption_identifier, Valkyrie::Types::String.optional
        attribute :caption_type, Valkyrie::Types::String.optional # replaces '#caption_type'
      end

      def caption_extension
        extensions = Ddr::Models.preferred_file_extensions
        if extensions.include? caption_type
          extensions[caption_type]
        else
          default_extension(caption_type)
        end
      end

      def caption_path
        caption_file.disk_path
      end

      private

      def caption_file
        @caption_file ||= storage_adapter.find_by(id: caption_identifier)
      end

    end
  end
end
