function editTableRow(){
  $('body').on('click', '.edit', function () {
    var currentTD = $(this).parents('tr').find('td');
    var pencilSymbol = "<i class=\"fa fa-pencil\" aria-hidden=\"true\"></i>";
    var saveSymbol = "<i class=\"fa fa-floppy-o\" aria-hidden=\"true\"></i>";
    if ($(this).html() == pencilSymbol) {
      $(this).parents('tr').find('.title').prop('contenteditable', true);
      $(this).parents('tr').find('.url').prop('contenteditable', true);
    } else {
      $.each(currentTD, function () {
        $(this).prop('contenteditable', false);
      });
    }
    $(this).html($(this).html() == pencilSymbol ? saveSymbol : pencilSymbol);
  });
}

function saveEdits(){
  $('body').on('click', '.fa-floppy-o', function () {
    var title = $(this).parents('tr').find('.title').text();
    var url   = $(this).parents('tr').find('.url').text();
    var id = $(this).parents("tr").attr("id").replace("data", "");
    $.ajax({
      url: "/api/v1/links/" + id,
      method: "PATCH",
      dataType: "JSON",
      data: {link: {title: title, url: url}},
      success: youWin,
    });
  });
}

function youWin(link){
  if (link) {
    console.log("Success");
  } else {
    alert("Failed To Save. Make sure your URL is valid and there is a title.");
  }
}
