#
# An Attachment is a miscellaneous content-bearing resource associated with a Collection.
#
# Example: A collection digitization QC information spreadsheet.
#
class Attachment < Ddr::Models::Base

  include Ddr::Models::HasContent

  attribute :is_attached_to_ids, Valkyrie::Types::Set.of(Valkyrie::Types::ID.optional).optional

  # TODO: Does this belong here?
  def publishable?
    false
  end

end
