# frozen_string_literal: true

# NOTE: isn't a best practice have more than 10 parameters to initialize an
#       object, instead we can create it in a piecewise way, with creational patterns.
#
#       BUILDER PATTERN
#       "when piecewise object construction is complicated, provide an
#        API for doing it succinctly"

require './person'

# NOTE: be able to create a complex object using comprehensive methods
#
lucas = Person
        .create
        .name('Lucas')
        .works.at('Fetchly')
        .works.earning(25.00)
        .works.earning_in('Dolars')
        .works.as('Software Developer Engineer')
        .lives.in_street('Guilherme Pereira 120')
        .lives.in_city('Florianopolis')
        .lives.in_state_of('Santa Catarina')
        .lives.in_country('Brazil')
        .build

puts lucas.format_string

# Person name: Lucas
# Lives:
#   city: Florianopolis,
#   state: Santa Catarina,
#   country: Brazil,
# Works:
#   company: Fetchly,
#   salary hour: 25.00,
#   currency: Dolars
