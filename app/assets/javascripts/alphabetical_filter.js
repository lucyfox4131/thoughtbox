function alphaFilter(){
  $("button[name=alpha-sort]").on('click', function(){
    var allLinks = $(".link-row");
    var sorted = _.sortBy(allLinks, function(link){
      return $(link).find(".title").text();
    });
    replaceWithSorted(sorted.reverse());
  });
}

function replaceWithSorted(links){
  links.forEach(function(link){
    $("#table-headings").after(link);
  });
}
