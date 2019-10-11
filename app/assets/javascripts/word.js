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
    <div class = "main--showWordBook__wordcard main--showWordBook__wordcard--${onoff}">
      <div class = "main--showWordBook__wordcard__word">
        ${put}
      </div>
    </div>
    `
    $(".main--showWordBook__wrapper").html(HTML);
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
    }else if(count < cards.length){
      appendHTML(cards[count],"front");
    }
  });

  showWordBook ? wordcard() : null ;

  // 裏表を入れ替える
  $(document).on("click",".main--showWordBook__wordcard--front",function(){
    appendHTML(cards[count],"reverse");
  })
  $(document).on("click",".main--showWordBook__wordcard--reverse",function(){
    appendHTML(cards[count],"front");
  })
});