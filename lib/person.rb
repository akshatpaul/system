# person class is responsible for initializing name and time of creation for user object.

class Person
  attr_accessor :name, :created_at

  def initialize(name, created_at = Time.now)
    @name, @created_at = name, created_at
  end

end
