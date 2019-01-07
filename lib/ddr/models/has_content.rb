module Ddr
  module Models
    module HasContent
      extend ActiveSupport::Concern

      included do
        attribute :content_identifier, Valkyrie::Types::String
      end

    end
  end
end
