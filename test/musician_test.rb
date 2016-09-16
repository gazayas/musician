require 'minitest/autorun'
require 'musician'

class KeyChangeTest < Minitest::Test

  def test_change_to_sharp
    note = Note.new "A#"
    assert_equal "A♯", note.name
  end

  def test_change_to_flat
    note = Note.new "Ab"
    assert_equal "A♭", note.name
  end

  def test_song_method_returns_array_of_strings
    song = Song.new("G", ["G", "Em", "C", "D"])
    chord_array = song.chord_names
    assert_equal ["G", "Em", "C", "D"], chord_array
  end

  def test_key_change_changes_key_as_well
    key = "G"
    chords = ["G", "Em", "C", "D"]
    song = Song.new(key, chords)
    new_key = "A"
    song = song.key_change(new_key)
    assert_equal new_key, song.key.name
  end

  # ADDITIONSに関するテスト
  def test_add2
    chord = Chord.new("Cadd2")
    assert_equal "add2", chord.addition
  end

  def test_add9
    chord = Chord.new("Cadd9")
    assert_equal "add9", chord.addition
  end

  def test_dim7
    chord = Chord.new("Cdim7")
    assert_equal "dim7", chord.addition
  end

  def test_dim
    chord = Chord.new("Cdim")
    assert_equal "dim", chord.addition
  end

  def test_sus4
    chord = Chord.new("Csus4")
    assert_equal "sus4", chord.addition
  end

  def test_sus
    chord = Chord.new("Csus")
    assert_equal "sus", chord.addition
  end

  def test_maj7
    chord = Chord.new("Cmaj7")
    assert_equal "maj7", chord.addition
  end

  def test_maj
    chord = Chord.new("Cmaj")
    assert_equal "maj", chord.addition
  end

  def test_m7
    chord = Chord.new("Cm7")
    assert_equal "m7", chord.addition
  end

  def test_m
    chord = Chord.new("Cm")
    assert_equal "m", chord.addition
  end

  def test_aug
    chord = Chord.new("Caug")
    assert_equal "aug", chord.addition
  end

  def test_2
    chord = Chord.new("C2")
    assert_equal "2", chord.addition
  end

  def test_6
    chord = Chord.new("C6")
    assert_equal "6", chord.addition
  end

  def test_9
    chord = Chord.new("C9")
    assert_equal "9", chord.addition
  end

  def test_11
    chord = Chord.new("C11")
    assert_equal "11", chord.addition
  end


  # 転調に関するテスト
  def test_G_to_A
    key = "G"
    chords = ["G", "Em", "C", "D"]
    song = Song.new(key, chords)
    new_key = "A"
    song = song.key_change(new_key)
    assert_equal ["A", "F♯m", "D", "E"], song.chord_names
  end

  def test_A_to_G
    key = "A"
    chords = ["A", "F#m", "D", "E"]
    song = Song.new(key, chords)
    new_key = "G"
    song = song.key_change(new_key)
    assert_equal ["G", "Em", "C", "D"], song.chord_names
  end

  # 後はオプションのテストを書くこと（:sharp, :all_sharpとか）

end
