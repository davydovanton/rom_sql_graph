module RomSqlGraph
  class Edges
    attr_reader :relations

    def initialize(repo)
      @relations = sql_relations(repo)
    end

    def to_a
      relations.map do |name, relation|
        relation.schema.associations.elements.map do |_, object|
          association_name = Inflecto.pluralize(object.target.to_sym.to_s).to_sym
          [name, association_name]
        end
      end.map! { |array| array.empty? ? nil : array }.compact.flatten(1)
    end

  private

    SQL = :sql

    def sql_relations(repo)
      repo.container.relations.elements
        .select { |name, object| object.class.adapter == SQL }
    end
  end
end
