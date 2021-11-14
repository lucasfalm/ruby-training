# frozen_string_literal: true

class Person

  attr_accessor :name, :address, :job

  def initialize name: "", address: {}, job: {}
    @name = name
    @address = address
    @job = job
  end
end
