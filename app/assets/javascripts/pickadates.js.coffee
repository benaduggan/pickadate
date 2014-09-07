# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
    $("#" + gon.currentrsvpstatus).attr('class', 'btn btn-primary') if gon?
      
$(document).ready(ready)
$(document).on('page:load', ready)

$(document).on('click', '#invite', ( ->
    $.ajax({
      type: "POST",
      url: "/pickadates/invite_user",
      data: { id: gon.date.id, user_id: $(this).attr("value") }
      success:(data) ->
        alert data.id
        return false
      error:(data) ->
        return false
    });
    $(this).attr('class', 'btn btn-primary');
));



$(document).on('click', '#yes', ( ->
    $.ajax({
      type: "POST",
      url: "rsvpstatus",
      data: { id: gon.date.id, rsvpstatus: "yes" },
      success:(data) ->
        alert data.id
        return false
      error:(data) ->
        return false
    });
    
    $(this).attr('class', 'btn btn-primary');           
    $("#maybe").attr('class', 'btn btn-default');        
    $("#no").attr('class', 'btn btn-default');          
));

$(document).on('click', '#maybe', ( ->
    $.ajax({
      type: "POST",
      url: "rsvpstatus",
      data: { id: gon.date.id, rsvpstatus: "maybe" },
      success:(data) ->
        alert data.id
        return false
      error:(data) ->
        return false
    });
    $(this).attr('class', 'btn btn-primary');           
    $("#yes").attr('class', 'btn btn-default');        
    $("#no").attr('class', 'btn btn-default'); 
));
$(document).on('click', '#no', ( ->
    $.ajax({
      type: "POST",
      url: "rsvpstatus",
      data: { id: gon.date.id, rsvpstatus: "no" },
      success:(data) ->
        alert data.id
        return false
      error:(data) ->
        return false
    });
    $(this).attr('class', 'btn btn-primary');           
    $("#maybe").attr('class', 'btn btn-default');        
    $("#yes").attr('class', 'btn btn-default'); 
));