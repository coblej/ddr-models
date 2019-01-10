#
# A Collection is a conceptual and administrative entity containing a set of items.
#
class Collection < Ddr::Models::Base

  include Ddr::Models::HasStructMetadata

  def attachment_ids
    query_service.find_inverse_references_by(resource: self, property: 'is_attached_to_ids').to_a
  end

  def child_ids
    query_service.find_inverse_references_by(resource: self, property: 'is_member_of_collection_ids').to_a
  end

  alias_method :item_ids, :child_ids

  def target_ids
    query_service.find_inverse_references_by(resource: self, property: 'is_external_target_for_ids').to_a
  end

  private

  def query_service
    @query_service ||= Valkyrie.config.metadata_adapter.query_service
  end

end
