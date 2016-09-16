class Note

  attr_accessor :name

  def initialize(name)
    @name = name
    @name = change_symbol
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
      SHARP_CHORDS.index(name)
    else
      FLAT_CHORDS.index(name)
    end
  end

end
