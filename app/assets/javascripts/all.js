$(document).ready(function() {
  function promptCreate() {
    var from = $('select#from').val();
    var to   = $('select#to').val();
    var word = $('input#word').val();

    if(word.length > 1) {
      $.ajax({
        url: "/search/list",
        data: { from: from, to: to, word: word },
        method: "POST",
        success: function(data) { 
          $('div.prompt').html(data).css('display','block');
        }
      });
    } else {
      $('div.prompt').html('').css('display','none');
    }
  }

  function promptClose() {
    $('div.prompt').html('').css('display','none');
  }

  $('input#word').keyup(promptCreate);
  $('input#word').blur(promptClose);
  $('select#to').change(promptClose);
  $('select#from').change(promptClose);

  $('.submit').click(function (e) {
    e.preventDefault();
    $(this).parent('form').submit();
  });
});