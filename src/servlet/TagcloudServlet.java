package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logic.WordFreStat;

import weibo4j.Timeline;
import weibo4j.examples.timeline.GetUserTimeline;
import weibo4j.model.Status;
import weibo4j.model.WeiboException;
import weibo4j.org.json.JSONArray;

public class TagcloudServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public TagcloudServlet() {
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
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String token = (String)request.getSession().getAttribute("token");
		Timeline tl = new Timeline();
		tl.setToken(token);
		List<Status> statusList = null;
		System.out.println("开始");
		try {
			statusList = tl.getUserTimeline().getStatuses();
			
		} catch (WeiboException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		JSONArray j = WordFreStat.execute(statusList);
		request.setAttribute("array", j.toString());
		
		//request.setAttribute("array", statusList.toString());
		request.getRequestDispatcher("home.jsp").forward(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String token = (String)request.getSession().getAttribute("token");
		Timeline tl = new Timeline();
		tl.setToken(token);
		List<Status> statusList = null;
		try {
			statusList = tl.getUserTimeline().getStatuses();
		} catch (WeiboException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		WordFreStat wfs = new WordFreStat(statusList);
		JSONArray j = wfs.execute();
		request.setAttribute("array", j.toString());
		*/
		request.setAttribute("array", statusList.toString());
		request.getRequestDispatcher("cloud.jsp").forward(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
