require 'byebug'

class Thing
  attr_accessor :name, :chain, :has_chain

  def initialize(name)
    @name      = name
    @chain     = []
    @has_chain = []
  end

  def create_method(method_name, *args, &block)
    self.define_singleton_method method_name.to_sym, &block
    self
  end

  def handle_block(&block)
    instance_eval(&block)
  end

  private

  def method_missing(method_name, *args, &block)
    if chain_method?(method_name)
      @chain << method_name.to_s
      return self
    end

    if chain_method_with_value?(method_name)
      @chain     << method_name.to_s
      @has_chain << args.first
      return self
    end

    if question_method?(method_name)
      method = method_name.to_s.delete("?").to_sym
      return self.public_send(method) if self.methods.include?(method)
    end

    chain_method = @chain.pop

    case chain_method
    when "is_not_a"                       then create_method(method_name) { false }
    when "is_a"                           then create_method(method_name) { true }
    when "has", "having"                  then create_things(method_name)
    when "is_the", "being_the", "and_the" then chain_again(method_name)
    when "can"                            then create_skill(method_name, &block)
    else
      self.define_singleton_method(chain_method) { method_name.to_s }
      self
    end
  end

  def is_spoke?(method)
    method == :spoke
  end

  def chain_method?(method)
    method.to_s.include?("is") ||
    method.to_s.include?("the") ||
    method.to_s.include?("can")
  end

  def chain_method_with_value?(method)
    method.to_s.include? "ha"
  end

  def question_method?(method)
    method.to_s.include? "?"
  end

  def chain_again(method)
    @chain << method
    return self
  end

  def create_things(name)
    qtde = @has_chain.pop
    arr  = ArrayThing.new

    qtde.times { arr << Thing.new(name.to_s) }

    response = qtde == 1 ? arr.first : arr

    create_method(name) { return response }

    response
  end

  def create_skill(method, &block)
    self.define_singleton_method(method) do |*in_args|
      in_args.tap do |arg|
        @spoke ||= []
        @spoke  << instance_exec(arg.first, &block)

        self.define_singleton_method(:spoke) { @spoke }
        return @spoke.last
      end
    end
  end
end

class ArrayThing < Array
  def each(&block)
    current_iteration = 0
    things_qtde       = self.length - 1

    while current_iteration <= things_qtde
      self[current_iteration].tap { |thing| thing.handle_block(&block) }

      current_iteration += 1
    end
  end
end
