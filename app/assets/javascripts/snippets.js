filepicker.getFile('text/*', function(url){
  var results = $('#getContentsText').text("Loading...");
  filepicker.getContents(url, function(data){
	$("#result").setAttribute('p', 'testing testing');  
//  var r = results.text(data);
//  $("#result").setAttribute('p',text(data));
 //.setAttribute('p', r);
  });
});
