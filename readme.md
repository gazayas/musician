#musician ![Gem](https://github.com/gazayas/musician/releases/latest)


## Installation

`$ gem install musician`

## The main method of `musician` is `key_change()`

```ruby
key = "G"
chords = ["G", "F#", "Em", "C"]
song = Song.new(key, chords)
song = song.key_change("A") # Change to key of A
p song.chord_names
#=> ["A", "G♯", "F♯m", "D"]
```

There are 3 classes in `musician`:<br/>
`Note`, `Chord`, and `Song`. `Chord` is inherited from `Note`

When a `Song` instance variable is created, the key (a string) and the chords (an array of strings)
become a new object, `Chord`

```ruby
# after creating a new instance variable,
p song.chords
# will return an array of objects

# if you just want the chords as an array of strings though,
p song.chord_names
# will return that for you, like in the example code above
```

Looking at the previous example of code, you can see that `song.key` returns an object instead of a string
```ruby
p song.key
#=> #<Chord:0x007fb16102cb90 @name="G", @raw_name="G"... >
```

Here's a look at the `Chord` class
```ruby
chord = Chord.new("G#m7")
chord.name
#=> "G♯m7"
chord.sharp?
#=> true
chord.flat?
#=> false
chord.position # Starting from "C", "C" being 0
#=> 8
chord.raw_name
#=> "G♯"
chord.addition
#=> "m7"
```

The `sharp?`, `flat?`, and `position` methods can also be used with the `Note` class

If you pass a pound sign "#" or a lowercase "b" when creating an instance variable,
it will automatically be changed into a sharp "♯" or flat "♭" respectively

```ruby
sharp_chord = Chord.new("G#")
p sharp_chord.name
#=> "G♯"
flat_chord = Chord.new("Gb")
p flat_chord.name
#=> "G♭"
```
###Key change options
When the `key_change()` method is called, an option can be passed as the second argument.<br/>
This determines how the chords of the song are changed.

There are 4 options that can be chosen from
```ruby
:sharp # This is the default option
:flat
:all_sharp
:all_flat
```

###Option 1 (:sharp)
```ruby
key = "G"
chords = ["G", "Gb", "Em", "C"]
song = Song.new(key, chords)
new_key = "A"
song = song.key_change(new_key, :sharp) # since :sharp is the default, it doesn't need to be written
p song.chord_names
#=> ["A", "A♭", "F♯m", "D"]

# Any chord that was originally flat will stay flat if applicable
# In any other case, they will become sharp (Like "F♯m")
```

###Option 2 (:flat)
```ruby
key = "G"
chords = ["G", "F♯", "Em", "C"]
song = Song.new(key, chords)
new_key = "A"
song = song.key_change(new_key, :flat)
p song.chord_names
#=> ["A", "G♯", "G♭m", "D"]

# Any chord that was originally sharp will stay sharp if applicable
# In any other case, they will become flat (Like "G♭m")
```

###Option 3 (:all_sharp)
```ruby
key = "G"
chords = ["G", "Gb", "Em", "C"]
song = Song.new(key, chords)
new_key = "A"
song = song.key_change(new_key, :all_sharp)
p song.chord_names
#=> ["A", "G♯", "F♯m", "D"]

# All applicable chords will be changed into sharps
```

###Option 4 (:all_flat)
```ruby
key = "G"
chords = ["G", "Gb", "Em", "C"]
song = Song.new(key, chords)
new_key = "A"
song = song.key_change(new_key, :all_flat)
p song.chord_names
#=> ["A", "A♭", "G♭m", "D"]

# All applicable chords will be changed into flats
```

##Supported chords
The following chords are supported:
```ruby
# Any of these can be added at the end of a chord or key
# for example: "Am7"
"add2"
"add9"
"dim7"
"dim"
"sus4"
"sus"
"maj7"
"maj"
"m7"
"m"
"aug"
"2"
"6"
"7"
"9"
"11"
```

##Pro Tip
When calling `song.key_change(key, chords)`, <br/>
The variables `key` and `chords` can be passed as either a string or a `Chord` object<br/>
(Make sure `chords` is an array)

<br/>
<br/>

#musician

##インストール

`$ gem install musician`

##`musician`の主要の機能は`key_change()`、歌の転調を行うメソッドです。

