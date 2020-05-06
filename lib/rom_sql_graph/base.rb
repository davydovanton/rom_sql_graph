require 'rgl/adjacency'
require 'rgl/dot'

module RomSqlGraph
  class Base
    attr_reader :rom_container

    def initialize(rom_container)
      @rom_container = rom_container
    end

    def edges
      @edges ||= Edges.new(rom_container).to_a
    end
    alias_method :to_a, :edges

    def generate_image
      graph.write_to_graphic_file('jpg')
    end

    def generate_html
      HtmlGeneration.new(edges).call
    end

    def to_s
      graph.edges.sort.to_s
    end

  private

    def graph
      if @graph.nil?
        @graph ||= RGL::DirectedAdjacencyGraph[]

        edges
          .map { |edge| edge.sort }.uniq
          .each { |edge| graph.add_edge(*edge) }
      end

      @graph
    end
  end
end
