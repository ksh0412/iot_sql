package com.iot1.sql.db.dao;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iot1.sql.common.DataSourceFactory;
import com.iot1.sql.db.dto.Column;
import com.iot1.sql.db.dto.DataBase;
import com.iot1.sql.db.dto.DbInfo;
import com.iot1.sql.db.dto.Table;


@Repository
public class DbDAOImpl extends SqlSessionDaoSupport implements DbDAO {
	@Autowired
	DataSourceFactory dsf;
	
	@Override
	public List<DbInfo> selectDbInfoList(DbInfo di) {
		return this.getSqlSession().selectList("db.SELECT_DB", di);
	}

	@Override
	public DbInfo selectDbInfo(DbInfo di) {
		return this.getSqlSession().selectOne("db.SELECT_DB", di);
	}

	@Override
	public boolean isConnecteDB(DbInfo di) throws Exception {
		return dsf.isConnecteDB(di);
	}

	public List<DataBase> selectDatabaseList() throws Exception {
		DatabaseMetaData meta = dsf.getSqlSession().getConnection().getMetaData();
		ResultSet ctlgs = meta.getCatalogs();
		List<DataBase> databaseList = new ArrayList<DataBase>();
		while (ctlgs.next()) {
			DataBase db = new DataBase();
			db.setDatabase(ctlgs.getString(1));
			databaseList.add(db);
		}
		return databaseList;
	}

	// TABLE_SELECT
	public List<Table> selectTableList(DataBase di) throws Exception {
		dsf.getSqlSession().selectList("db.USE_DATABASE", di);
		return dsf.getSqlSession().selectList("db.TABLE_SELECT", di);
	}

	@Override
	public List<Column> selectTableInfo(Table table) throws Exception {
		return dsf.getSqlSession().selectList("db.TABLE_INFO_SELECT", table);
	}

	@Override
	public Map<String, Object> runSql(Map<String, String> pm) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> type = new ArrayList<String>();
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		try{
			String sql = pm.get("sql");
			sql = sql.trim();
			map.put("sqlLog", sql);
			Statement statement = dsf.getSqlSession().getConnection().createStatement();
			if (sql.indexOf("select") == 0) {
				type.add("select");
				ResultSet resultSet = statement.executeQuery(sql);
				ResultSetMetaData metadata = resultSet.getMetaData();
				int columnCount = metadata.getColumnCount();
				List<String> columns = new ArrayList<String>();
				for (int i = 1; i <= columnCount; i++) {
					String columnName = metadata.getColumnName(i);
					columns.add(columnName);
				}
				while (resultSet.next()) {
					Map<String, String> hm = new HashMap<String, String>();
					for (String column : columns) {
						hm.put(column, resultSet.getString(column));
					}
					list.add(hm);
				}

				map.put("type", type);
				map.put("list", list);
				map.put("columns", columns);
				map.put("row", 0);
			} else if(sql.indexOf("insert") == 0){
				type.add("insert");
				int result = statement.executeUpdate(sql);
				map.put("type", type);
				map.put("list", list);
				map.put("row", result);
			} else if(sql.indexOf("update") == 0){
				type.add("update");
				int result = statement.executeUpdate(sql);
				map.put("type", type);
				map.put("list", list);
				map.put("row", result);
			} else if(sql.indexOf("delete") == 0){
				type.add("delete");
				int result = statement.executeUpdate(sql);
				map.put("type", type);
				map.put("list", list);
				map.put("row", result);
			}
			return map;
		}catch(Exception e){
			return null;
		}
		
	}

	@Override
	public Map<String, Object> runSqls(Map<String, List> pm) throws Exception {
		List sqls = pm.get("sqls");
		String sql = "", sqlObj = "";
		Connection con = null;
		if(con==null){
			con = dsf.getSqlSession().getConnection();
		}
		Statement statement = con.createStatement();
		Map<String, Object> map = new HashMap<String, Object>();
		List<String> type = new ArrayList<String>();
		ArrayList logList = new ArrayList();
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
//		Statement statement = dsf.getSqlSession().getConnection().createStatement();
		for (int j = 0, max = sqls.size(); j < max; j++) {
			sqlObj = (String) sqls.get(j);
			sql = sqlObj.trim();
			logList.add(sql+"</br>");
			if (sql.indexOf("select") == 0) {
				type.add("select");
				ResultSet resultSet = statement.executeQuery(sql);
				ResultSetMetaData metadata = resultSet.getMetaData();
				int columnCount = metadata.getColumnCount();
				List<String> columns = new ArrayList<String>();
				for (int i = 1; i <= columnCount; i++) {
					String columnName = metadata.getColumnName(i);
					columns.add(columnName);
				}
				while (resultSet.next()) {
					Map<String, String> hm = new HashMap<String, String>();
					for (String column : columns) {
						hm.put(column, resultSet.getString(column));
					}
					list.add(hm);
				}

				map.put("type", type);
				map.put("list", list);
				map.put("columns", columns);
				map.put("row", 0);
			} else if(sql.indexOf("insert") == 0){
				type.add("insert");
				int result = statement.executeUpdate(sql);
				map.put("type", type);
				map.put("list", list);
				map.put("row", result);
			} else if(sql.indexOf("update") == 0){
				type.add("update");
				int result = statement.executeUpdate(sql);
				map.put("type", type);
				map.put("list", list);
				map.put("row", result);
			} else if(sql.indexOf("delete") == 0){
				type.add("delete");
				int result = statement.executeUpdate(sql);
				map.put("type", type);
				map.put("list", list);
				map.put("row", result);
			}
			con.commit();
		}

		map.put("sqlLog", logList);
		return map;
	}

}
