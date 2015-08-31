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

  var stats = $('.stats-bar')

  for (var i=0; i<stats.length; i++) {
    $(stats[i]).goalProgress({
    goalAmount: 100,
    currentAmount: parseInt($(stats[i]).text()),
    textBefore: '',
    textAfter: '%'
    });
  }  

});