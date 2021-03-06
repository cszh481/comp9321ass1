package helper;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DblpDao;
import dto.DblpElement;

public class OnAdvancedSearch {

	public static void doGet(HttpServletRequest request,
	        HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String year = request.getParameter("year");
		String url = request.getParameter("url");
		String publicationtype = request.getParameter("publicationtype");

		List<DblpElement> elements = DblpDao.advanceSearchByParams(title,
		        author, year, url, publicationtype);

		request.setAttribute("elements", elements);
		request.getRequestDispatcher("result.jsp").forward(request, response);
	}

}
