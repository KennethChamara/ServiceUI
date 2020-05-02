$(document).ready(function() {
	if ($("#alertSuccess").text().trim() == "") {
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
	refresh();

});
// SAVE ============================================
$(document)
		.on(
				"click",
				"#btnSave",
				function(event) {
					// Clear alerts---------------------
					$("#alertSuccess").text("");
					$("#alertSuccess").hide();
					$("#alertError").text("");
					$("#alertError").hide();
					// Form validation-------------------
					var status = validateItemForm();
					if (status != true) {
						$("#alertError").text(status);
						$("#alertError").show();
						return;
					}

					var formObj = $("#formSchedule")
					var schedule = {}
					schedule["doctorID"] = formObj.find("#doctorID").val()
							.trim()
					schedule["hospitalID"] = formObj.find("#hospitalID").val()
							.trim()
					schedule["stTime"] = formObj.find("#startTime").val()
							.trim()
					schedule["endTime"] = formObj.find("#endTime").val().trim()
					schedule["day_of_wk"] = formObj.find("#day").val().trim()
					schedule["status"] = "AV"
					var type = ($("#hidItemIDSave").val() == "") ? "POST"
							: "PUT";
					serviceUrl = "http://localhost:8081/SheduleService/ScheduleService/schedules"
					if (type == "PUT") {
						serviceUrl = "http://localhost:8081/SheduleService/ScheduleService/schedules/"
								+ $("#hidItemIDSave").val().trim()
					}
					$.ajax({
						url : serviceUrl,
						type : type,
						data : JSON.stringify(schedule),
						contentType : "application/json",
						beforeSend : function(xhr) {
							xhr.setRequestHeader("Authorization", "Basic "
									+ btoa("admin" + ":" + "admin"));
						},
						complete : function(response, status) {
							onItemSaveComplete(response.responseText, status);
						}
					});
				});
// UPDATE==========================================
$(document)
		.on(
				"click",
				".btnUpdate",
				function(event) {
					$("#heading").text("Update Schedule")
					$("#hidItemIDSave").val(
							$(this).closest("tr").find('#hidItemIDUpdate')
									.val());
					$("#doctorID").val(
							$(this).closest("tr").find('td:eq(0)').text());
					$("#hospitalID").val(
							$(this).closest("tr").find('td:eq(1)').text());
					$("#startTime").val(
							$(this).closest("tr").find('td:eq(2)').text());
					$("#endTime").val(
							$(this).closest("tr").find('td:eq(3)').text());
					$("#day")
							.val($(this).closest("tr").find('td:eq(4)').text());
				});

$(document)
		.on(
				"click",
				".btnRemove",
				function(event) {
					var r = confirm("Do you want to delete this record");
					if (r == true) {
						serviceUrl = "http://localhost:8081/SheduleService/ScheduleService/schedules/"
								+ $(this).data("schduleid")
						$.ajax({
							url : serviceUrl,
							type : "DELETE",
							beforeSend : function(xhr) {
								xhr.setRequestHeader("Authorization", "Basic "
										+ btoa("admin" + ":" + "admin"));
							},
							complete : function(response, status) {
								onItemDeleteComplete(response.responseText,
										status);
								console.log(status)
							}

						});
					}
				});

// CLIENTMODEL=========================================================================
function validateItemForm() {
	// DoctorID
	if ($("#doctorID").val().trim() == "") {
		return "Insert Doctor ID.";
	}
	// HospitalID
	if ($("#hospitalID").val().trim() == "") {
		return "Insert Hospital ID.";
	}

	// StartTime-------------------------------
	if ($("#startTime").val().trim() == "") {
		return "Insert Start Time.";
	}

	// EndTime-------------------------------
	if ($("#endTime").val().trim() == "") {
		return "Insert End Time.";
	}
	// is numerical value
	var docID = $("#doctorID").val().trim();
	var hosID = $("#hospitalID").val().trim();
	if (!$.isNumeric(docID)) {
		return "Doctor ID should be numeric.";
	}

	if (!$.isNumeric(hosID)) {
		return "Hospital ID should be numeric.";
	}

	// DESCRIPTION------------------------
	if ($("#day").val().trim() == "") {
		return "Select a Day.";
	}
	return true;
}

function onItemSaveComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	$("#hidItemIDSave").val("");
	$("#formSchedule")[0].reset();
	$("#heading").text("Create Schedule");
	refresh();

}

function onItemDeleteComplete(response, status) {
	if (status == "success") {
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success") {
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divItemsGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error") {
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else {
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
	refresh()
}

function viewSchedules(data) {
	$("#scheduleTable tbody").empty();
	var content = ""
	$
			.each(
					data,
					function(index, obj) {
						content += "<tr><td><input id='hidItemIDUpdate' name='hidItemIDUpdate' type='hidden' value='"
								+ obj["id"] + "'>" + obj["doctorID"] + "</td>";
						content += "<td>" + obj["hospitalID"] + "</td><td>"
								+ obj["stTime"] + "</td><td>" + obj["endTime"]
								+ "</td><td>" + obj["day_of_wk"] + "</td><td>"
								+ obj["status"] + "</td>"

						content += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
								+ "<td><input name='btnRemove' type='button' value='Remove' class='btnRemove btn btn-danger' data-schduleid='"
								+ obj["id"] + "'>" + "</td></tr>";
					});

	$("#scheduleTable tbody").append(content);
}

function refresh() {

	serviceUrl = "http://localhost:8081/SheduleService/ScheduleService/schedules"
	$.ajax({
		dataType : 'json',
		url : serviceUrl,
		beforeSend : function(xhr) {
			xhr.setRequestHeader("Authorization", "Basic "
					+ btoa("admin" + ":" + "admin"));
		},
		success : function(data) {
			viewSchedules(data)
		}
	});

}
