class Song

  attr_accessor :key, :chords, :title, :tempo

  # keyは文字列で、chordsは文字列の配列
  def initialize(key, chords)
    @key = Chord.new(key)
    @chords = chords.map do |chord|
      Chord.new(chord)
    end
    # 作る時に定義しなくていいけど、一応自分で定義できる
    @title = ""
    @tempo = ""
  end

  def chord_names
    chords.map do |chord|
      chord.name
    end
  end

  def key_change(new_key, option=:sharp)
    # unless new_key.instance_of? Chord then new_key = Chord.new(new_key)
    new_key = Chord.new(new_key) # もうすでにChordクラスであればこれを飛ばすようにする

    if key.position < new_key.position
      key_up = true
      difference = new_key.position - key.position
    elsif key.position > new_key.position
      key_up = false
      difference = key.position - new_key.position
    else
      # キーが変わってない場合
      difference = 0
    end

    new_chord_array = []

    new_chord_array = chords.map do |chord|
      if key_up == true
        new_position = (chord.position + 1) + difference
        if new_position > 12
          new_position -= 12
        end
      else
        new_position = (chord.position + 1) - difference
        if new_position < 1
          new_position += 12
        end
      end
      new_position -= 1

      case option
      when :sharp then
        if chord.flat?
          FLAT_CHORDS[new_position] + chord.addition
        else
          SHARP_CHORDS[new_position] + chord.addition
        end
      when :flat then
        if chord.sharp?
          SHARP_CHORDS[new_position] + chord.addition
        else
          FLAT_CHORDS[new_position] + chord.addition
        end
      when :all_sharp
        SHARP_CHORDS[new_position] + chord.addition
      when :all_flat
        FLAT_CHORDS[new_position] + chord.addition
      end
    end

    Song.new(new_key.name, new_chord_array)

  end

end
