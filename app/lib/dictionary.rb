class Dictionary
  def initialize
    @random = []
    open("#{Rails.root}/app/lib/dics/random.txt") do |f|
      f.each do |line|
        line.chomp!
        next if line.empty?
        @random << line
      end
    end
    @pattern = []
    open("#{Rails.root}/app/lib/dics/pattern.txt") do |f|
      f.each do |line|
        pattern, phrases = line.chomp.split("  ")
        next if pattern.nil? || phrases.nil?
        @pattern << PatternItem.new(pattern, phrases)
      end
    end
  end
  attr_accessor :random, :pattern
end

class PatternItem
  SEPARETOR = /^((-?\d+)##)?(.*)$/

  def initialize(pattern,phrases)
    SEPARETOR ~= pattern
    @modify, @pattern = $2.to_i, $3

    @phrases = []
    phrases.split("|").each do |phrase|
      SEPARETOR =~ phrase
      @phrases << {need: $2.to_i, phrase: $3}
    end
  end
  def match(str)
    return str.match(@pattern)
  end
  def choice(mood)
    choices = []
    @phrases.each do |p|
      choices << p[:phrase] if suitable?(p[:need], mood)
    end
    return (choices.empty?)? nil : select_random(choices)
  end
  def suitable?(need, mood)
    return true if need == 0
    if need > 0
      return mood > need
    else
      return mood < need
    end
  end

  attr_accessor :modify, :pattern, :phrases
end