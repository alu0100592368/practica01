require "rubygems"
require "twitter"
require 'google_chart'
require './configure'

name = String.new ARGV[0]

user = Hash.new

# Iterar nuestros amigos ordenados según su popularidad
friends = Twitter.friend_ids(name)

friends.ids.each do |fid|

  f = Twitter.user(fid)

  # Repetir sólo si podemos ver a sus seguidores
  if (f.protected.to_s != "true")
    user[f.screen_name.to_s] = f.followers_count
  end

end

user.sort_by {|k,v| -v}.each { |user, count| puts "#{user}, #{count}" }