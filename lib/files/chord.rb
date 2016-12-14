module Musician

  class Chord < Note

    ADDITIONS = ["add2", "add9", "dim7", "dim", "sus4", "sus", "maj7", "maj", "m7", "m", "aug", "2", "6", "7", "9", "11"]

    attr_accessor :name, :raw_name, :addition

    # split chordの場合の対応をしないといけない
    # その場合だと、raw_nameやadditionをハッシュにして、raw_name[:chord1]とraw_name[:chord2]とか
    # 新しいブランチを作ってそれをやればいいかな
    # それができたら、song.key_changeがsplit_chordに対応できるようにできるかもしれない
    def initialize(initial_name)
      # Chord.name と Note.name はそもそも違うものなのでOOPにおいては良くないかもしれない
      # こう: 「Note.name #=> "G"」  「Chord.name #=> "Gm7"」
      # でも、Note.nameとChord.nameは分かりやすいので、これで行きます。
      # そのために、Noteのインスタンス変数をadditionなしで作ってから、name, raw_nameとadditionを定義しています。

      raw_elements = sanitize(initial_name)
      super(raw_elements[:raw_name]) # Noteのインスタンス変数を作る

      @name = change_symbol(initial_name)
      @raw_name = change_symbol(raw_elements[:raw_name])
      @addition = raw_elements[:addition]
    end

    def position
      if sharp?
        SHARP_CHORDS.index(@raw_name)
      else
        FLAT_CHORDS.index(@raw_name)
      end
    end

    private
    def sanitize(initial_name)

      raw_elements = {
        raw_name: String.new,
        addition: String.new
      }

      # intial_nameにはadditionがあるかどうか確認する
      finished_search = false
      until !(raw_elements[:addition].empty?) || finished_search == true
        ADDITIONS.each do |addition|
          regexp = Regexp.new(addition)
          if initial_name.match(regexp)
            raw_elements[:raw_name] = initial_name.gsub(addition, "")
            raw_elements[:addition] = addition
            break
          end
        end
        # もしadditionがなければ、nameをそのまま返して、additionが空の配列のまま返す
        if raw_elements[:addition].empty?
          raw_elements[:raw_name] = initial_name
        end
        finished_search = true
      end
      raw_elements
    end

  end

end
