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

  // 左矢印が押された際に前の単語を表示する
  $(".button__arrow--left").on("click",function(){
    if(count > 0){
      count--
    }
    appendHTML(cards[count],"front");
  });
  // 右矢印が押された際に前の単語を表示する
  $(".button__arrow--right").on("click",function(){
    count++;
    if(count >= cards.length){
      window.location.pathname = `/wordbooks/${id}/words`;
    }
    appendHTML(cards[count],"front");
  });

  showWordBook ? wordcard() : null ;
});