class Music

  def initialize
    @quarter_note = "♩"
    @half_note = ""
    @whole_note = ""
    @eight_note = "♪"
    @sixteenth_note = ""
  end

  # この中にメソッドを作るかは分からないけど、
  # とにかく普通のキーボードで書けないシンボルを使えるようにする

  # Song.rbの方にはテンポがあるけど。。。

  def add_notes(note1, note2)
    # この中に、
    note1 = "♪"
    note2 = "♪"
    new_note = note1 + note2
    # をして、返すのは
    "♩"
    # みたいな感じのメソッドはどうかな
    # 今の段階ではそんなにいらないけど、一応役に立つと思う

  end


end
