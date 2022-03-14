# frozen_string_literal: true

class ContactComponent < ViewComponent::Base
  include SVGHelper

  def initialize(svg:, available:, missing_msg: "Not Available")
    @svg = svg
    @available = available
    @missing_msg = missing_msg
  end
end
