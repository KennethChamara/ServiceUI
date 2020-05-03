package com;

import java.net.URISyntaxException;
import java.util.List;

import javax.annotation.security.RolesAllowed;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

import beans.ScheduleBean;
import model.Schedule;

@Path("/schedules")
public class ScheduleService {

	Schedule scheduleObj = new Schedule();

	@RolesAllowed("admin")
	@GET
	@Path("/")
	@Produces(MediaType.APPLICATION_JSON)
	public Response readSchedule(@QueryParam("docId") int did, @QueryParam("day") String day,
			@QueryParam("hosId") int hid) {
		List<ScheduleBean> list;
		Response response;

		if (did > 0) {
			list = scheduleObj.getShedulesByDoc(did);
			response = Response.ok(scheduleObj.getShedulesByDoc(did)).build();

		} else if (hid > 0) {
			list = scheduleObj.getShedulesByHos(hid);
			response = Response.ok(scheduleObj.getShedulesByHos(hid)).build();

		} else if (day != null) {
			list = scheduleObj.getShedulesByDay(day);

			response = Response.ok(scheduleObj.getShedulesByDay(day)).build();

		} else {
			list = scheduleObj.readSchedule();
			response = Response.ok(scheduleObj.readSchedule()).build();
		}

		if (!list.isEmpty()) {
			return response;
		}
		return Response.noContent().build();
	}

	@RolesAllowed({ "docters", "admin","patient" })
	@GET
	@Path("/{scheduleID}")
	@Produces(MediaType.APPLICATION_JSON)
	public Response readScheduleById(@PathParam("scheduleID") int id) {
		ScheduleBean sch = scheduleObj.readScheduleById(id);
		if (sch != null) {
			return Response.ok().entity(scheduleObj.readScheduleById(id)).build();
		}
		return Response.noContent().build();
	}

	@RolesAllowed({ "admin", "docters" })
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response inserSchedule(ScheduleBean sch, @Context UriInfo uri) throws URISyntaxException {
		Response response = scheduleObj.insertScedule(sch, uri);
		return response;
	}

	@RolesAllowed({ "admin", "docters" })
	@PUT
	@Path("/{scheduleID}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	public Response updateSchedule(@PathParam("scheduleID") int scheduleID, ScheduleBean sch, @Context UriInfo uri)
			throws URISyntaxException {
		sch.setId(scheduleID);
		return scheduleObj.updateSchedule(sch, uri);
	}

	@RolesAllowed({ "admin", "docters" })
	@DELETE
	@Path("/{scheduleID}")
	@Produces(MediaType.TEXT_PLAIN)
	public Response deleteSchedule(@PathParam("scheduleID") int scheduleID) {
		return scheduleObj.deleteSchedule(scheduleID);
	}

}
