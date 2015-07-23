$(document).ready(function(){
	// var offset = 0;
	// var q = $("#q").val();
	$("#search").submit(function(event){
		event.preventDefault();
		// alert("Loading!");
			// var apiKey = "dc6zaTOxFJmzC"
			// $('#results').html('');
			gif();
	});	
	// $("#results button").click(function(){
		// alert("check!");
		$("#results button").click(function(){
			gif();
		});

		$(window).scroll(function() {
  			if($(window).scrollTop() + $(window).height() >= $(document).height()){
				gif();
		}
	});			
});

var offset = 0;

function gif(){
	var q = $("#q").val();
	$.ajax({
		type: 'get',
		url: 'http://api.giphy.com/v1/gifs/search?q=' + q + '&api_key=dc6zaTOxFJmzC&offset=' + offset + '&limit=1',
		dataType: 'json',
		//  data: {
 		// 	q: q,
 		// 	api_key: apiKey,	      
  		// 	},
        success: function(data, textStatus, jqXHR){
    	console.log(data);
    	var gifs = data.data;
    	offset +=  1;
        	for(var i = 0; i < gifs.length; i++){
        		var gif = gifs[i];
        		var gifPic = gif.images.fixed_height.url;
        		var html = "<li><img src=" + gifPic + "></li>";
        		// var html = "<ul><li><img scr=" + gifPic + "></img></ul></li>"; 
        		// $("#results").prepend(html);
        		$("#results").before(html);
	        
	        	// $("results").infinitescroll('scroll')
        	}	// alert("check");	 
        }	       	
    });			
}