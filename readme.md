# musician

### The main function of `musician` is performing a key change in a song

(I actually haven't put it on rubygems.org yet)
(まだ rubygems.org に載っていません)
`$ gem install music`

```ruby
> key = "G"
> chords = ["G", "F#", "Em", "C"]
> song = Song.new(key, chords)
> song = song.key_change("A", :default)
> song.chords.each do |chord|
>   print "#{chord.name} "
> end
#=> "A G♯ F♯m D "
```

When a `Song` class is created, the key (a string) and the chords (an array of strings)
become a new class, `Chord`

Looking at the previous example of code, you can see that the key returns an object instead of a string
```ruby
p song.key
#=> #<Chord:0x007fb16102cb90 @name="G", @sanitized_name="G"... >
```

A Chord object can also be created individually
```ruby
> chord = Chord.new("G#m7")
> chord.sharp?
#=> true
> chord.flat?
#=> false
> chord.position # 出力は「C」を１番目とします
#=> 9
> chord.sanitized_name
#=> "G♯"
> chord.addition
#=> "m7"
```

If you pass a pound sign "#" or a lowercase "b" when creating an instance variable,
it will automatically be changed into a sharp "♯" or flat "♭" respectively

```ruby
> sharp_chord = Chord.new("G#")
> sharp_chord.name
#=> "G♯"
> flat_chord = Chord.new("Gb")
> flat_chord.name
#=> "G♭"
```
