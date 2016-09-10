require './music'
require './chord'
require './song'

chords = ["G", "Gb", "Em", "C"]
key = "G"
song = Song.new(key, chords)
song = song.key_change("A", :default)
song.chords.each do |chord|
  puts chord.name
end
