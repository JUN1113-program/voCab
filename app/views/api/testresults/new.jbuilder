
groups =  @testresults.group(:test_id)
titles = groups.map{|group| group.test.wordbook.title}
high_scores = groups.maximum(:score).values
average_scores = groups.average(:score).values.map{|value| value.to_i}

json.labels           titles
json.high_scores     high_scores
json.average_scores       average_scores