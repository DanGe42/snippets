$(document).ready(function() {
  try {
    filepicker.getFile('text/*', function(url){
      var results = $('#getContentsText').text("Loading...");
      filepicker.getContents(url, function(data){
        results.text(data);
      });
    });
  } catch (e) {
    console.log(e);
  }

  $.each($(".vote-container"), function (index, element) {
    var snippet_id = element.getAttribute("data-snippet_id");
    var $element = $(element);

    var $points = $element.find(".points");
    var $up_form = $element.find(".up-form");
    $up_form.submit(function (e) {
      $points.html(parseInt($points.html(), 10) + 1);
      $.post("/upvote/" + snippet_id + ".json", function (data) {
        // Do something?
      });
      e.preventDefault();
    });

    var $down_form = $element.find(".down-form");
    $down_form.submit(function (e) {
      $points.html(parseInt($points.html(), 10) - 1);
      $.post("/downvote/" + snippet_id + ".json", function (data) {
      });
      e.preventDefault();
    });
  });
});
