<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="domain.LoanApplication"  %>
<%@ page import="services.LoanService"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="loanService" class="services.LoanService" scope="application"/>
	<jsp:useBean id="loan" class="domain.LoanApplication" scope="session"></jsp:useBean>
	<jsp:useBean id="parameters" class="domain.LoanParameters" scope="session"></jsp:useBean>
	<jsp:useBean id="person" class="domain.Person" scope="session"></jsp:useBean>
	<jsp:useBean id="address" class="domain.Address" scope="session"></jsp:useBean>
	
	<jsp:setProperty property="*" name="person"/>
	<jsp:setProperty property="*" name="address"/>
	<%
		loan.setParameters(parameters);
		loan.setPerson(person);
		loan.setAddress(address);
		loanService.add(loan);
	%>
	<ul>
	<%
		for(LoanApplication loanApplication: loanService.getAll()){
	%>
	<li>Wniosek: <%=loanApplication.getNumber()
								+", Kwota: "+ loanApplication.getParameters().getAmount()
								+", Osoba: "+ loanApplication.getPerson().getSurname()
								+", Pesel: "+ loanApplication.getPerson().getPesel()
								+", Miasto: "+ loanApplication.getAddress().getCity()
								+", Ulica: "+ loanApplication.getAddress().getHouseNumber()+"/"+loanApplication.getAddress().getLocalNumber()
								+", Telefon: "+ loanApplication.getAddress().getPhoneNumber()
	%>
	</li>
	<%
		}
	%>
	</ul>
	
	<% 
 		HttpSession correctSession = request.getSession();
 	%>
 	Wartosc zmiennej: <%=correctSession.getAttribute("correct") %>
</body>
</html>