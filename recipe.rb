class Recipe
  attr_reader :name, :description, :cooking_time, :difficulty
  attr_accessor :tested

  def initialize(attributes)
    @name = attributes[:name]
    @description = attributes[:description]
    @cooking_time = attributes[:cooking_time]
    attributes[:tested] == 'true' ? @tested = true : @tested = false
    @difficulty = attributes[:difficulty]
  end

  def tested?
    @tested
  end

  def mark_as_tested!
    @tested = true
  end
end
