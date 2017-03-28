package lcsw.domain;

import java.util.ArrayList;
import java.util.List;

public class CaseQuery {

	private Case newCase;
	private List<Inquiry> inquirys = new ArrayList<Inquiry>();
	private List<PhysicalExam> physicalExams = new ArrayList<PhysicalExam>();
	private FirstVisit firstVisit;
	private List<AccessoryExam> accessoryExams = new ArrayList<AccessoryExam>();
	private Diagnose diagnose;
	private List<Treatment> treatments = new ArrayList<Treatment>();
	private List<PatientManagement> patientManagements = new ArrayList<PatientManagement>();
	private boolean status;
	
	
	
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Case getNewCase() {
		return newCase;
	}
	public void setNewCase(Case newCase) {
		this.newCase = newCase;
	}
	public List<Inquiry> getInquirys() {
		return inquirys;
	}
	public void setInquirys(List<Inquiry> inquirys) {
		this.inquirys = inquirys;
	}
	public List<PhysicalExam> getPhysicalExams() {
		return physicalExams;
	}
	public void setPhysicalExams(List<PhysicalExam> physicalExams) {
		this.physicalExams = physicalExams;
	}
	public FirstVisit getFirstVisit() {
		return firstVisit;
	}
	public void setFirstVisit(FirstVisit firstVisit) {
		this.firstVisit = firstVisit;
	}
	public List<AccessoryExam> getAccessoryExams() {
		return accessoryExams;
	}
	public void setAccessoryExams(List<AccessoryExam> accessoryExams) {
		this.accessoryExams = accessoryExams;
	}
	public Diagnose getDiagnose() {
		return diagnose;
	}
	public void setDiagnose(Diagnose diagnose) {
		this.diagnose = diagnose;
	}
	public List<Treatment> getTreatments() {
		return treatments;
	}
	public void setTreatments(List<Treatment> treatments) {
		this.treatments = treatments;
	}
	public List<PatientManagement> getPatientManagements() {
		return patientManagements;
	}
	public void setPatientManagements(List<PatientManagement> patientManagements) {
		this.patientManagements = patientManagements;
	}
	
	
	
}
