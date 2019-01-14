#
# A Collection is a conceptual and administrative entity containing a set of items.
#
class Collection < Ddr::Models::Base

  include Ddr::Models::HasAttachments
  include Ddr::Models::HasChildren
  include Ddr::Models::HasStructMetadata

  def child_ids
    query_service.find_inverse_references_by(resource: self, property: 'is_member_of_collection_ids').to_a
  end

  alias_method :item_ids, :child_ids

  def target_ids
    query_service.find_inverse_references_by(resource: self, property: 'is_external_target_for_ids').to_a
  end

end
