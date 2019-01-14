module Ddr
  module Models
    module HasIntermediateFile
      extend ActiveSupport::Concern

      included do
        attribute :intermediate_file_identifier, Valkyrie::Types::String.optional
        attribute :intermediate_type, Valkyrie::Types::String.optional # replaces '#intermediate_type'

        # include FileManagement
      end

      def intermediate_extension
        extensions = Ddr::Models.preferred_file_extensions
        if extensions.include? intermediate_type
          extensions[intermediate_type]
        else
          default_extension(caption_type)
        end
      end

      def intermediate_file
        @intermediate_file ||= storage_adapter.find_by(id: intermediate_file_identifier)
      end

      def intermediate_path
        intermediate_file.disk_path
      end

    end
  end
end
