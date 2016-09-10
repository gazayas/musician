#musician

## Installation

`$ gem install musician`

## The main method of `musician` is `key_change()`

```ruby
> key = "G"
> chords = ["G", "F#", "Em", "C"]
> song = Song.new(key, chords)
> new_key = "A"
> song = song.key_change(new_key, :default)
> song.chords.each do |chord|
>   print "#{chord.name} "
> end
#=> "A G♯ F♯m D "
```

When a `Song` instance variable is created, the key (a string) and the chords (an array of strings)
become a new object, `Chord`

Looking at the previous example of code, you can see that `song.key` returns an object instead of a string
```ruby
> p song.key
#=> #<Chord:0x007fb16102cb90 @name="G", @sanitized_name="G"... >
```

A Chord object can also be created individually
```ruby
> chord = Chord.new("G#m7")
> chord.sharp?
#=> true
> chord.flat?
#=> false
> chord.position # Starting from "C", "C" being 0
#=> 8
> chord.sanitized_name
#=> "G♯"
> chord.addition
#=> "m7"
> chord.Sharp_chords
#=> ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
> chord.Flat_chords
#=> ["C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭", "A", "B♭", "B"]
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
###Key change options
When the `key_change()` method is called, an option is passed as the second argument.<br/>
This determines how the chords of the song are changed.

As seen in the function, the last argument is an option.
There are 4 options that can be chosen from
```ruby
:sharp # This is the same as :default
:flat
:all_sharp
:all_flat
```

The option decides how the chords will be changed.
###Option 1 (:sharp)
```ruby
> key = "G"
> chords = ["G", "Gb", "Em", "C"]
> song = Song.new(key, chords)
> new_key = "A"
> song = song.key_change(new_key, :sharp)
> song.chords.each do |chord|
>   print "#{chord.name} "
> end
#=> "A A♭ F♯m D "

# Any chord that was originally flat will stay flat if applicable
# In any other case, they will become sharp (Like "F♯m")
```

###Option 2 (:flat)
```ruby
> key = "G"
> chords = ["G", "F♯", "Em", "C"]
> song = Song.new(key, chords)
> new_key = "A"
> song = song.key_change(new_key, :flat)
> song.chords.each do |chord|
>   print "#{chord.name} "
> end
#=> "A G♯ G♭m D "

# Any chord that was originally sharp will stay sharp if applicable
# In any other case, they will become flat (Like "G♭m")
```

###Option 3 (:all_sharp)
```ruby
> key = "G"
> chords = ["G", "Gb", "Em", "C"]
> song = Song.new(key, chords)
> new_key = "A"
> song = song.key_change(new_key, :all_sharp)
> song.chords.each do |chord|
>   print "#{chord.name} "
> end
#=> "A G♯ F♯m D "

# All applicable chords will be changed into sharps
```

###Option 4 (:all_flat)
```ruby
> key = "G"
> chords = ["G", "Gb", "Em", "C"]
> song = Song.new(key, chords)
> new_key = "A"
> song = song.key_change(new_key, :all_flat)
> song.chords.each do |chord|
>   print "#{chord.name} "
> end
#=> "A A♭ G♭m D "
# All applicable chords will be changed into flats
```

##Supported chords
The following chords are supported:
```ruby
# Any of these can be added at the end of a chord or key
# for example: "Am7"
"dim7"
"dim"
"2"
"sus4"
"sus"
"maj7"
"maj"
"m7"
"m"
"7"
"6"
"9"
"aug"
"11"
```
##Not yet
Haven't put these chords in yet:
```ruby
"add2"
"add9"
```


#musician

##インストール

`$ gem install musician`

##`musician`の主要のメソッドは`key_change()`、歌の転調を行うメソッドです。

```ruby
> key = "G"
> chords = ["G", "F#", "Em", "C"]
> song = Song.new(key, chords)
> new_key = "A"
> song = song.key_change(new_key, :default)
> song.chords.each do |chord|
>   print "#{chord.name} "
> end
#=> "A G♯ F♯m D "
```
`Song`のインスタンス変数が作られる時に、渡されたkey(文字列)とchords(文字列の配列)が`Chord`というクラスのインスタンス変数として作られます。
上記のコードで定義されたsongインスタンス変数を参照すると、オブジェクトが返されます。
```ruby
> p song.key
#=> #<Chord:0x007fb16102cb90 @name="G", @sanitized_name="G"... >
```

また、`Chord`のインスタンス変数が単位で作ることも可能です。
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

新しい`Song`や`Chord`を作る時に、パウンド記号「#」がシャープ記号「♯」になり、<br/>
小文字の「b」がフラット記号「♭」になります。
```ruby
> sharp_chord = Chord.new("G#")
> sharp_chord.name
#=> "G♯"
> flat_chord = Chord.new("Gb")
> flat_chord.name
#=> "G♭"
```
