$(document).ready(function () {
    photothumbnailpreviewthingy();
		invitethatperson();
});

function photothumbnailpreviewthingy () {
  $("#uploadFile").on("change", function() {
    var files, reader;
    files = (!!this.files ? this.files : []);
    if (!files.length || !window.FileReader) {
      return;
    }
    if (/^image/.test(files[0].type)) {
      reader = new FileReader();
      reader.readAsDataURL(files[0]);
      reader.onloadend = function() {
				var src = this.result
				picthing = document.getElementsByClassName("profilePicture")
				picthing[0].src = this.result
				console.log(this.result)
      };
    }
  });
}

function invitethatperson (){
	$('.userInvite').click(function() {
		console.log("hello");
		$.ajax({
		type: "POST",
		url: "/pickadates/invite_user",
		data: {
			user_id: gon.user.id,
			id: $(this).attr("value")
		},
		success: function(data) {
			console.log("he was invited!")
			return false;
		},
		error: function(data) {
			return false;
		}
	}),
			$(this).attr('class', 'btn btn-primary')
			$(this).html('Invited!')
		
	});
}
