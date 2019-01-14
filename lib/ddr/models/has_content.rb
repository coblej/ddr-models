module Ddr
  module Models
    module HasContent
      extend ActiveSupport::Concern

      included do
        attribute :content_identifier, Valkyrie::Types::String.optional
      end

      def content
        @content ||= storage_adapter.find_by(id: content_identifier)
      end

    end
  end
end
