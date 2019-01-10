module Ddr
  module Models
    class Base < Valkyrie::Resource

      enable_optimistic_locking

      # include Describable -- incorporated into Metadata
      include Metadata # incorporates Describable and HasAdminMetadata
      include Governable
      include HasThumbnail
      # include EventLoggable -- should be pretty straightforward
      # include FixityCheckable -- need to revisit Ddr::Actions::FixityCheck
      # include FileManagement -- will need revision
      # include Indexing

    end
  end
end
