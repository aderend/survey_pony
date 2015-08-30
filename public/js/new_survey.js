$('document').ready(function(){
  $("#add-question").on("submit", function(e){
    e.preventDefault();
    $.ajax('/questions', {
      data: $(this).serialize(),
      method: 'POST'
    }).done(function(data){
      $('#add-choice-div').toggle();
    });

   $('#add-choice-div').on('submit', function(e){
      e.preventDefault();
      debugger
      $.ajax('/choices', {
        data: $(this).serialize(),
        method: 'POST'
      }).done(function(data){
        debugger
        alert(data);
      }).fail(function() {
        debugger
      });

      });
   });
  });