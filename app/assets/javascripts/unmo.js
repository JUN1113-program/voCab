$(function(){
  var responseFiled = $(".unmo__resp");
  var input = $(".unmo__form__input");
  var icon = $(".unmo__icon");
  function unmo (input){
    data = {input: input}
    var url = "/api/unmos"
    $.ajax({
      url: url,
      data: data
    })
    .done(function(data){
      responseFiled.html(data.response);
      $(".unmo__form__input").val("");
      changeImage(randomNum());
    })
    .fail(function(){
      window.alert("error");
    });
  }

  //乱数を生成する
  function randomNum(){
    random =  Math.floor(Math.random()*10);
    return random;
  }
  $(".unmo__form__button").on("click",function(){
    callUnmo();
  })
  $(".unmo__form__input").keypress(function(e){
    if(e.which == 13) {
      callUnmo();
      return false;
    }
  });
});