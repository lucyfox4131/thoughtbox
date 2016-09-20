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
      error: errorMessage,
    });

    $("#title").val("");
    $("#url").val("");
  });
}


function errorMessage(message){
  $(".alert").append("<div class='alert-warning text-center alert-dismissible' role='alert'><button type='button' class='close' data-dismiss='alert' aria-label='Close'><span aria-hidden='true'></span></button>Please enter a valid URL</div>");
  setTimeout(function(){$(".alert").html("");} , 3000);
}
