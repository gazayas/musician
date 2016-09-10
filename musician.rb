require './music'
require './chord'
require './song'

key = "G"
chords = ["G", "F#", "Em", "C"]
song = Song.new(key, chords)
song = song.key_change("A", :default)
song.chords.each do |chord|
  print "#{chord.name} "
end
