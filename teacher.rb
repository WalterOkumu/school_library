require_relative './person'

class Teacher < Person
  attr_reader :specialization, :type

  def initialize(specialization, age, name: 'Unknown', parent_permission: true, type: 'Teacher')
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
    @type = type
  end

  def can_use_services?
    true
  end
end
