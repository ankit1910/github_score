require_relative '../services/github_service'
require_relative 'commit'

class Committer

  attr_reader :github_score

  def initialize(handler)
    @handler = handler
    @commits = fetch_commits
    @github_score = calculate_score
  end

  def calculate_score
    @github_score = @commits.inject(0) { |sum, commit| sum + commit.score }
  end

  def fetch_commits
    commits_info = GitHubService.new(@handler).fetch_commits_info

    commits_info.collect do |info|
      Commit.new(info["type"])
    end
  end
end
