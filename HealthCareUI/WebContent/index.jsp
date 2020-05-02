<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.3.1.min.js"></script>
<script src="Components/Main.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4">

				<h1 id="heading">Create Schedule</h1>
				<form id="formSchedule" name="formSchedule">
					Doctor ID: <input id="doctorID" name="doctorID" type="number"
						class="form-control form-control-sm"> <br> Hospital
					ID:<input id="hospitalID" name="hospitalID" type="number"
						class="form-control form-control-sm"> <br> Start
					Time: <input id="startTime" name="startTime" type="time"
						class="form-control form-control-sm"> <br> Start
					Time: <input id="endTime" name="endTime" type="time"
						class="form-control form-control-sm"> <br> Day Of
					Week: <select class="form-control form-control-sm" id='day'
						name="day">
						<option selected value=''>--Select Date--</option>
						<option value='Monday'>Monday</option>
						<option value='Tuesday'>Tuesday</option>
						<option value='Wednesday'>Wednesday</option>
						<option value='Thursday'>Thursday</option>
						<option value='Friday'>Friday</option>
						<option value='Saturday'>Saturday</option>
						<option value='Sunday'>Sunday</option>

					</select> <br> <input id="btnSave" name="btnSave" type="button"
						value="Save" class="btn btn-primary"> <input type="hidden"
						id="hidItemIDSave" name="hidItemIDSave" value="">
				</form>
				<div id="alertSuccess" class="alert alert-success"></div>
				<div id="alertError" class="alert alert-danger"></div>
				<br>



			</div>
			<div class="col-md-8">

				<div class="container">
					<h2>Schedules Table</h2>
					<p>available Doctors time Schedules:</p>
					<table class="table table-striped" id="scheduleTable">
						<thead>
							<tr>
								<th>Doctor ID</th>
								<th>Hospital ID</th>
								<th>Start Time</th>
								<th>End Time</th>
								<th>Week Day</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>



</html>