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
    "<tr class='link-row' id='data" + link.id+ "'><td class='title'>"+ link.title +"</td><td>"+ link.url +"</td><td class='status'>"+ status(link.read) +"</td><td><a class='read' id='" +  link.id + "'><i class='fa fa-eye' aria-hidden='true'></i></a></td><td><a class='unread' id='" +  link.id + "'><i class='fa fa-eye-slash' aria-hidden='true'></i></a></td></tr>");
}

function status(linkStatus){
  return linkStatus ?  "read" : "unread" ;
}
