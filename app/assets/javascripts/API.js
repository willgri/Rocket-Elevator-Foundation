// Setting the URL for the ajax call
var uri = "https://rockrest.azurewebsites.net/api";
var uri2 = null;
var uri3 = null;
var items = null;


// Even trigger on selection and adding value of the selected
$('#selection, #Number1').on('change keyup', function () {
    uri2 = "/" + $("#selection option:selected").val();
    uri3 = "/" + $('#Number1').val();
})


// hide table before selection
$('.table').hide();


// Count the numbers of items
function getCount(data) {
    const el = $("#counter");
    let name = "items";
    if (data) {
        if (data > 1) {
            name = "items";
        }
        el.text(data + " " + name);
    } else {
        el.text("No " + name);
    }
}


// Looking for what is selected and set appropriate value to variables
function whatIsSelected() {
    if (uri2 == "/elevator") {
        a = "id"
        b = "status"
        c = "serial_number"
        d = "aType"
    }
    if (uri2 == "/column") {
        a = "id"
        b = "status"
        c = "number_of_floor"
        d = "aType"
    }
    if (uri2 == "/battery") {
        a = "id"
        b = "status"
        c = "operation_certificate"
        d = "aType"
    }
    if (uri2 == "/building") {
        a = "id"
        b = "building_admin_full_name"
        c = ""
        d = ""
    }
    if (uri2 == "/lead") {
        a = "id"
        b = "business_name"
        c = "phone_number"
        d = "email"
    }
}


// Setting titles for the table
function setTitles() {
    $("#th1").html(a.toUpperCase());
    $("#th2").html(b.toUpperCase());
    $("#th3").html(c.toUpperCase());
    $("#th4").html(d.toUpperCase());
    console.log(uri2)
    if (uri2 == "/elevator" || "/column" || "/battery") {
        $("#th5").html("EDIT STATUS");
    }
    if (uri2 == "/building") {
        $("#th5").html("");
        console.log(uri2)
    }
    if (uri2 == "/lead") {
        $("#th5").html("");
        console.log(uri2)
    }
}


// Getting data from the API (call ajax type GET)
function getData() {

    $.ajax({
        type: "GET",
        url: uri + uri2 + uri3,
        cache: false,
        success: function (data) {
            const tBody = $("#items");

            $(tBody).empty();

            getCount(data.length);

            whatIsSelected();

            setTitles();

            // Adding data to fields in the table
            $.each(data, function (key, item) {
                const tr = $("<tr></tr>")
                    .append($("<td></td>").text(item[a]))
                    .append($("<td></td>").text(item[b]))
                    .append($("<td></td>").text(item[c]))
                    .append($("<td></td>").text(item[d]))
                    .append(
                        $("<td></td>").append(
                            $("<button>Edit</button>").on("click", function () {
                                editItem(item.id);
                            })
                        )
                    )
                tr.appendTo(tBody);
            });

            // For editItem function
            items = data;

            // Show the table that was hidden
            $('.table').show();
        }
    });
}


// Edit items status with a button on each of them
function editItem(id) {
    $.each(items, function (key, item) {
        if (item.id === id) {
            $("#edit-name").val(item.status);
            $("#edit-id").val(item.id);
            $("#edit-isComplete")[0].checked = item.isComplete;
        }
    });
    $("#spoiler").css({
        display: "block"
    });
}

// Selecting value from the edit form
$(".my-form").on("submit", function () {
    var item = {
        status: $("#edit-name").val(),
        isComplete: $("#edit-isComplete").is(":checked"),
        id: $("#edit-id").val()
    };

    // Ajax PUT call with the ID and the field value
    $.ajax({
        url: uri + uri2 + "/" + $("#edit-id").val(),
        type: "PUT",
        accepts: "json",
        contentType: "json",
        data: JSON.stringify(item),
        success: function (result) {
            getData();
        }
    });

    closeInput();
    return false;
});


// Hiding the form when the call is done
function closeInput() {
    $("#spoiler").css({
        display: "none"
    });
}