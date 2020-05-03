package beans;

import javax.xml.bind.annotation.XmlRootElement;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@XmlRootElement
public class ScheduleBean {
	int id;
	private String doctorID;
	private String hospitalID;
	private String stTime;
	private String endTime;
	private String day_of_wk;
	private String status;

	public ScheduleBean() {
	}

	public ScheduleBean(String sh) {

		JsonObject scheduleObject = new JsonParser().parse(sh).getAsJsonObject();

		if (scheduleObject.get("scheduleID") != null) {
			this.id = scheduleObject.get("scheduleID").getAsInt();
		}
		this.doctorID = scheduleObject.get("doctorID").getAsString();
		this.hospitalID = scheduleObject.get("hospitalID").getAsString();
		this.stTime = scheduleObject.get("st_time").getAsString();
		this.endTime = scheduleObject.get("end_time").getAsString();
		this.day_of_wk = scheduleObject.get("day_of_wk").getAsString();
		this.status = scheduleObject.get("status").getAsString();

	}

	public ScheduleBean(int id, String doctorID, String hospitalID, String stTime, String endTime, String day_of_wk,
			String status) {

		this.id = id;
		this.doctorID = doctorID;
		this.hospitalID = hospitalID;
		this.stTime = stTime;
		this.endTime = endTime;
		this.day_of_wk = day_of_wk;
		this.status = status;
	}

	public ScheduleBean(String doctorID, String hospitalID, String stTime, String endTime, String day_of_wk,
			String status) {
		this.doctorID = doctorID;
		this.hospitalID = hospitalID;
		this.stTime = stTime;
		this.endTime = endTime;
		this.day_of_wk = day_of_wk;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDoctorID() {
		return doctorID;
	}

	public void setDoctorID(String doctorID) {
		this.doctorID = doctorID;
	}

	public String getHospitalID() {
		return hospitalID;
	}

	public void setHospitalID(String hospitalID) {
		this.hospitalID = hospitalID;
	}

	public String getStTime() {
		return stTime;
	}

	public void setStTime(String stTime) {
		this.stTime = stTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getDay_of_wk() {
		return day_of_wk;
	}

	public void setDay_of_wk(String day_of_wk) {
		this.day_of_wk = day_of_wk;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
