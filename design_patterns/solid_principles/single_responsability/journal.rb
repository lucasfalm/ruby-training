# frozen_string_literal: true

class Journal
  attr_reader :pages

  def initialize(pages:)
    @pages = pages
  end

  def add_page(page)
    pages << page
  end

  def remove_page(page)
    pages.delete page
  end

  private

  attr_accessor :pages
end
