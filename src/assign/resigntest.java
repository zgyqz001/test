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
 * Servlet implementation class resigntest
 */
@WebServlet("/resigntest")
public class resigntest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public resigntest() {
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
		//���÷������˵ı���
		response.setCharacterEncoding("utf-8");
//		//������Ӧ���ײ����������ͺ� ���룻 �м��- ǧ�����٣�
		response.setHeader("Content-Type","text/html; charset=utf-8");
		//���߸�֪������� ��������Ӧ������
//		response.setContentType("text/html; charset=utf-8");
		int id;String phone="",name="",bir="",pwd="";
		  try {
			   dbconnection conn=new dbconnection();
	           Connection con=null;
	           con=conn.connect();
	         
	           phone=request.getParameter("phone").trim();
	           pwd=request.getParameter("password");
	           id=Integer.parseInt(request.getParameter("code"));
	           name=request.getParameter("name");
	           bir=request.getParameter("birthday");
	           String sql="insert into student(stu_id,phone,stu_name,stubir,pwd) values(?,?,?,?,?)";
	           PreparedStatement ppst = null;
	           ResultSet rs=null;
	           ppst=conn.getPreparedStatement(con,sql,null);
			ppst.setInt(1, id);
			ppst.setString(2,phone);
			ppst.setString(3,name);
			ppst.setString(4,bir);
			ppst.setString(5,pwd);
			 //ppst.executeQuery();
			ppst.execute();
			
					   response.sendRedirect("login.jsp");
				       
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	           
	        
		} 

}
