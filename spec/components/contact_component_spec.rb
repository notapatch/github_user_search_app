require "rails_helper"

RSpec.describe ContactComponent, type: :component do
  describe "transparency" do
    it "renders available opaque" do
      render_inline(described_class.new(svg: "icon-website.svg",
                                        available: true)) { "Present" }

      expect(rendered_component).to have_css(".opacity-100")
    end

    it "renders unavailable transparent" do
      render_inline(described_class.new(svg: "icon-website.svg",
                                        available: false))

      expect(rendered_component).to have_css(".opacity-75")
    end
  end

  describe "missing message" do
    it "renders default missing message" do
      render_inline(described_class.new(svg: "icon-website.svg",
                                        available: false))

      expect(rendered_component).to have_text("Not Available")
    end

    it "renders missing message" do
      render_inline(described_class.new(svg: "icon-website.svg",
                                        available: false,
                                        missing_msg: "Nothing"))

      expect(rendered_component).to have_text("Nothing")
    end
  end
end
