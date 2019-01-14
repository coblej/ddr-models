module Ddr
  module Models
    module HasAttachments
      extend ActiveSupport::Concern

      included do
        def can_have_attachments?
          true
        end

        def attachments
          query_service.find_inverse_references_by(resource: self, property: 'is_attached_to_ids')
        end
      end

    end
  end
end
