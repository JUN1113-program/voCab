$(function(){
  var showWordBook = $(".main--showWordBook")[0];
  var count = 0;

  // 単語一覧を取得してくる
  function wordcard (){
    var wordbook_id = showWordBook.dataset.id;
    var url = `/wordbooks/${wordbook_id}/api/words`;
    $.ajax({
      url: url
    })
    .done(function(wordcards){
      id = wordcards[0].wordbook_id;
      cards = wordcards;
    })
    .fail(function(data){
      window.alert("error");
    });
  }

  // HTMLを作成する
  function appendHTML(word, onoff){
    var put = onoff == "front" ? word.front : word.reverse;
    var HTML = `
    <div class = "wordcard wordcard--${onoff}">
      <div class = "wordcard__word">
        ${put}
      </div>
    </div>
    `
    $(".wordcards").html(HTML);
  }

});