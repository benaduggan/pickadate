# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/




$(document).on('click', '#userInvite', ( 
    $.ajax({
      type: "POST",
      url: "/pickadates/invite_user",
      data: { user_id: gon.user.id, id: $(this).attr("value") }
      success:(data) ->
        alert data.id
        return false
      error:(data) ->
        return false
    });
    $(this).attr('class', 'btn btn-primary');
));