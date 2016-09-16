require 'minitest/autorun'
require 'musician'

class KeyChangeTest < Minitest::Test

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

  def test_song_method_returns_array
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

end
