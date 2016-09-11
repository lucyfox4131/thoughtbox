function showAll(){
  $("button[name=all-links]").on('click', function(){
    showAllLinks();
  });
}

function showAllLinks(){
  $(".link-row").each(function(index, link){
    $(link).show();
  });
}
