class Chord < Note

  #ADDITIONS = ["dim7", "dim", "2", "sus4", "sus", "maj7", "maj", "m7", "m", "aug", "7", "6", "9", "11"]

  attr_accessor :name, :raw_name, :addition

  def initialize(name)
    # ちょっとややこしいし良くないかもしれないけど、
    # 一応 @name が chord の name になってて、@raw_name が addition (maj7, dim とか)なしの name
    # こう： @name #=> "G♭m" @raw_name #=> "G♭"
    # でも、Note.name は普通は maj7 や dim とかはないから、OOP においては Chord.name はおかしいかもしれない
    # Note.name は Chord.name と違うので、OOPの考え方においては良くないかもしれない。
    # でも、Note.name と Chord.name はバリ分かりやすいと思うのでそのようにしたい。
    # とりあえす、Chord.name は Note.name とは違うという風に書いています。
    @name = name
    raw_elements = sanitize_method
    super(raw_elements[0]) # 一応 raw_name で Note のインスタンス変数を作る
    @raw_name = change_symbol
    @addition = raw_elements[1]
    @name = name
    @name = change_symbol
  end

  # note.rbだけで置くようにしたいけど、raw_nameが。。。
  def position
    if sharp?
      SHARP_CHORDS.index(raw_name)
    else
      FLAT_CHORDS.index(raw_name)
    end
  end

  private
  def sanitize_method

    addition = String.new
    raw = Array.new

    # additionがあるか確認する
    finished_search = false
    until !addition.empty? || finished_search == true
      ADDITIONS.each do |add|
        regexp = Regexp.new(add)
        raw = Array.new
        if name.match(regexp)
          addition = add
          raw << name.gsub(add, "")
          raw << add
          break
        end
      end
      # もしadditionがなければ、nameをそのまま返して、additionが空の配列のまま返す
      if addition.empty?
        raw << name
        raw << addition
      end
      finished_search = true
    end
    raw
  end

end
