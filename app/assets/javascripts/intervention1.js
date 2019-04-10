$(document).ready(function () {
  console.log("ready!");

  $("#intervention1_customer_id").change(function () {
    console.log("la liste de customer a change");
    var current_customer_id = $("#intervention1_customer_id").val();
    console.log(current_customer_id);

    if (current_customer_id === '') {
      $("#intervention1_customer_id").prop("disabled", true);
    }
    else {
      $("#intervention1_customer_id").prop("disabled", false);
    }

    $.ajax({
      url: "/tasks",
      method: "GET",
      data: { current_customer_id: current_customer_id },
      success: function (data) {
        console.log('AJAX');
        var tasks = response["tasks"];
        $("#intervention1_customer_id").empty();
        
        $("#intervention1_customer_id").append('<option>Select Task</option>');
        for(var i = 0; i < tasks.length; i++){
          $("#intervention1_customer_id").append('<option value="' + tasks[i]["id"] + '">' +tasks[i]["name"] + '</option>');
        }
      },
    });
  });
});