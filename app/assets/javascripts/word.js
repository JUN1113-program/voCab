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
      </div>
    </div>
    `
    $(".main--showWordBook__wrapper").html(HTML);
    $(".main--showWordBook__wordcard__word").text(put);
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

  // スワイプの挙動を実装
  var direction;
  var position;
  var main = $(".main--showWordBook");
  main.on('touchstart', onTouchStart);
  main.on('touchmove', onTouchMove);
  main.on('touchend', onTouchEnd);

  //横方向の座標を取得
  function getPosition(event) {
    return event.originalEvent.touches[0].pageX;
  }

  function onTouchStart(event) {
    position = getPosition(event);
    direction = '';
  }

  function onTouchMove(event) {
    if (position - getPosition(event) > 50) {
      direction = 'left';
    } else if (position - getPosition(event) < -50){
      direction = 'right';
    }
  }

  // 移動の左右を把握して単語カードを入れ替える
  function onTouchEnd(event) {
    if (direction == 'right'){
      if(count > 0){
        count--
      }
      appendHTML(cards[count],"front");
    } else if (direction == 'left'){
      count++;
      if(count >= cards.length){
        window.location.pathname = `/wordbooks/${id}/words`;
      }else if(count < cards.length){
        appendHTML(cards[count],"front");
      }
    }
  }

  //指定のページであれば単語帳を取得する
  showWordBook ? wordcard() : null ;

  // 裏表を入れ替える
  $(document).on("click",".main--showWordBook__wordcard--front",function(){
    appendHTML(cards[count],"reverse");
  })
  $(document).on("click",".main--showWordBook__wordcard--reverse",function(){
    appendHTML(cards[count],"front");
  })
});