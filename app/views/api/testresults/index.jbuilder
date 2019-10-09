# コントローラーで定義した@testresultsを配列に格納する
count = @testresults.group(:test_id).count
ary = []
i = 0
count.each do |key, value|
  ary[i] = @testresults.where(test_id: key)
  i += 1
end


# 上記で配列化したデータをchart.jsで用いるjson形式に変換する
json.array! ary do |testresults|
  data = []
  labels = []
  testresults.each.with_index(1) do |testresult, i|
    labels << i
    data << testresult.score
  end
  json.id        testresults.first.id
  json.labels    labels
  json.data      data
  json.label     testresults.first.test.wordbook.title
end
