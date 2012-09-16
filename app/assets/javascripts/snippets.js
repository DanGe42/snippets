filepicker.getFile('text/*', function(url){
  console.log("Get file",url);
  var results = $('#getContentsText').text("Loading...");
  filepicker.getContents(url, function(data){
	console.log("Get contents", data);
	$("#result").setAttribute('p', 'testing testing');  
//  var r = results.text(data);
//  $("#result").setAttribute('p',text(data));
 //.setAttribute('p', r);
  });
});
