#
# An Item is a  member of a Collection -- i.e., a "work" -- the principal describable resource.
#
# Examples: photograph, book, article, sound recording, video, etc.
#
class Item < Ddr::Models::Base

  include Ddr::Models::HasStructMetadata

  attribute :is_member_of_collection_ids, Valkyrie::Types::Set.of(Valkyrie::Types::ID.optional).optional

  alias_method :collection_ids, :is_member_of_collection_ids

  def child_ids
    query_service.find_inverse_references_by(resource: self, property: 'is_part_of_ids').to_a
  end

  def collection_id
    collection_ids.present? ? collection_ids.first : nil
  end

  alias_method :component_ids, :child_ids

  alias_method :parent_id, :collection_id
  alias_method :parent_ids, :collection_ids

  alias_method :part_ids, :child_ids

  private

  def query_service
    @query_service ||= Valkyrie.config.metadata_adapter.query_service
  end

end
