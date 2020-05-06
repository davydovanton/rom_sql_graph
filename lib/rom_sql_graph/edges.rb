module RomSqlGraph
  class Edges
    attr_reader :relations, :table_names

    def initialize(rom_container)
      @relations = sql_relations(rom_container)
      @table_names = @relations.keys
    end

    def to_a
      relations
        .map { |name, relation| relation_associations(name, relation) }
        .map! { |array| array.empty? ? nil : array }
        .flatten(1).compact
    end

  private

    SQL = :sql

    def sql_relations(container)
      container.relations.elements
        .select { |name, object| object.class.adapter == SQL }
    end 

    def relation_associations(name, relation)
      relation.schema.associations.elements.map do |_, object|
        association_name = Inflecto.pluralize(object.target.to_sym.to_s).to_sym
        [name, association_name]
      end
    end
  end
end
