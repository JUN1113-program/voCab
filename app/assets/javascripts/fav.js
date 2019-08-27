$(function(){
  // いいねの生成
  function like (id, status, button){
    var wordbook_id = id;
    var url = `api/wordbooks/${wordbook_id}`;
    var method = status == "far" ? "PATCH" : "DELETE";
    $.ajax({
      url: url,
      type: method
    })
    .done(function(){
      button.toggleClass("far fa-3x fa-bookmark");
      button.toggleClass("fas fa-3x fa-bookmark");
    })
    .fail(function(){
      window.alert("error");
    });
  }

  $(".wordbook__fav").on("click",function(){
    var id = $(this).parent()[0].dataset.id;
    var button = $(this).find("i");
    var status = button[0].classList[0];
    like(id, status, button);
  });
});