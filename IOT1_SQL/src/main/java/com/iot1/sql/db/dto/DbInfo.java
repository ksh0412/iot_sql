package com.iot1.sql.db.dto;

import java.util.HashSet;
import java.util.Set;

import org.codehaus.jackson.annotate.JsonIgnore;
import org.springframework.stereotype.Component;

@Component

public class DbInfo{
	private int diNum;
	private String dbUrl;
	private String port;
	private String dbms;
	private String dbTitle;
	private String id;
	private String pwd;
	private String driverName;
	@JsonIgnore
	private Set<DataBase> databases = new HashSet<DataBase>();
	
	public String getDriverName() {
		return driverName;
	}

	public void setDriverName(String driverName) {
		this.driverName = driverName;
	}


    public Set<DataBase> getDatabases() {
        return databases;
    }

    public Boolean getHasDatabases() {
        return !getDatabases().isEmpty();
    }  
    
	public String getDbUrl() {
		return dbUrl;
	}

	public void setDbUrl(String dbUrl) {
		this.dbUrl = dbUrl;
	}


	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public String getDbms() {
		return dbms;
	}
	public void setDbms(String dbms) {
		this.dbms = dbms;
	}
	public int getDiNum() {
		return diNum;
	}
	public void setDiNum(int diNum) {
		this.diNum = diNum;
	}
	public String getDbTitle() {
		return dbTitle;
	}
	public void setDbTitle(String dbTitle) {
		this.dbTitle = dbTitle;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Override
	public String toString() {
		return "DbInfo [diNum=" + diNum + ", dbUrl=" + dbUrl + ", port=" + port + ", dbms=" + dbms + ", dbTitle="
				+ dbTitle + ", id=" + id + ", pwd=" + pwd + ", driverName=" + driverName + ", databases=" + databases
				+ "]";
	}
	
	
}
