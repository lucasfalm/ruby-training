# frozen_string_literal: true

require_relative "./tag"

class HtmlBuilder

  def initialize root_name:, root_text: nil
    @root_name = root_name
    @root = Tag.new name: root_name, text: root_text
  end

  def add_child name:, text: nil
    root.add_child name: name, text: text

    # NOTE: always returning self to be able to chain methods
    # 
    self
  end

  def add_child_to parent_name:, name:, text: nil
    parent = root.name == parent_name ? root : find_tag(name: parent_name)
    parent&.add_child name: name, text: text

    self
  end

  def build
    root
  end

  private

  attr_accessor :root_name, :root

  def find_tag name:

    tag = root.children.find do |child|
      child.name == name
    end

    if tag.nil?
      root.children.each do |child|
        tag = child.children.find do |sub_child|
          sub_child.name == name
        end

        break tag if !tag.nil?
      end
    else
      tag
    end
  end
end
