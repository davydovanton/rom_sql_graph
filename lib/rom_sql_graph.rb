require "rom_sql_graph/base"
require "rom_sql_graph/html_generation"
require "rom_sql_graph/edges"
require "rom_sql_graph/version"

module RomSqlGraph
  module_function def generate(rom_container)
    Base.new(rom_container)
  end
end
