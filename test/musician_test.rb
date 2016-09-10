require 'minitest/autorun'
require 'musician'

class KeyChangeTest < Minitest::Test

  def test_G_to_A
    key = "G"
    chords = ["G", "Em", "C", "D"]
    song = Song.new(key, chords)
    new_key = "A"
    song = song.key_change(new_key, :default)
    new_chords = song.chords.map do |chord|
      chord.name
    end
    assert_equal ["A", "F♯m", "D", "E"], new_chords
  end

end
