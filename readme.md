#musician

## Installation

(I actually haven't put it on rubygems.org yet)
`$ gem install music`

## The main function of `musician` is performing a key change in a song

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


#musician

##インストール

(まだ rubygems.org に載っていません)
`$ gem install musician`

##`musician`の主要のメソッドは`key_change()`であり、転調を行うことです

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
`Song`クラスが作られる時に、渡されたkey(文字列)とchords(文字列の配列)が`Chord`というクラスになります
上記の`test.rb`で定義されたsongインスタンス変数を見ると、オブジェクトが返されます。
```ruby
p song.key
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
