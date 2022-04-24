# frozen_string_literal: true

require_relative './html_builder'

class Tag
  attr_reader :name, :text
  attr_accessor :children

  DEFAULT_IDENTATION = 2

  def initialize(name:, text: nil)
    @name = name
    @text = text
    @children = []
  end

  def self.create(name:, text: nil)
    # NOTE: when using the Builder pattern it's really common to have
    #       a method to create the builder inside of the class related to it,
    #       forcing the users to use the builder instead of creating
    #       the class directly
    #
    HtmlBuilder.new root_name: name, root_text: text
  end

  # NOTE: this method can be extract to a separated class, that cares just
  #       about formating as string the HTML. But just for convinience it's defined here
  def format_string(identation: DEFAULT_IDENTATION)
    html = []
    html << "<#{name}>\n"

    children.each do |child|
      html << format_child(child: child, identation: identation)
    end

    html << "</#{name}>\n"
    html.flatten.join(' ')
  end

  def add_child(name:, text: nil)
    children << self.class.new(name: name, text: text)

    self
  end

  private

  def format_child(child:, identation:)
    final_format = []

    identation_space = ' ' * identation

    if child.text.nil? && child.children.empty?
      final_format << "#{identation_space}<#{child.name}></#{child.name}>\n"

    elsif !child.text.nil? && child.children.empty?
      final_format << "#{identation_space}<#{child.name}>#{child.text}</#{child.name}>\n"

    elsif child.text.nil? && !child.children.empty?
      final_format << "#{identation_space}<#{child.name}>\n"

      child.children.each do |sub_child|
        final_format << format_child(child: sub_child, identation: identation * DEFAULT_IDENTATION)
      end

      final_format << "#{identation_space}</#{child.name}>\n"
    end

    final_format.flatten
  end
end
