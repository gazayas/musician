class Note

  Sharp = "♯"
  Flat = "♭"

  attr_accessor :name
  attr_reader :Sharp_chords, :Flat_chords

  def initialize(name)
    @name = name
    @name = change_symbol
    @Sharp_chords = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
    @Flat_chords = ["C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭", "A", "B♭", "B"]
  end

  def change_symbol
    @name = @name.tr("#b", "#{Sharp}#{Flat}") # gsub()の変わりに「tr」を使ってる（・ω・）
  end

  # Noteを初期化する時に#は♯に変換されるから両方が要るかな。。。
  def sharp?
    !!name.match(/#/) || !!name.match(/♯/) # 真偽を返して欲しかったから次のように書きました
  end

  def flat?
    !!name.match(/b/) || !!name.match(/♭/)
  end

  def position
    if sharp?
      @Sharp_chords.index(name)
    else
      @Flat_chords.index(name)
    end
  end

end
