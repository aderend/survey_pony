$('document').ready(function() {

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