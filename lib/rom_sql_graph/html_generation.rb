require 'erb'

module RomSqlGraph
  class HtmlGeneration
    attr_reader :edges

    def initialize(edges)
      @edges = edges
    end

    def call
      html = ERB.new(File.read("#{File.dirname(__FILE__)}/templates/graph.erb")).result binding
      File.open("#{Dir.pwd}/graph.html", 'w') { |file| file.write(html) }
    end
  end
end
