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
          promptOpen($('div.prompt#word-input'), data);
        }
      });
    } else {
      promptClose($('div.prompt#word-input'));
    }
  }

  function promptOpen(obj, data) {
    if(data.length > 0) {
      obj.html(data);
    }
    obj.css('display','block');
  }

  function promptClose(obj) {
    obj.css('display','none');
  }

  $('input#word').keyup(promptCreate);
  $('input#word').blur(function() { promptClose($('div.prompt#word-input')) });
  $('select#to').change(function() { promptClose($('div.prompt#word-input')) });
  $('select#from').change(function() { promptClose($('div.prompt#word-input')) });

  $('.select-prompt a').click(function (e) {
    e.preventDefault();
    var par = $(this).closest('ul.select');
    par.find('select').val($(this).attr('len-val'));
    par.find('.title').text($(this).text());
  });

  $('.submit').click(function (e) {
    e.preventDefault();
    $(this).parent('form').submit();
  });
});