require 'json'
require 'open-uri'

class GitHubService
  BASE_URL = "https://api.github.com/users/{{handler}}/events/public"

  def initialize(handler)
    @handler = handler
  end

  def fetch_commits_info
    JSON.parse(open(BASE_URL.gsub("{{handler}}", @handler)).read)
  end
end
