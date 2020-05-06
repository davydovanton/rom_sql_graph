module RomSqlGraph
  class Edges
    attr_reader :relations, :table_names

    def initialize(rom_container)
      @relations = sql_relations(rom_container)
      @table_names = @relations.keys
      @schema = db_schema(@relations)

      pp @schema
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
        .select { |_table_name, object| object.class.adapter == SQL }
    end 

    def db_schema(relations)
      relations.map do |_table, relation|
        schema = relation.schema

        {
          table_name: schema.name.to_s,
          columns: schema.attributes.map do |attr|
            {
              name: attr.name.to_s,
              type: attr.options[:type].to_ast
              # **type_and_index(attr.options[:type])
            }
          end
        }
      end

    end

    def type_and_index(type)
      if type.respond_to?(:primitive)
        {
          type: type.primitive,
          index: type.meta[:index].to_a
        }
      else
        {
          type: type.meta[:db_type] || "#{type.left.type.primitive} | #{type.right.primitive}",
          # type: type.meta[:db_type],
          index: []
        }
      end

    end

    def relation_associations(name, relation)
      relation.schema.associations.elements.map do |_, object|
        association_name = Inflecto.pluralize(object.target.to_sym.to_s).to_sym
        [name, association_name]
      end
    end
  end
end
