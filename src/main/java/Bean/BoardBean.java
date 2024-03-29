package Bean;

import java.sql.*;

public class BoardBean {
	private int num;
	private int num_rep;
	private int read_count;
	private int up_count;
	private String writer;
	private String ip;
	private Timestamp reg_date;
	private Timestamp edit_date;
	private String title;
	private String content;
	private int num_board;
	private String attach_file;
	private String attach_file_name;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getNum_rep() {
		return num_rep;
	}
	public void setNum_rep(int num_rep) {
		this.num_rep = num_rep;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public int getUp_count() {
		return up_count;
	}
	public void setUp_count(int up_count) {
		this.up_count = up_count;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public Timestamp getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(Timestamp edit_date) {
		this.edit_date = edit_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNum_board() {
		return num_board;
	}
	public void setNum_board(int num_board) {
		this.num_board = num_board;
	}
	public String getAttach_file() {
		return attach_file;
	}
	public void setAttach_file(String attach_file) {
		this.attach_file = attach_file;
	}
	public String getAttach_file_name() {
		return attach_file_name;
	}
	public void setAttach_file_name(String attach_file_name) {
		this.attach_file_name = attach_file_name;
	}
}
