require_relative '../lib/committer.rb'

handler = 'dhh'

committer = Committer.new(handler)

puts "#{ handler.upcase }'s github score is #{ committer.github_score }"
