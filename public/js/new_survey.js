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
      $('#finish-survey-form').toggle();
      $('#question-submit').hide();
      // debugger
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
        $('#finish-survey-form').hide();
        $('#add-question').replaceWith(response);
        $('#question-submit').show();
      }).fail(function() {
        console.log("Didn't add new choices correctly")
      });

      });
   });

  $("#finish-survey").on("submit", function(e){
    e.preventDefault();
    debugger
    $choices = $(this);
  });

  });