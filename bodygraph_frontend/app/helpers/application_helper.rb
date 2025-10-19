module ApplicationHelper
  def planet_symbol(planet)
    symbols = {
      'sun' => '☉',
      'earth' => '⊕',
      'north_node' => '☊',
      'south_node' => '☋',
      'moon' => '☽',
      'mercury' => '☿',
      'venus' => '♀',
      'mars' => '♂',
      'jupiter' => '♃',
      'saturn' => '♄',
      'uranus' => '♅',
      'neptune' => '♆',
      'pluto' => '♇'
    }
    symbols[planet] || planet
  end

  def opposite_gate(gate)
    index = GATES.index(gate.to_i)
    OPPOSITE_GATES[index]
  end

  private

  GATES = [41, 19, 13, 49, 30, 55, 37, 63, 22, 36, 25, 17, 21, 51, 42, 3, 27, 24, 2, 23, 8,
           20, 16, 35, 45, 12, 15, 52, 39, 53, 62, 56, 31, 33, 7, 4, 29, 59, 40, 64, 47, 6,
           46, 18, 48, 57, 32, 50, 28, 44, 1, 43, 14, 34, 9, 5, 26, 11, 10, 58, 38, 54, 61, 60].freeze

  OPPOSITE_GATES = [31, 33, 7, 4, 29, 59, 40, 64, 47, 6, 46, 18, 48, 57, 32, 50, 28, 44, 1, 43, 14, 34,
                    9, 5, 26, 11, 10, 58, 38, 54, 61, 60, 41, 19, 13, 49, 30, 55, 37, 63, 22, 36, 25,
                    17, 21, 51, 42, 3, 27, 24, 2, 23, 8, 20, 16, 35, 45, 12, 15, 52, 39, 53, 62, 56].freeze
end
