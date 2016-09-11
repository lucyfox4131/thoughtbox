function allLinks(){
  $.ajax({
    url: "/api/v1/links",
    method: "GET",
    dataType: "JSON",
    success: iterateThroughLinks,
  });
}

function iterateThroughLinks(links){
  links.forEach(addNewLink);
}

function addNewLink(link){
  $("#table-headings").after(
    "<tr class='link-row' id='data" + link.id+ "'><td>"+ link.title +"</td><td>"+ link.url +"</td><td>"+ status(link.read) +"</td><td><a class='delete' id='" +  link.id + "'><i class='fa fa-eye' aria-hidden='true'></i></a></td><td><a class='delete' id='" +  link.id + "'><i class='fa fa-eye-slash' aria-hidden='true'></i></a></td></tr>");
}

function status(linkStatus){
  return linkStatus ?  "read" : "unread" ;
}
