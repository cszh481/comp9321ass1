package helper;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DblpDao;
import dto.DblpElement;

public class OnSimpleSearch {

	public static void doGet(HttpServletRequest request,
	        HttpServletResponse response) throws ServletException, IOException {
		String keywords = request.getParameter("keywords");
		String publicationtype = request.getParameter("publicationtype");

		List<DblpElement> elements = DblpDao.searchByParams(keywords,
		        publicationtype);

		request.setAttribute("elements", elements);
		request.getRequestDispatcher("result.jsp").forward(request, response);
	}

}
