require 'byebug'

class Thing
  attr_accessor :name, :parent, :chain, :v_chain

  def initialize(name, parent: nil)
    @name   = name
    @parent = parent
    @chain   = []
    @v_chain = []
  end

  def create_method(method_name, *args, &block)
    self.class.define_method method_name.to_sym, &block
    self
  end

  def handle_block(&block)
    instance_eval(&block)
  end

  def method_missing(method_name, *args, &block)
    if method_name.to_s.include?("is") || method_name.to_s.include?("the") || method_name.to_s.include?("can")
      @chain << method_name.to_s
      return self
    end

    if method_name.to_s.include?("ha")
      @chain   << method_name.to_s
      @v_chain << args.first
      return self
    end

    if method_name.to_s.split("").last == "?"
      s = method_name.to_s.split("")
      m = "#{s[0..s.size - 2].join("")}".to_sym

      return self.public_send(m) if self.methods.include?(m)
    end

    return (@spoke || []) if method_name == :spoke

    chain_method = @chain.pop

    case chain_method
    when "is_not_a"
      return create_method(method_name) { false }
    when "is_a"
      return create_method(method_name) { true }
    when "has", "having"
      qtde = @v_chain.pop
      arr = ArrayThing.new

      qtde.times { arr << Thing.new(method_name.to_s, parent: self) }

      response = qtde == 1 ? arr.first : arr

      create_method(method_name) { return response }

      return response
    when "is_the", "being_the", "and_the"
      @chain << method_name
      return self
    when "can"
      self.define_singleton_method(method_name) do |*as|
        as.tap do |arg|
          @spoke ||= []
          @spoke << instance_exec(arg.first, &block)
          return @spoke.last
        end
      end
    end

    self.define_singleton_method(chain_method) { method_name.to_s }
    self
  end
end

class ArrayThing < Array
  def each(&block)
    i = 0

    while i <= self.length - 1
      thing = self[i]
      thing.tap do
        thing.handle_block(&block)
      end

      i += 1
    end
  end
end
