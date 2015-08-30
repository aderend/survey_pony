$('document').ready(function(){
  $("#add-question").on("submit", function(e){
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
        debugger
        // alert(data);
      }).fail(function() {
        debugger
      });

      });
   });
  });