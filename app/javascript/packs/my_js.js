require("jquery")
require("jquery-validation")

$(document).ready(function(){
	$(".shadow").click(function(){
		var source = $(this).attr("src");
		var title_show = $(this).parent().next().children().children().first().text()
		var decription_show = $(this).parent().next().children().children().first().next().text()
		var src = $(".myModal").children().children().children().first().next().children().attr("src", source);
		$(".myModal").children().children().children().first().children().first().text(title_show);   	
  	$(".myModal").children().children().children().eq(2).children().text(decription_show)
  	console.log(source)
  	//$("#myModal").show()
  	});

  	$(".close").click(function(){
  		$("#myModal").hide()
  	})


  $(".show_album").click(function(){
    //var source_album = $(this).children().first().children().attr("src");
    var title_show_album = $(this).children().children().first().next().children().children().first().text()
    var decription_show_album = $(this).children().children().first().next().children().children().first().next().text()
    console.log(title_show_album)
    console.log(decription_show_album)
    var album_id = $(this).attr("id")
    var path = "/albums/" + album_id
    $(this).attr("src", path)
    console.log(album_id)
  });


  $(".close").click(function(){
      $("#myModal").hide()
  })

  $(".fa-heart").click(function(){
    if($(this).attr("class") == "fas fa-heart"){
      $(this).attr("class", "far fa-heart");
      console.log($(this).attr("class"));
    }
    else if($(this).attr("class") == "far fa-heart"){
      $(this).attr("class", "fas fa-heart");
      console.log($(this).attr("class"));
    }
  });

	$(".edit_album").validate({
		rules: {
			"album[title]": "required"
		},
		messages: {
			"album[title]": "Please enter your album title"
		}
	});

});