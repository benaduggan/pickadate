var ready;

setUpPermissionsCheckboxes = function() {
    $('input[type="checkbox"]').each(function() {
        var $label = $(this).parents('label');
        if ($(this).prop('checked')) {
            $label.addClass('btn-success');
            $label.find('.yesno').text('Yes');
        }
        else {
            $label.addClass('btn-danger');
            $label.find('.yesno').text('No');
        }
    });
    $('input[type="checkbox"]').click(function() {
        var $label = $(this).parents('label');
        if ($(this).parents('label').hasClass('btn-danger')) {
            $label.removeClass('btn-danger').addClass('btn-success');
            $label.find('.yesno').text('Yes');
        }
        else if ($(this).parents('label').hasClass('btn-success')) {
            $label.removeClass('btn-success').addClass('btn-danger');
            $label.find('.yesno').text('No');
        }
    });
}
$(document).ready(setUpPermissionsCheckboxes);

ready = function() {
  if (typeof gon !== "undefined" && gon !== null) {
    return $("#" + gon.currentrsvpstatus).attr('class', 'btn btn-primary');
  }
	
};

$(document).ready(ready);
$(document).on('page:load', ready);


$(document).on('click', '#invite', (function() {
  $.ajax({
    type: "POST",
    url: "/pickadates/invite_user",
    data: {
      id: gon.date.id,
      user_id: $(this).attr("value")
    },
    success: function(data) {
      alert(data.id);
      return false;
    },
    error: function(data) {
      return false;
    }
  });
  return $(this).attr('class', 'btn btn-primary');
}));

$(document).on('click', '#yes', (function() {
  $.ajax({
    type: "POST",
    url: "/pickadates/rsvpstatus",
    data: {
      id: gon.date.id,
      rsvpstatus: "yes"
    },
    success: function(data) {
      alert(data.id);
      return false;
    },
    error: function(data) {
      return false;
    }
  });
  $(this).attr('class', 'btn btn-primary');
  $("#maybe").attr('class', 'btn btn-default');
  return $("#no").attr('class', 'btn btn-default');
}));

$(document).on('click', '#no', (function() {
  $.ajax({
    type: "POST",
    url: "/pickadates/rsvpstatus",
    data: {
      id: gon.date.id,
      rsvpstatus: "no"
    },
    success: function(data) {
      console.log(data.id);
      return false;
    },
    error: function(data) {
      return false;
    }
  });
  $(this).attr('class', 'btn btn-primary');
  $("#maybe").attr('class', 'btn btn-default');
  return $("#yes").attr('class', 'btn btn-default');
}));



// these are the response functions for the invitations page
$(document).on('click', '#iyes', (function() {
  $.ajax({
    type: "POST",
    url: "pickadates/rsvpstatus",
    data: {
      id: $(this).attr("value"),
      rsvpstatus: "yes"
    },
    success: function(data) {
      alert(data.id);
      return false;
    },
    error: function(data) {
      return false;
    }
  });
  $(this).attr('class', 'btn btn-primary btn-sm');
  $("#imaybe").attr('class', 'btn btn-default btn-xs');
  return $("#ino").attr('class', 'btn btn-default btn-xs');
}));

$(document).on('click', '#ino', (function() {
  $.ajax({
    type: "POST",
    url: "pickadates/rsvpstatus",
    data: {
      id: $(this).attr("value"),
      rsvpstatus: "no"
    },
    success: function(data) {
      console.log(data.id);
      return false;
    },
    error: function(data) {
      return false;
    }
  });
  $(this).attr('class', 'btn btn-primary btn-sm');
  $("#imaybe").attr('class', 'btn btn-default btn-xs');
  return $("#iyes").attr('class', 'btn btn-default btn-xs');
}));