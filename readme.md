# music

`$ gem install music`

```ruby
key = "G"
chords = ["G", "F#", "Em", C]
song = Song.new(key, chords)
song = song.key_change("A", :default)
song.chords.each |chord|
  print "#{chord.name} "
end
```
