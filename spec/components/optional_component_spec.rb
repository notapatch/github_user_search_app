require "rails_helper"

RSpec.describe OptionalComponent, type: :component do
  describe "transparency" do
    it "renders available opaque" do
      render_inline(described_class.new(available: true,
                                        missing_msg: "Nothing")) { "Present" }

      expect(rendered_component).to have_css(".opacity-100")
    end

    it "renders unavailable transparent" do
      render_inline(described_class.new(available: false,
                                        missing_msg: "Nothing"))

      expect(rendered_component).to have_css(".opacity-75")
    end
  end

  describe "missing message" do
    it "renders missing message" do
      render_inline(described_class.new(available: false,
                                        missing_msg: "Nothing"))

      expect(rendered_component).to have_text("Nothing")
    end
  end
end
