require 'rails_helper'

RSpec.describe FindByIdentifierPostgres do
  let(:adapter) { Valkyrie::MetadataAdapter.find(:postgres) }
  before do
    class TestResource < Ddr::Models::Base; end
  end
  after do
    Object.send(:remove_const, :TestResource)
  end
  let(:resource_class) { TestResource }
  let(:query_service) { adapter.query_service }
  let(:persister) { adapter.persister }
  subject { adapter.query_service.custom_queries }

  before do
    allow(Valkyrie.config).to receive(:standardize_query_result).and_return(true)
  end

  describe '.find_by_identifier' do
    it 'returns an array of matching resources' do
      resource = resource_class.new
      resource.identifier = [ '123456' ]
      resource = persister.save(resource: resource)
      found = subject.find_by_identifier(identifier: resource.identifier.first).first
      expect(found.id).to eq resource.id
      expect(found).to be_persisted
    end
  end

end
