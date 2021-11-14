# frozen_string_literal: true

class Person

  attr_accessor :name, :address, :job

  def initialize name: "", address: {}, job: {}
    @name = name
    @address = address
    @job = job
  end

  def format_string
    <<-"HEREDOC"
      Person name: #{self.name}
      Lives:
        city: #{self.address[:city]},
        state: #{self.address[:state]},
        country: #{self.address[:country]},
      Works:
        company: #{self.job[:company_name]},
        salary hour: #{self.job[:salary]},
        currency: #{self.job[:currency]},
    HEREDOC
  end
end
