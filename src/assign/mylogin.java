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
 * Servlet implementation class mylogin
 */
@WebServlet("/mylogin")
public class mylogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mylogin() {
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
		  try {
		   dbconnection conn=new dbconnection();
           Connection con=null;
           con=conn.connect();
           String phone="";String pwd="";
           phone=request.getParameter("phone").trim();
           pwd=request.getParameter("password");
           String sql="select * from student where phone="+phone+"";
           PreparedStatement ppst = null;
           ResultSet rs=null;
           ppst=con.prepareStatement(sql);
		
		/*ppst.setString(2, pwd);*/
		 //ppst.executeQuery();
		rs=conn.getResult(ppst);
         
			if(rs.next())
			   {
				   System.out.println("��½�ɹ�");
			  	   response.sendRedirect("index.html");
			   }
			   else
			      {
				   response.sendRedirect("login.jsp");
			       }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
           
        
	}     

}
