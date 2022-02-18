module SVGHelper
  def show_svg(path)
    File.open("app/assets/images/#{path}", "rb") do |file|
      file.read.html_safe
    end
  end
end
