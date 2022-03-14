module DevHelper
  def display_name(dev)
    dev.name || dev.login
  end

  def clear_mention(mentionable_text)
    mentionable_text.delete_prefix("@")
  end
end
