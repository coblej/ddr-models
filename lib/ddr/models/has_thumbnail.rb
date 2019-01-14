module Ddr
  module Models
    module HasThumbnail
      extend ActiveSupport::Concern

      included do
        attribute :thumbnail_identifier, Valkyrie::Types::String.optional
      end

    end
  end
end
