function showReadLinks(){
  $("button[name=read-links]").on('click', function(){
    filterByStatus("read");
  });
}

function showUnreadLinks(){
  $("button[name=unread-links]").on('click', function(){
    filterByStatus("unread");
  });
}

function filterByStatus(filterStatus){
  $(".link-row").each(function(index, link){
    var status = $(this).find(".status").text();
    if (status === filterStatus){
      $(link).show();
    } else {
      $(link).hide();
    }
  });
}
