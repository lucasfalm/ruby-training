# frozen_string_literal: true

class PersonJobBuilder
  attr_accessor :person, :person_builder

  # NOTE: I needed to ask for person_builder as parameter because
  #       ruby was not allowing to use inheriting from PersonBuilder and
  #       at the same time call the Address/Job builder on the PersonBuilder
  #
  #       so now every method that changes the attribute, return the PersonBuilder
  #       to be able to chain changes
  #
  def initialize(person:, person_builder: nil)
    @person         = person
    @person_builder = person_builder
  end

  def at(company_name)
    job[:company_name] = company_name

    person.job = job

    person_builder
  end

  def earning(salary)
    job[:salary] = salary

    person.job = job

    person_builder
  end

  def earning_in(currency)
    job[:currency] = currency

    person.job = job

    person_builder
  end

  def as(job_title)
    job[:title] = job_title

    person.job = job

    person_builder
  end

  private

  def job
    person.job
  end
end
