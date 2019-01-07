class ChangeSetPersister

  # Simplified version of CHO ChangeSetPersister -
  # https://github.com/psu-libraries/cho/blob/master/app/valkyrie/change_set_persister.rb
  attr_reader :metadata_adapter, :storage_adapter
  delegate :persister, :query_service, to: :metadata_adapter
  def initialize(metadata_adapter:, storage_adapter:)
    @metadata_adapter = metadata_adapter
    @storage_adapter = storage_adapter
  end

  def save(change_set:)
    persister.save(resource: change_set.resource)
  end

end
