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

import dao.dbconnection;

/**
 * Servlet implementation class myaddcourse
 */
@WebServlet("/myaddcourse")
public class myaddcourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myaddcourse() {
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
		request.setCharacterEncoding("utf-8");
		//设置服务器端的编码
		response.setCharacterEncoding("utf-8");
//		//设置响应体首部：包括类型和 编码； 中间的- 千万不能少；
		response.setHeader("Content-Type","text/html; charset=utf-8");
		//或者告知浏览器： 服务器响应的内容
//		response.setContentType("text/html; charset=utf-8");
		
		String sql;
		String html;
		String filename;
		int result = 0;
		
		String couid="";
		String couname="";
		
		int coutimes;
		String couroom="";
	     String coutea="";
		
		 try {
			   dbconnection conn=new dbconnection();
	           Connection con=null;
	           con=conn.connect();
	           couid=request.getParameter("couid").trim();
	           couname=request.getParameter("couname").trim();
	           coutimes=Integer.parseInt(request.getParameter("coutimes").trim());
	           couroom=request.getParameter("couroom").trim();
	           coutea=request.getParameter("coutea").trim();
	         sql="insert into course(couid,couname,coutimes,couroom,coutea) values(?,?,?,?,?)";
	           PreparedStatement ppst = null;
	           ResultSet rs=null;
	           ppst=con.prepareStatement(sql);
			ppst.setString(1, couid);
			ppst.setString(2,couname);
			ppst.setInt(3, coutimes);
			ppst.setString(4,couroom);
			ppst.setString(5,coutea);
			 //ppst.executeQuery();
			ppst.execute();
			
					  response.sendRedirect("login.jsp");
				       
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	           
		
	
		
	
	}
	}


