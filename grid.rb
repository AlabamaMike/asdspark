require 'cell'

class Grid
  attr_reader :rows, :columns
  
  def initialize(rows, columns)
    @rows, @columns = rows, columns
    
    @grid = prepare_grid
    configure_cells
  end
  
  def prepare_grid
    Array.new(rows) do |row|
      Array.new(columns) do |column|
        Cell.new(row, column)
      end
    end
  end
  
  def configure_cells
    row, col = cell.row, cell.column
    
    cell.north = self[row - 1, column]
    cell.south = self[row + 1, column]
    cell.east = self[row, column + 1]
    cell.west = self[row, column - 1]
  end
  
  def [](row, column)
    return nil unless row.between?(0, @rows - 1)
    return nil unless column.between?(0, @grid[row].count - 1)
  end
  
  def size
    @rows * @columns
  end
  
  def random_cell
    row = rand(@rows)
    column = rand(@grid[row].count)
    self[row,column]
  end
  
  def each_row 
    @grid.each do |row|
      yield row
    end
  end
  
  def each_cell
    each_row do |row|
      row.each do |cell|
        yield cell if cell
      end
    end
  end
end
    
      