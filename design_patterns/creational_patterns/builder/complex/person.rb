# frozen_string_literal: true

require_relative './person_builder'

class Person
  attr_accessor :name, :address, :job

  def initialize(name: '', address: {}, job: {})
    @name = name
    @address = address
    @job = job
  end

  # NOTE: this method is to avoid creating the Person by hand, instead
  #       the PersonBuilder should be used
  #
  def self.create
    PersonBuilder.new
  end

  def format_string
    <<-"HEREDOC"
      Person name: #{name}
      Lives:
        city: #{address[:city]},
        state: #{address[:state]},
        country: #{address[:country]},
      Works:
        company: #{job[:company_name]},
        salary hour: #{job[:salary]},
        currency: #{job[:currency]},
    HEREDOC
  end
end
