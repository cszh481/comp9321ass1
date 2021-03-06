package helper;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DblpDao;
import dto.DblpElement;

public class OnAdd {
	public static void doGet(HttpServletRequest request,
	        HttpServletResponse response) throws ServletException, IOException {
		String picks[] = request.getParameterValues("pick");

		List<DblpElement> elements = (List<DblpElement>) request.getSession()
		        .getAttribute("session_elements");

		if (picks != null) {
			if (elements == null) {
				elements = new ArrayList<DblpElement>();
			}

			for (String id : picks) {
				DblpElement element = DblpDao.getDblpElementById(Integer
				        .parseInt(id));
				if (!elements.contains(element)) {
					elements.add(element);
				}
			}
		}
		request.getSession().setAttribute("session_elements", elements);
		response.sendRedirect("cart.jsp");
	}

}
