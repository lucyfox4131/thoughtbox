function newLink(){
  $("button[name=save-new-link]").on('click', function(){
    var title = $("#title").val();
    var url = $("#url").val();

    $.ajax({
      url: "api/v1/links",
      method: "POST",
      dataType: "JSON",
      data: {link: {title: title, url: url} },
      success: addNewLink,
    });

    $("#title").val("");
    $("#url").val("");
  });
}
