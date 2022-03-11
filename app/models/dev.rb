class Dev
  include ActiveModel::Model

  validates :login, presence: true

  attr_accessor :avatar_url,
                :bio,
                :blog,
                :company,
                :joined,
                :login,
                :name,
                :public_repos,
                :followers,
                :following,
                :location,
                :twitter_username

  def initialize(attributes = nil)
    return unless attributes

    self.avatar_url = attributes["avatar_url"]
    self.bio = attributes["bio"]
    self.blog = attributes["blog"]
    self.company = attributes["company"]
    self.joined = Date.parse(attributes["created_at"]) if attributes["created_at"]
    self.login = attributes["login"]
    self.name = attributes["name"]
    self.public_repos = attributes["public_repos"]
    self.followers = attributes["followers"]
    self.following = attributes["following"]
    self.location = attributes["location"]
    self.twitter_username = attributes["twitter_username"]
  end
end
