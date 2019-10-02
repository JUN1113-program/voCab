class Responder
  def initialize(name, dictionary)
    @name = name
    @dictionary = dictionary
  end
  def response(input,mood)
    return ""
  end
  def select_random(ary)
    return ary[rand(ary.size)]
  end
  attr_accessor :name
end

class WhatResponder < Responder
  def response(input)
    return "#{input}ってなに？"
  end
end

class RandomResponder < Responder
  def response(input)
    return select_random(@dictionary.random)
  end
end

class PatternResponder < Responder
  def response(input, mood)
    @dictionary.pattern.each do |ptn_item|
      if m = ptn_item.match(input)
        resp = ptn_item.choice(mood)
        next if resp.nil?
        return resp.gsub(/%match%/, m.to_s)
      end
    end
    return select_random(@dictionary.random)
  end
end