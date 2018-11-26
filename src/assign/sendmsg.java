package assign;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.sendsms;

/**
 * Servlet implementation class sendmsg
 */
@WebServlet("/sendmsg")
public class sendmsg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public sendmsg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		/*String value = request.getParameter("value");
		//sendsms sendmessage=new sendsms();
		
		if(value.matches("^1[34578]\\d{9}$")){
			//request.getSession().setAttribute("valiNum", code);
			System.out.println("短信发送成功");
	}
		String postUrl = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
		int mobile_code = (int)((Math.random()*9+1)*100000); //获取随机数
		String account = "C01153469"; //查看用户名是登录用户中心->验证码短信->产品总览->APIID
		String password = "d76fa966c30d09c7e50ae1bbcff98369";  //查看密码请登录用户中心->验证码短信->产品总览->APIKEY
		String mobile = request.getParameter("value");
		String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");
		request.getSession().setAttribute("Phone_verify_code",mobile_code);
		System.out.println("密码为："+mobile_code);
//	    User user=new User();
//			user.setPhone_verify_code(mobile_code);
//			System.out.println(mobile_code);
//		
		try {
			URL url = new URL(postUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);//允许连接提交信息
			connection.setRequestMethod("GET");//网页提交方式“GET”、“POST”
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			connection.setRequestProperty("Connection", "Keep-Alive");
			StringBuffer sb = new StringBuffer();
			sb.append("account="+account);
			sb.append("&password="+password);
			sb.append("&mobile="+mobile);
			sb.append("&content="+content);
			OutputStream os = connection.getOutputStream();
			os.write(sb.toString().getBytes());
			os.close();
			String line, result = "";
			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
			while ((line = in.readLine()) != null) {
				result += line + "\n";
			}
			in.close();
			PrintStream out = null ;
			out.println(result);

		} catch (IOException e) {
			e.printStackTrace(System.out);
		}*/
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String postUrl = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
		int mobile_code = (int)((Math.random()*9+1)*100000); //获取随机数
		String account = "C01153469"; //查看用户名是登录用户中心->验证码短信->产品总览->APIID
		String password = "d76fa966c30d09c7e50ae1bbcff98369";  //查看密码请登录用户中心->验证码短信->产品总览->APIKEY
		String mobile = request.getParameter("value");
		String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");
		request.getSession().setAttribute("Phone_verify_code",mobile_code);
		System.out.println("密码为："+mobile_code);
//	    User user=new User();
//			user.setPhone_verify_code(mobile_code);
//			System.out.println(mobile_code);
//		
		try {
			URL url = new URL(postUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setDoOutput(true);//允许连接提交信息
			connection.setRequestMethod("POST");//网页提交方式“GET”、“POST”
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			connection.setRequestProperty("Connection", "Keep-Alive");
			StringBuffer sb = new StringBuffer();
			sb.append("account="+account);
			sb.append("&password="+password);
			sb.append("&mobile="+mobile);
			sb.append("&content="+content);
			OutputStream os = connection.getOutputStream();
			os.write(sb.toString().getBytes());
			os.close();
			String line, result = "";
			BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
			while ((line = in.readLine()) != null) {
				result += line + "\n";
			}
			in.close();
			PrintStream out = null ;
			out.println(result);

		} catch (IOException e) {
			e.printStackTrace(System.out);
		}
	}

}
