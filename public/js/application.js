$('document').ready(function(){

  $('.question_wrapper').on("submit",function(event){
    var target = $(event.target);
    event.preventDefault();

    $.ajax(target.attr("action"),{
      data: target.serialize(),
      method: target.attr("method")
    }).done(function(response){
      $(".question_container").replaceWith(response);
    }).fail(function() {
      alert("Error")
    });

  });
});