# frozen_string_literal: true

class OptionalComponent < ViewComponent::Base
  def initialize(available:, missing_msg:)
    @available, = available,
    @missing_msg = missing_msg
  end
end
