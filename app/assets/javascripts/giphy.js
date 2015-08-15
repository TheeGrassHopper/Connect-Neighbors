$(document).ready(function(){
	$("#search").submit(function(event){
		event.preventDefault();
			gif();
	});	
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
	$.ajax({type: 'get',url: 'http://api.giphy.com/v1/gifs/search?q=' + q + '&api_key=dc6zaTOxFJmzC&offset=' + offset + '&limit=1',dataType: 'json',
        success: function(data, textStatus, jqXHR){
    	console.log(data);
    	var gifs = data.data;
    	offset +=  1;
        	for(var i = 0; i < gifs.length; i++){
        		var gif = gifs[i];
        		var gifPic = gif.images.fixed_height.url;
        		var html = "<li><img src=" + gifPic + "></li>";
        		$("#results").before(html);
        	}
        }	       	
    });			
}