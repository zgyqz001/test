package course_score;
import java.sql.*;

import java.util.Scanner;


import java.sql.*;  
public class test {  
	  public static void main(String[] args) {  
		  
		 
		  
    try {  
      Class.forName("com.mysql.jdbc.Driver");     
     
     System.out.println("Success loading Mysql Driver!");  
    }  
    catch (Exception e) {  
      System.out.print("Error loading Mysql Driver!");  
      e.printStackTrace();  
    }  
    System.out.println("请输入数字表示操作：       1.插入学生信息     2.查询学生信息");
    Scanner reader=new Scanner(System.in);int n;
    n=reader.nextInt();
    if(n==1) {
    try {  
      Connection connect = DriverManager.getConnection(  
          "jdbc:mysql://localhost:3306/stsystem?useUnicode=true&characterEncoding=utf-8&useSSL=false","root","111111");  
           Statement stmt = connect.createStatement(); 
       
    	   String t="insert into student(id,score,studentPwd,sname,gender) values('78','201526701180','80','赵一','男')";
     
            
             
           stmt.executeUpdate(t);
           System.out.println("插入成功");
     
      }  
     
    catch (Exception e) {  
      System.out.print("get data error!");  
      e.printStackTrace();  
    }  
  }  
    if(n==2) {
        try {  
          Connection connect = DriverManager.getConnection(  
              "jdbc:mysql://localhost:3306/stsystem?useUnicode=true&characterEncoding=utf-8&useSSL=false","root","111111");  
               Statement stmt = connect.createStatement(); 
           
        	   String t="select * from student";
                ResultSet rs=stmt.executeQuery(t);
                while(rs.next())
                {
                	String score=rs.getString("score");
                	String name=rs.getString("sname");
                	String gender=rs.getString("gender");
                	System.out.println(score+"     "+name+"     "+gender);
                	
                	
                }
            
         
          }  
         
        catch (Exception e) {  
          System.out.print("get data error!");  
          e.printStackTrace();  
        }  
      }  
}  
	  }
