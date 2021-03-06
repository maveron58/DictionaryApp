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
          promptClickPrepare();
          $('div.prompt#word-input a').click(function (e) {
            e.preventDefault();
            $(this).closest('form').find('input#word').val($(this).text());
          });
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
    obj.css('opacity','1');
  }

  function promptClose(obj) {
    obj.css('opacity','0');
  }

  function promptClickPrepare() {
    
  }

  $('input#word').keyup(promptCreate);
  $('input#word').blur(function() { promptClose($('div.prompt#word-input')) });
  $('select#to').change(function() { promptClose($('div.prompt#word-input')) });
  $('select#from').change(function() { promptClose($('div.prompt#word-input')) });

  $('.submit').click(function (e) {
    e.preventDefault();
    $(this).closest('form').submit();
  });

  $('.fake-button-file').click(function (e) {
    e.preventDefault();
    $(this).closest('form').find('input[type=file]').click();
  });

  $('input[type=file]').change(function () {
    $(this).closest('.fake-text-input-file').find('p.text').html($(this)[0].files[0].name);
  });
});