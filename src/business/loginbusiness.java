package business;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class loginbusiness {
	public String loginbus(String name, String pwd) {
		Connection conn = null;
		PreparedStatement ppst = null;
		PreparedStatement ppst1 = null;
		String sql1, sql2, sql3, sql4, m ,sql= "";
		ResultSet rs, rs1 = null;
		String stuname = name;
		String stupwd = pwd;String str_res ="0";
		String cou="0";
//			1. ����
	/*try {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (ClassNotFoundException e) {
			System.out.println("���ݿ�������ʧ��");
		}
		
			conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=stu_man", "sa", "123");
			
			
			sql1 = "select pwd from student where stu_id=?";

			ppst = conn.prepareStatement(sql1);
			ppst.setInt(1, name);
			rs1 = ppst.executeQuery();
			m = rs1.getString(pwd).trim();
			if (m.equals(stupwd)) {
				cou="1";	
				return "1";}
			else
					return "0";

			
		}
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			return cou;

		}*/
		try {
			try {
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//		2. ����
			conn= DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=stu_man", "sa", "1234");
//			3. ִ��

//			sql= "select stuid,stunam,stusex from Student where stuid=" + stuid + 
//					" and stunam= " + stunam ; //���ܱ�ע��
			sql= "select count(*) from Student where phone=? and pwd= ?";
			 
			ppst= conn.prepareStatement(sql);
			ppst.setString(1, name);
			ppst.setString(2, pwd);
//			4. ��ѯ���
			rs= ppst.executeQuery();
			
			while(rs.next()){
				//����ɹ����ء�1�������򷵻ء�0��
				int result= rs.getInt(1);
				System.out.println( "��¼��Ϊ����----------"+ result);
				if (result == 0){
					str_res= "0";
				}else{
					str_res= "1";	
				}
				

			}
		} catch (SQLException e ) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				 if(conn!= null) {
					 conn.close();
					 
				 }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
//			return "0";
			return str_res;	
		}
//		return str_res;	
	}
}

	

