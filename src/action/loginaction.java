package action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import business.insert;
import business.loginbusiness;

/**
 * Servlet implementation class loginaction
 */
@WebServlet("/loginaction")
public class loginaction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginaction() {
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

		String name="";String pwd="";
		name=request.getParameter("phone").trim();
		pwd=request.getParameter("password").trim();
		loginbusiness loginb=new loginbusiness();		
		String result="";
		result=loginb.loginbus(name,pwd);
		if (result.equals("1")) {
			System.out.println("��¼�ɹ�");
			response.sendRedirect("index.html");
		}else{
			System.out.println("��¼ʧ��");
			response.sendRedirect("login.jsp");
		}
		
	}
	

}
