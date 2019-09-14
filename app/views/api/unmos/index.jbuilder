require "#{Rails.root}/app/lib/unmo.rb"
unmo = Unmo.new("proto")
response = unmo.dialogue(@input)

json.response     response