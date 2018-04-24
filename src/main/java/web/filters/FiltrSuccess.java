package web.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/success.jsp")
public class FiltrSuccess implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession correctSession = httpRequest.getSession();
		if(correctSession.getAttribute("correct") == null){
			correctSession.setAttribute("correct","0");
		}	
		if(correctSession.getAttribute("correct").equals("4")&&
		   request.getParameter("city") !=null && 
		   !(request.getParameter("city").equals("")) &&
		   request.getParameter("zipCode") !=null && 
		   !(request.getParameter("zipCode").equals(""))&&
		   request.getParameter("street") !=null && 
		   !(request.getParameter("street").equals(""))&&
		   request.getParameter("houseNumber") !=null && 
		   !(request.getParameter("houseNumber").equals("")) &&
		   request.getParameter("localNumber") !=null && 
		   !(request.getParameter("localNumber").equals(""))&&
		   request.getParameter("phoneNumber") !=null && 
		   !(request.getParameter("phoneNumber").equals(""))
				){
			//response.getWriter().println(correctSession.getAttribute("correct"));
			//return;
			correctSession.setAttribute("correct","4");
			chain.doFilter(request, response);
			return;
		}else{
			httpResponse.sendRedirect(httpResponse.encodeRedirectURL("index.jsp"));
			return;
		}
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}
	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