```ruby
key = "G"
chords = ["G", "F#", "Em", "C"]
song = Song.new(key, chords)
song = song.key_change("A") # "A"に転調します
p song.chord_names
#=> ["A", "G♯", "F♯m", "D"]
```

`musician`では、３つのクラスが存在しています。<br/>
`Note`、それを継承する`Chord`、そして`Song`です。

`Song`のインスタンス変数が作られる時に、渡されたkey(文字列)とchords(文字列の配列)が`Chord`クラスのインスタンス変数として作られます。
```ruby
# songのインスタンス変数を作ったら、
p song.chords
# はオブジェクトの配列を返します

# オブジェクトじゃなくて文字列の配列だけが要るなら、
p song.chord_names
# は、上記のコードみたいに文字列の配列を返します。
```

上記のコードで定義されたsongインスタンス変数のキーである`song.key`を参照すると、オブジェクトが返されることが分かります。
```ruby
p song.key
#=> #<Chord:0x007fb16102cb90 @name="G", @raw_name="G"... >
```

`Chord`クラスのメソッド：
```ruby
chord = Chord.new("G#m7")
chord.name
#=> "G♯m7"
chord.sharp?
#=> true
chord.flat?
#=> false
chord.position # 「C」は０番目です
#=> 8
chord.raw_name
#=> "G♯"
chord.addition
#=> "m7"
```

`Note`では、`sharp?`, `flat?`、と`position`が使えます。

新しい`Note`や`Chord`を作る時に、パウンド記号「#」がシャープ記号「♯」になり、<br/>
小文字の「b」がフラット記号「♭」になります。
```ruby
sharp_chord = Chord.new("G#")
p sharp_chord.name
#=> "G♯"
flat_chord = Chord.new("Gb")
p flat_chord.name
#=> "G♭"
```

##`key_change()`のオプション
`key_change()`の２つ目の引数をオプションとして定義できます。<br/>
これは、歌のコードはどんな風に転調されるかを決めます。<br/>
尚、optionを省略しても大丈夫です。

４つのオプションがあります：
```ruby
:sharp # デフォルトのオプション
:flat
:all_sharp
:all_flat
```

###オプション１ (:sharp)
```ruby
key = "G"
chords = ["G", "Gb", "Em", "C"]
song = Song.new(key, chords)
new_key = "A"
song = song.key_change(new_key, :sharp)
p song.chord_names
#=> ["A", "A♭", "F♯m", "D"]

# そもそもフラットであったコードはそのままフラットに変換されます
# それ以外のコードはシャープに変換されます（「F♯m」みたいに）
```

###オプション２ (:flat)
```ruby
key = "G"
chords = ["G", "F♯", "Em", "C"]
song = Song.new(key, chords)
new_key = "A"
song = song.key_change(new_key, :flat)
p song.chord_names
#=> ["A", "G♯", "G♭m", "D"]

# そもそもシャープであったコードはそのままシャープに変換されます
# それ以外のコードはフラットに変換されます（「G♭m」みたいに）
```

###オプション３ (:all_sharp)
```ruby
key = "G"
chords = ["G", "Gb", "Em", "C"]
song = Song.new(key, chords)
new_key = "A"
song = song.key_change(new_key, :all_sharp)
p song.chord_names
#=> ["A", "G♯", "F♯m", "D"]

# 対象となるコードは全部シャープに変換されます
```

###オプション４ (:all_flat)
```ruby
key = "G"
chords = ["G", "Gb", "Em", "C"]
song = Song.new(key, chords)
new_key = "A"
song = song.key_change(new_key, :all_flat)
p song.chord_names
#=> ["A", "A♭", "G♭m", "D"]

# 対象となるコードは全部フラットに変換されます
```
##使用可能なコード
下記のコードは使用できます：
```ruby
# コードやキーの語尾として追加できます
# 例えば: "Am7"
"add2"
"add9"
"dim7"
"dim"
"sus4"
"sus"
"maj7"
"maj"
"m7"
"m"
"aug"
"2"
"6"
"7"
"9"
"11"
```

#裏技
`song.key_change(key, chords)`を呼ぶ時に、
変数のkeyとchordsは文字列か`Chord`のインスタンス変数、どちらでも構いません<br/>
（`chords`は配列でなければなりません）
