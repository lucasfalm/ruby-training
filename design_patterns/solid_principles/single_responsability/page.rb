# frozen_string_literal: true

class Page
  attr_reader :title, :body, :paragraphes

  def initialize(title:, body:, paragraphes:)
    @title = title
    @body = body
    @paragraphes = paragraphes
  end
end
