# frozen_string_literal: true

require "./person_builder"

class PersonAddressBuilder

  attr_accessor :person, :person_builder

  # NOTE: I needed to ask for person_builder as parameter because
  #       ruby was not allowing to use inheriting from PersonBuilder and
  #       at the same time call the Address/Job builder on the PersonBuilder
  #       
  #       so now every method that changes the attribute, return the PersonBuilder
  #       to be able to chain changes
  # 
  def initialize person:, person_builder: nil
    @person         = person
    @person_builder = person_builder
  end

  def in_street street
    address[:street] = street

    person.address = address

    person_builder
  end

  def in_city city
    address[:city] = city

    person.address = address

    person_builder
  end

  def in_state_of state
    address[:state] = state

    person.address = address

    person_builder
  end

  def in_country country
    address[:country] = country

    person.address = address

    person_builder
  end

  private

  def address
    person.address
  end
end
