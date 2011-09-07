// projects.js

var delay = (function(){
  var timer = 0;
  return function(callback, ms){
    clearTimeout (timer);
    timer = setTimeout(callback, ms);
  };
})();

$(document).ready(function(){
  keywords = $("#keywords").val();

  $("#keywords").keyup(function () {
    if ($(this).val() == keywords)
      return;

    keywords = $("#keywords").val();
    data = $(this).parent().serialize();
    url = $(this).parent().attr('action');
    delay(function(){
      content_div = $("#content")
      content_div.html("Loading...")
      $.post(url, data, function(result) {
        content_div.html(result);
      });
    }, 500 );
  });

  $("#ask").click(function() {
    new_href = $(this).attr('href') + "?keywords=" + keywords;
    $(this).attr('href', new_href);
  });

  $("#ask").fancybox({
    onComplete:function() {
      var func = arguments.callee;
      $('#fancybox-content form').submit(function(){
        //this is strictly cosmetic
        $.fancybox.showActivity();

        var data = $(this).serialize();
        var url = $(this).attr('action')

        //post to the server and when we get a response, 
        //draw a new fancybox, and run this function on completion
        //so that we can bind the form and create a new fancybox on submit
        $.post(url, data, function(msg){
          if (msg.action == "redirect")
            //redirect parent page
            parent.location.href = msg.url;
          else
            //replace fancybox content with new one from server
            $.fancybox({content:msg.html,onComplete:func});
        });
        return false;
      });
    }
  });

});
