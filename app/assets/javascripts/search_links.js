function searchFilter(){
  $("#search_filter").on('keyup', function(){
    var currentSearch = $(this).val().toLowerCase();

    $(".link-row").each(function(index, link){
      var title = $(this).find(".title").text().toLowerCase();
      var titleContains = title.indexOf(currentSearch) !== -1;
      if (titleContains){
        $(link).show();
      } else {
        $(link).hide();
      }
    });
  });
}
