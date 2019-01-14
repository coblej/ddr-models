#
# A Target is digital scanner calibration artifact.
#
# A Target has a content file and is associated with a Collection OR one or more Components.
#
# See http://www.loc.gov/standards/mix/ and NISO Z39.87.
#
class Target < Ddr::Models::Base

  include Ddr::Models::HasContent

  attribute :is_external_target_for_id, Valkyrie::Types::Set.of(Valkyrie::Types::ID.optional).optional

  # TODO: Does this belong here?
  def publishable?
    false
  end

end
