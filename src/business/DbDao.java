package business;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.dbconnection;

public class DbDao {
	static Connection con=null;
	static PreparedStatement ps=null;
	ResultSet rs=null;
	//用户密码匹配
	public String checkpsd(String sql,Object...objects) {
		con=dbconnection.connect();
		Object[] obj=new Object[1];
		obj[0]=objects[0];
		ps=dbconnection.getPreparedStatement(con, sql, obj);
		try {
			rs=dbconnection.getResult(ps);
			while(rs.next()){
				String pass=rs.getString(1);
				if(pass.equals(objects [1])) {
					return "1";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return "2";
		}
		return "0";
	}
	public int insert(String sql,Object...objects) {
		con=dbconnection.connect();
		ps=dbconnection.getPreparedStatement(con, sql, objects);
		return dbconnection.execute(ps);
	}
	}
