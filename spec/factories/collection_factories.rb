FactoryBot.define do

  factory :collection do
    to_create do |instance|
      Valkyrie.config.metadata_adapter.persister.save(resource: instance)
    end
    id { build(:valkyrie_id) }
    title { [ 'Test Collection' ] }
    admin_set { 'foo' }
    sequence(:identifier) { |n| [ "coll%05d" % n ] }
  end

end
