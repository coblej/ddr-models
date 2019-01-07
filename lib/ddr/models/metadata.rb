module Ddr
  module Models
    module Metadata
      extend ActiveSupport::Concern

      included do
        # Default type is Valkyrie::Types::Set.optional
        # From Describable
        attribute :contributor
        attribute :coverage
        attribute :creator
        attribute :date
        attribute :description
        attribute :format
        attribute :identifier
        attribute :language
        attribute :publisher
        attribute :relation
        attribute :rights
        attribute :source
        attribute :subject
        attribute :title
        attribute :type
        # From HasAdminMetadata
        attribute :affiliation
        attribute :admin_set, Valkyrie::Types::String
        attribute :aleph_id, Valkyrie::Types::String
        attribute :aspace_id, Valkyrie::Types::String
        attribute :depositor, Valkyrie::Types::String
        attribute :display_format, Valkyrie::Types::String
        attribute :doi, Valkyrie::Types::String
        attribute :ead_id, Valkyrie::Types::String
        attribute :ingested_by, Valkyrie::Types::String
        attribute :ingestion_date, Valkyrie::Types::String
        attribute :is_locked, Valkyrie::Types::Bool
        attribute :license, Valkyrie::Types::String
        attribute :local_id, Valkyrie::Types::String
        attribute :nested_path, Valkyrie::Types::String
        attribute :permanent_id, Valkyrie::Types::String
        attribute :permanent_url, Valkyrie::Types::String
        attribute :research_help_contact, Valkyrie::Types::String
        attribute :rights_note
        attribute :workflow_state, Valkyrie::Types::String
      end

    end
  end
end
