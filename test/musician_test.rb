require 'minitest/autorun'
require 'musician'

class KeyChangeTest < Minitest::Test

  def test_G_to_A
    key = "G"
    chords = ["G", "Em", "C", "D"]
    song = Song.new(key, chords)
    new_key = "A"
    song = song.key_change(new_key)
    new_chords = song.chords.map do |chord|
      chord.name
    end
    assert_equal ["A", "F♯m", "D", "E"], new_chords
  end

  def test_A_to_G
    key = "A"
    chords = ["A", "F#m", "D", "E"]
    song = Song.new(key, chords)
    new_key = "G"
    song = song.key_change(new_key)
    new_chords = song.chords.map do |chord|
      chord.name
    end
    assert_equal ["G", "Em", "C", "D"], new_chords
  end

  def test_song_method_returns_array
    song = Song.new("G", ["G", "Em", "C", "D"])
    chord_array = song.chord_names
    assert_equal ["G", "Em", "C", "D"], chord_array
  end



end
