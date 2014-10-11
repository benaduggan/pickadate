var ready;

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
    url: "rsvpstatus",
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

$(document).on('click', '#maybe', (function() {
  $.ajax({
    type: "POST",
    url: "rsvpstatus",
    data: {
      id: gon.date.id,
      rsvpstatus: "maybe"
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
  $("#yes").attr('class', 'btn btn-default');
  return $("#no").attr('class', 'btn btn-default');
}));

$(document).on('click', '#no', (function() {
  $.ajax({
    type: "POST",
    url: "rsvpstatus",
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

$(document).on('click', '#imaybe', (function() {
  $.ajax({
    type: "POST",
    url: "pickadates/rsvpstatus",
    data: {
      id: $(this).attr("value"),
      rsvpstatus: "maybe"
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
  $("#iyes").attr('class', 'btn btn-default btn-xs');
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