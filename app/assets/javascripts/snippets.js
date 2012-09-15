# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

filepicker.getFile('text/*', function(url){
  var results = $('#getContentsText').text("Loading...");
  filepicker.getContents(url, function(data){
    results.text(data);
  });
});
