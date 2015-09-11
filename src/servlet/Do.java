package servlet;

import helper.OnAdd;
import helper.OnAdvancedSearch;
import helper.OnDel;
import helper.OnSimpleSearch;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Do
 */
@WebServlet("/do")
public class Do extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Do() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
	        HttpServletResponse response) throws ServletException, IOException {
		String servlet = request.getParameter("servlet");
		switch (servlet) {
		case "onSimpleSearch":
			OnSimpleSearch.doGet(request, response);
			break;
		case "onAdvancedSearch":
			OnAdvancedSearch.doGet(request, response);
			break;
		case "onAdd":
			OnAdd.doGet(request, response);
			break;
		case "onDel":
			OnDel.doGet(request, response);
			break;
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
	        HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
