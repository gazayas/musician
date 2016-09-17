class Note

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
    note = note.tr("#b", "#{Sharp}#{Flat}") # gsub()の変わりに「tr」を使ってる（・ω・）
  end

end
