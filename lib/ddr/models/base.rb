module Ddr
  module Models
    class Base < Valkyrie::Resource

      enable_optimistic_locking

      include Describable
      # include HasMetadata # incorporates Describable and HasAdminMetadata
      include Governable
      include HasThumbnail
      # include EventLoggable -- should be pretty straightforward
      # include FixityCheckable -- need to revisit Ddr::Actions::FixityCheck
      # include FileManagement -- will need revision
      # include Indexing

      def persister
        @persister ||= Valkyrie.config.metadata_adapter.persister
      end

      def query_service
        @query_service ||= Valkyrie.config.metadata_adapter.query_service
      end

      def storage_adapter
        @storage_adapter ||= Valkyrie.config.storage_adapter
      end

      def default_extension(mime_type)
        mimetypes = MIME::Types[mime_type]
        return mimetypes.first.extensions.first unless mimetypes.empty?
        case mime_type
        when 'application/n-triples'
          'txt'
        else
          'bin' # DEFAULT_FILE_EXTENSION
        end
      end

      # From config/initializers/active_fedora_base.rb
      def can_have_attachments?
        false
      end

      def has_attachments?
        can_have_attachments? && attachments.size > 0
      end

      def can_have_children?
        false
      end

      def has_children?
        can_have_children? and children.size > 0
      end

      def can_have_content?
        attributes.keys.include? :content_identifier
      end

      def has_content?
        can_have_content? && content_identifier.present?
      end

      # Replaces '#describable?'
      def can_have_metadata?
        false
      end

      def governable?
        attributes.keys.include? :is_governed_by?
      end

      def has_admin_policy?
        governable? && admin_policy.present?
      end

      def can_have_struct_metadata?
        attributes.keys.include? :struct_metadata
      end

      def has_struct_metadata?
        can_have_struct_metadata? && struct_metadata.present?
      end

      def can_have_intermediate_file?
        attributes.keys.include? :intermediate_file_identifier
      end

      def has_intermediate_file?
        can_have_intermediate_file? && intermediate_file_identifier.present?
      end

      def can_have_multires_image?
        attributes.keys.include? :multires_image_identifier
      end

      def has_multires_image?
        can_have_multires_image? && multires_image_identifier.present?
      end

      def can_have_thumbnail?
        attributes.keys.include? :thumbnail_identifier
      end

      def has_thumbnail?
        can_have_thumbnail? && thumbnail_identifier.present?
      end

      def captionable?
        attributes.keys.include? :caption_identifier
      end

      def captioned?
        captionable? && caption_identifier.present?
      end

      def can_be_streamable?
        attributes.keys.include? :streamable_media_identifier
      end

      def streamable?
        can_be_streamable? && streamable_media_identifier.present?
      end

      def safe_id
        id.sub(/:/, "-")
      end

      # For duck-typing with SolrDocument
      def active_fedora_model
        self.class.to_s
      end

      def controller_name
        active_fedora_model.tableize
      end

    end
  end
end
