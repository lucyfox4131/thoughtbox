function readLink(){
  $("body").on('click', '.read', function(){
    var id = $(this).attr("id");
    markAsReadOrUnread(id, true);
  });
}

function unreadLink(){
  $("body").on('click', '.unread', function(){
    var id = $(this).attr("id");
    markAsReadOrUnread(id, false);
  });
}

function markAsReadOrUnread(id, newValue){
    $.ajax({
      url: "/api/v1/links/" + id,
      method: "PATCH",
      dataType: "JSON",
      data: {link: {read: newValue}},
      success: updateLinkStatus,
    });
}

function updateLinkStatus(link){
  var newStatus = status(link.read);
  $("#data" + link.id).find(".status").html("<td class='status' id="+ newStatus +">"+ newStatus +"</td>");
}
