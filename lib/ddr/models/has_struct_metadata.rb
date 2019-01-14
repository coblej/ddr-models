module Ddr
  module Models
    module HasStructMetadata
      extend ActiveSupport::Concern

      included do
        attribute :struct_metadata, Valkyrie::Types::String.optional
      end

      def structure
        if struct_metadata.present?
          Ddr::Models::Structure.new(Nokogiri::XML(struct_metadata))
        end
      end

    end
  end
end
