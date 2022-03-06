class Dev
  include ActiveModel::Model

  def name
    "The Octocat"
  end

  def followers
    Random.new.rand(5000)
  end
end
