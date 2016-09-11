class Chord < Note

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
      @Sharp_chords.index(raw_name)
    else
      @Flat_chords.index(raw_name)
    end
  end

  private
  def sanitize_method

    addition = ""

    case name
    when /dim7/ then
      addition = "dim7"
    when /dim/ then
      addition = "dim"
    when /2/ then
      addition = "2"
    when /sus4/ then
      addition = "sus4"
    when /sus/ then
      addition = "sus"
    when /maj7/ then
      addition = "maj7"
    when /maj/ then
      addition = "maj"
    when /m7/ then
      addition = "m7"
    when /m/ then
      addition = "m"
    when /7/ then
      addition = "7"
    when /6/ then
      addition = "6"
    when /9/ then
      addition = "9"
    when /aug/ then
      addition = "aug"
    when /11/ then
      addition = "11"
    end

    sanitized_chord_array = []
    if addition != ""
      sanitized_chord_array << name.gsub(addition, "")
      sanitized_chord_array << addition
    else
      sanitized_chord_array << name
      sanitized_chord_array << ""
    end

  end

end
