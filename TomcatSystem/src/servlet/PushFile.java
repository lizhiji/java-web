package servlet;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CallPython;

public class PushFile extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public PushFile() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String device = request.getParameter("device");

		// 获取项目的文件夹的路径，而不是系统的文件的路径
		// String path =
		// "H://apache-tomcat-8.5.11//webapps//TestSystem//pyfile";
		if (device != null)
			out.println("Current device is " + device + "<br />");
		else
			out.println("device is null");
		long start = System.currentTimeMillis();
		String command = "python H:\\pushjar_" + device.trim() + ".py";// device的前後可能有空格啊！摔！！！所以用trim();
		String text = CallPython.callPython(command);
		out.print(text+"<br>");
		if (text.length() == 0){
			out.print("Selected device is <font color='red'><b>Error</b></font>,");
			out.print("perhaps <font color='red'><b>"+device+"</b></font> is selected mistakenly<br>");
		}
		long end = System.currentTimeMillis();
		long time = end - start;
		out.println("cost " + time + "ms");

	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
