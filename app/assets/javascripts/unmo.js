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

  $(".unmo__form__button").on("click",function(){
    callUnmo();
  })
});