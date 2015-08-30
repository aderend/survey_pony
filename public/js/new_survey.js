$('document').ready(function(){
  $("#new-question-form").on("submit", "#add-question",function(e){
    e.preventDefault();
    $.ajax('/questions', {
      data: $(this).serialize(),
      method: 'POST'
    }).done(function(data){
      // $('#add-choice-div').show();
      $('#add-choice-div').append(data);
      // debugger
    });

   $('#add-choice-div').on('submit','#new-choice', function(e){
      e.preventDefault();
      $this = $(this);
      $.ajax('/choices', {
        data: $this.serialize(),
        method: 'POST'
      }).done(function(response){
        $('#new-choice').remove();
        $('#add-question').replaceWith(response);
        debugger
      }).fail(function() {
        debugger
      });

      });
   });
  });