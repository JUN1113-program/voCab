json.array! @wordbook.words do |word|
  json.wordbook_id  @wordbook.id
  json.id    word.id
  json.front word.front
  json.reverse word.reverse
end