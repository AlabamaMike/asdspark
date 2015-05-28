class Cell
  attr_reader :row, :column
  attr_accessor :north, :south, :east, :west
  
  def initialize(row, column)
    @row = row
    @column = column
    @links = {}
  end
  
  def link(cell, bidi = true)
    @links[cell] = true
    cell.link(self, false) if bidi
    self
  end
  
  def unlink(cell, false)
    @links.delete(cell)
    cell.unlink(self, false) if bidi
    self
  end
  
  def links
    @links.keys
  end
  
  def linked?(cell)
    @links.keys?(cell)
  end
  
  def neighbors
    list = []
    list << north if north
    list << south if south
    list << east if east
    list << west if west
    list
  end
  
end
    