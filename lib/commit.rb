class Commit
  TYPE_SCORE_MAPPING = {
    "IssuesEvent"                   => 7,
    "IssueCommentEvent"             => 6,
    "PushEvent"                     => 5,
    "PullRequestReviewCommentEvent" => 4,
    "WatchEvent"                    => 3,
    "CreateEvent"                   => 2
  }

  attr_reader :type, :score

  def initialize(type)
    @type = type
    @score = calculate_score
  end

  def calculate_score
    TYPE_SCORE_MAPPING[type] || 1
  end
end

