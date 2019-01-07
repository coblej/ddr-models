module Ddr
  module Models
    class Base < Valkyrie::Resource

      enable_optimistic_locking

      include Metadata
      include Valkyrie::Resource::AccessControls

    end
  end
end
