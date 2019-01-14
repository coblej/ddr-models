module Ddr
  module Models
    module HasMetadata
      extend ActiveSupport::Concern

      included do
        def can_have_metadata?
          true
        end

        # From Describable
        Ddr::Vocab::Vocabulary.term_names(RDF::Vocab::DC11).each do |term_name|
          attribute term_name, Valkyrie::Types::Set.optional
        end
        # From HasAdminMetadata
        # multivalued
        attribute :affiliation, Valkyrie::Types::Set.optional
        attribute :rights_note, Valkyrie::Types::Set.optional
        # single-valued
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
        attribute :workflow_state, Valkyrie::Types::String
      end

    end
  end
end
