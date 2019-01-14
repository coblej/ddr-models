# frozen_string_literal: true
class Component < Ddr::Models::Base

  include Ddr::Models::Captionable
  include Ddr::Models::HasContent

  attribute :is_part_of_ids, Valkyrie::Types::Set.of(Valkyrie::Types::ID.optional).optional

  alias_method :item_ids, :is_part_of_ids

  def item_id
    item_ids.present? ? item_ids.first : nil
  end

  alias_method :parent_id, :item_id
  alias_method :parent_ids, :item_ids

  def target_ids
    query_service.find_inverse_references_by(resource: self, property: 'is_external_target_for_ids').to_a
  end

end
