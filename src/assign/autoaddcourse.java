package assign;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import business.ExcelTools;
import business.action;
import dao.dbconnection;

/**
 * Servlet implementation class autoaddcourse
 */
@WebServlet("/autoaddcourse")
public class autoaddcourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public autoaddcourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String sql="";
		String html="";
		String filename;
		int result = 0;
		Object[][] obj=new Object[5][5];
		filename=request.getParameter("coursefile");
		
		obj=ExcelTools.readexcel(filename);
		
		 dbconnection conn=new dbconnection();
		   Connection con=null;
		   con=conn.connect();
		   action actiontest=new action();
		 sql="insert into course(couid,couname,coutimes,couroom,coutea) values(?,?,?,?,?)";
		   PreparedStatement ppst = null;
		   ResultSet rs=null;
		  // ppst=conn.getPreparedStatement(con,sql,null);
		   for(int i = 0;i<obj.length;i++) {
			  result=actiontest.insert(sql,obj[i]);
		}
		   if(result==0||result==1) {
				html="成功";
				response.getWriter().write(html);
			}
			else
				html="失败<a href='course.jsp'>返回</a>";
				response.getWriter().write(html);
	           
		
		
	}

}
