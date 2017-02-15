package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Barcode1DLog;
import dao.Barcode1DLogDao;
import dao.CallPython;

public class Barcode1D extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public Barcode1D() {
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
		if (device != null)
			out.println("Current device is " + device + "<br />");
		else
			out.println("device is null");
		long start = System.currentTimeMillis();
		String command = "python H://Barcode1D_" + device.trim() + ".py";
		String text = CallPython.callBarcode1D(command);
		long end = System.currentTimeMillis();
		long time = end - start;
		out.print(text + "<br><br>");
		if (text.length() == 0){
			out.print("Selected device is <font color='red'><b>Error</b></font>,");
			out.print("perhaps <font color='red'><b>"+device+"</b></font> is selected mistakenly<br>");
		}
		out.print("File has been saved successfully in H://Barcode1DLog<br>");
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
