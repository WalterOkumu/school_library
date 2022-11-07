require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', _parent_permission: true)
    super(age, name, parent_permmission)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
