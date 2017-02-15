package bean;

public class Barcode1DLog {
	private String snnumber;
	private String status;
	private String barcodeID;

	public Barcode1DLog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Barcode1DLog(String snnumber, String status, String barcodeID) {
		super();
		this.snnumber = snnumber;
		this.status = status;
		this.barcodeID = barcodeID;
	}

	public String getSnnumber() {
		return snnumber;
	}

	public void setSnnumber(String snnumber) {
		this.snnumber = snnumber;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBarcodeID() {
		return barcodeID;
	}

	public void setBarcodeID(String barcodeID) {
		this.barcodeID = barcodeID;
	}
}
