module DevHelper
  def display_name(dev)
    dev.name || dev.login
  end
end
