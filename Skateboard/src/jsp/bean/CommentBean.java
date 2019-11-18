package jsp.bean;

public class CommentBean {
	private int cmid;
	private int nid;
	private String text;
	private String uid;
	private String date;
	
	public int getCmid() {
		return cmid;
	}
	public void setCmid(int cmid) {
		this.cmid = cmid;
	}
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
