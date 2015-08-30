$('document').ready(function(){
  $("#new-question-form").on("submit", "#add-question",function(e){
    e.preventDefault();
    $this = $(this);
    $.ajax({
      url: $this.attr('action'),
      data: $this.serialize(),
      method: $this.attr('method')
    }).done(function(response){
      $('#add-choice-div').append(response);
    }).fail(function() {
      console.log("Didn't add new choice correctly")
    });

   $('#add-choice-div').on('submit','#new-choice', function(e){
      e.preventDefault();
      $this = $(this);
      $.ajax({
        url: $this.attr('action'),
        data: $this.serialize(),
        method: $this.attr('method')
      }).done(function(response){
        $('#new-choice').remove();
        $('#add-question').replaceWith(response);
      }).fail(function() {
        console.log("Didn't add choice correctly")
      });

      });
   });
  });