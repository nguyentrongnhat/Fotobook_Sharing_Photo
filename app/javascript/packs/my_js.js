require("jquery")
require("jquery-validation")

$(document).ready(function(){

	$(".shadow").click(function(){
		var parent = $(this).closest(".cover-card-photo");
		var source = parent.find(".shadow").attr("src");
		var title = parent.find(".card-title").text();
		var decription = parent.find(".card-text-decription").text();
		$(".text-modal-title").text(title); 
		$(".image-modal").attr("src", source);
  		$(".modal-footer-text").text(decription);
  		console.log(source);
  		console.log(parent.attr("class"));
  		console.log(decription);
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

	$(".edit_album").validate({
		rules: {
			"album[title]": "required"
		},
		messages: {
			"album[title]": "Please enter your album title"
		}
	});

});