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
      $('#question-submit').hide();
    }).fail(function() {
      console.log("Didn't add new question correctly")
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
        $('#question-submit').show();
      }).fail(function() {
        console.log("Didn't add new choices correctly")
      });

      });
   });
  });