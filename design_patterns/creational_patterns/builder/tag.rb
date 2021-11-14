require_relative "./html_builder"

class Tag

  attr_reader :name, :text
  attr_accessor :children

  DEFAULT_IDENTATION = 2

  def initialize name:, text: nil
    @name = name
    @text = text
    @children = []
  end

  def self.create name:, text: nil
    HtmlBuilder.new root_name: name, root_text: text
  end

  def format_string identation: DEFAULT_IDENTATION
    html = []
    html << "<#{name}>\n"

    children.each do |child|
      identation = " " * DEFAULT_IDENTATION

      html << format_child(child: child, identation: identation)
    end

    html << "</#{name}>\n"
    html.flatten.join(" ")
  end

  def add_child name:, text: nil
    children << self.class.new(name: name, text: text)

    self
  end

  def format_child child:, identation: DEFAULT_IDENTATION
    final_format = []

    if child.text.nil? && child.children.empty?
      final_format << "#{identation}<#{child.name}></#{child.name}>\n"

    elsif !child.text.nil? && child.children.empty?
      final_format << "#{identation}<#{child.name}>#{child.text}</#{child.name}>\n"

    elsif child.text.nil? && !child.children.empty?
      final_format << "#{identation}<#{child.name}>\n"

      child.children.each do |sub_child|
        final_format << format_child(child: sub_child, identation: identation * 2)
      end

      final_format << "#{identation}</#{child.name}>\n"
    end

    final_format.flatten
  end
end
