module Ddr
  module Models
    module Governable
      extend ActiveSupport::Concern

      included do
        attribute :is_governed_by, Valkyrie::Types::ID.optional
      end

    end
  end
end
