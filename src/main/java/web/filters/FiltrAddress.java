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

@WebFilter("/address.jsp")
public class FiltrAddress implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {	
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession correctSession = httpRequest.getSession();
		if(correctSession.getAttribute("correct") == null){
			correctSession.setAttribute("correct","0");
		}	
		if(correctSession.getAttribute("correct").equals("3") && 
		   request.getParameter("firstName") !=null && 
		   !(request.getParameter("firstName").equals("")) &&
		   request.getParameter("surname") !=null && 
		   !(request.getParameter("surname").equals(""))&&
		   request.getParameter("pesel") !=null && 
		   !(request.getParameter("pesel").equals(""))
				){
			//response.getWriter().println(correctSession.getAttribute("correct"));
			//return;
			System.out.println("COS:"+request.getParameter("firstName"));
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
