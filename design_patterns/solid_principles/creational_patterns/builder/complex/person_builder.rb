# frozen_string_literal: true

require "./person"
require "./person_address_builder"
require "./person_job_builder"

class PersonBuilder

  attr_accessor :person

  def initialize person = Person.new
    @person = person
  end

  def build
    person
  end

  def name name
    person.name = name

    self
  end

  def lives
    PersonAddressBuilder.new person: person, person_builder: self
  end

  def works
    PersonJobBuilder.new person: person, person_builder: self
  end

  def format_string
    <<-"HEREDOC"
      Person name: #{person.name}
      Lives:
        city: #{person.address[:city]},
        state: #{person.address[:state]},
        country: #{person.address[:country]},
      Works:
        company: #{person.job[:company_name]},
        salary: #{person.job[:salary]},
        currency: #{person.job[:currency]},
    HEREDOC
  end
end
