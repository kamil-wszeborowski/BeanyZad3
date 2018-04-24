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

import domain.LoanApplication;
import domain.LoanParameters;

@WebFilter("/person.jsp")
public class FiltrPerson implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//LoanApplication person = (LoanApplication) ((HttpServletRequest) request).getSession().getAttribute("loan");
		//LoanParameters loanParam = (LoanParameters) ((HttpServletRequest) request).getSession().getAttribute("parameters");
		
		int amount=0;
		int installmentCount =0;
		if (request.getParameter("amount") == null || request.getParameter("amount")==""){
			amount=0;
	    }else{
	    	amount= Integer.parseInt(request.getParameter("amount")); 
	    }
		if (request.getParameter("installmentCount") == null || request.getParameter("amount")==""){
			installmentCount=0;
	    }else{
	    	installmentCount=Integer.parseInt(request.getParameter("installmentCount"));
	    } 
		
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession correctSession = httpRequest.getSession();
		if(correctSession.getAttribute("correct") == null){
			correctSession.setAttribute("correct","0");
		}	
		if(correctSession.getAttribute("correct").equals("2") && amount >= 1000 && installmentCount >=6){
			//response.getWriter().println(correctSession.getAttribute("correct"));
			//return;
			correctSession.setAttribute("correct","3");
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
