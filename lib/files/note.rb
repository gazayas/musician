class Note

  SHARP = "♯"
  FLAT = "♭"
  SHARP_CHORDS = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
  FLAT_CHORDS = ["C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭", "A", "B♭", "B"]

  attr_accessor :name

  def initialize(name)
    @name = change_symbol(name)
  end

  # 「#」と「b」要らんと思う
  def sharp?
    !!@name.match(/#/) || !!@name.match(/♯/) # 真偽を返して欲しかった「!!」を入れました
  end

  def flat?
    !!@name.match(/b/) || !!@name.match(/♭/)
  end

  def position
    if sharp?
      SHARP_CHORDS.index(@name)
    else
      FLAT_CHORDS.index(@name)
    end
  end

  private

  def change_symbol(note)
    note = note.tr("#b", "#{SHARP}#{FLAT}") # gsub()の変わりに「tr」を使ってる（・ω・）
  end

end
