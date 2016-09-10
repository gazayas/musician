class Chord

  Sharp = "♯"
  Flat = "♭"

  attr_accessor :name, :sanitized_name, :addition
  attr_reader :Sharp_chords, :Flat_chords

  def initialize(name)
    name = name.tr("#b", "#{Sharp}#{Flat}") # gsub()の変わりに「tr」を使ってる（・ω・）
    @name = name
    sanitized_elements = sanitize_method
    @sanitized_name = sanitized_elements[0]
    @addition = sanitized_elements[1]
    @Sharp_chords = ["C", "C♯", "D", "D♯", "E", "F", "F♯", "G", "G♯", "A", "A♯", "B"]
    @Flat_chords = ["C", "D♭", "D", "E♭", "E", "F", "G♭", "G", "A♭", "A", "B♭", "B"]
  end

  def sharp?
    name.match(/#/) || name.match(/♯/)
  end

  def flat?
    name.match(/b/) || name.match(/♭/)
  end

  def position
    # 1を足す理由は、key_changeの中で使うためです
    # 1が足されないと計算がうまくできないから
    # そして配列が正しく定義されるように、new_position -= 1 を def key_change ... end の中に行う
    if sharp?
      @Sharp_chords.index(sanitized_name) + 1
    else
      @Flat_chords.index(sanitized_name) + 1
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
