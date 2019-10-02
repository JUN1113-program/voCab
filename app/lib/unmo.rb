require_relative "responder"
require_relative "dictionary"
class Unmo
  def initialize(name)
    @name = name

    @dictionary = Dictionary.new
    @emotion = Emotion.new(@dictionary)

    @resp_what = WhatResponder.new("What", @dictionary)
    @resp_random = RandomResponder.new("Random", @dictionary)
    @resp_pattern = PatternResponder.new("Pattern", @dictionary)
    @responder = @resp_pattern
  end
  def dialogue(input)
    @emotion.update(input)
    case rand(100)
    when 0..90
      @responder = @resp_pattern
    when 91..95
      @responder = @resp_random
    else
      @responder = @resp_what
    end
    return @responder.response(input,@emotion.mood)
  end

  def responder_name
    return @responder.name
  end
  def mood
    return @emotion.mood
  end
  attr_accessor :name
end

class Emotion
  MOOD_MIN = -15
  MOOD_MAX = 15
  MOOD_RECOVERY = 0.5

  def initialize(dictionary)
    @dictionary = dictionary
    @mood = 0
  end
  def update(input)
    @dictionary.pattern.each do |ptn_item|
      if ptn_item.match(input)
        adjust_mood(ptn_item.modify)
        break
      end
    end
    if @mood < 0
      @mood += MOOD_RECOVERY
    elsif @mood > 0
      @mood -= MOOD_RECOVERY
    end
  end
  def adjust_mood(val)
    @mood += val
    if @mood > MOOD_MAX
      @mood = MOOD_MAX
    elsif @mood < MOOD_MIN
      @mood = MOOD_MIN
    end
  end
  attr_accessor :mood
end

