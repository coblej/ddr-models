class FindByIdentifierPostgres
  def self.queries
    [ :find_by_identifier ]
  end

  attr_reader :query_service
  delegate :resource_factory, to: :query_service
  delegate :orm_class, to: :resource_factory
  def initialize(query_service:)
    @query_service = query_service
  end

  def find_by_identifier(identifier:)
    internal_array = "[ \"#{identifier}\" ]"
    run_query(query, internal_array)
  end

  def query
    <<-SQL
      select * from orm_resources WHERE metadata->'identifier' @> ?
    SQL
  end

  def run_query(query, *args)
    orm_class.find_by_sql(([ query ] + args)).lazy.map do |object|
      resource_factory.to_resource(object: object)
    end
  end

end
