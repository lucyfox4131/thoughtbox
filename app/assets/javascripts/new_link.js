function newIdea(){
  $("button[name=save-new-link]").on('click', function(){
    var title = $("#title").val();
    var url = $("#url").val();

    $.ajax({
      url: "/links",
      method: "POST",
      dataType: "JSON",
      data: {link: {title: title, url: url} },
      success: addNewLink,
      error: creationError
    });

    $("#title").val("");
    $("#url").val("");
  });
}

function addNewLink(link){
  $("#table-headings").after(
    "<tr class='link-row' id='data" + link.id+ "'><td>"+ link.title +"<td><td>"+ link.url +"<td><td>"+ status(link.read) +"<td></tr>");
}

function status(linkStatus){
  return linkStatus ?  "read" : "unread" ;
}
