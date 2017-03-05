require 'rgl/adjacency'
require 'rgl/dot'

module RomSqlGraph
  class Base
    attr_reader :repo

    def initialize(repo)
      @repo = repo
    end

    def edges
      Edges.new(repo).to_a
    end
    alias_method :to_a, :edges

    def generate_image
      graph.write_to_graphic_file('jpg')
    end

    def to_s
      graph.edges.sort.to_s
    end

  private

    def graph
      if @graph.nil?
        @graph ||= RGL::DirectedAdjacencyGraph[]
        to_a.each { |edge| graph.add_edge(*edge) }
      end

      @graph
    end
  end
end
