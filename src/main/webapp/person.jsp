<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="parameters" class="domain.LoanParameters" scope="session"/>
	<jsp:useBean id="loan" class="domain.LoanApplication" scope="session"></jsp:useBean>
			     <!-- nazwa bean'a      pakiet wraz z pełna nazwa klasy     zakres życia czyli sesja -->
	 
	<jsp:setProperty property="amount" name="parameters" param="amount"/>
	<jsp:setProperty property="installmentCount" name="parameters" param="installmentCount"/>
	
	Numer wniosku: <jsp:getProperty property="number" name="loan"/> <br>
	Wnioskowana kwota: <jsp:getProperty property="amount" name="parameters"/>
	
	<!-- 
	<jsp:setProperty property="*" name="parameters"/>
	
	Numer wniosku: ${loan.number}<br>
	Wnioskowana kwota: ${parameters.amount}
	-->
	
	<form action="address.jsp">
		<label>Imie: <input type="text" id="firstName" name="firstName"/></label><br>
		<label>Nazwisko: <input type="text" id="surname" name="surname"/></label><br>
		<label>Nr pesel: <input type="text" id="pesel" name="pesel"/></label><br>
		<input type="submit" value="następny krok"/>
	</form>
	<br>
 	<br>
 	<br>
 	<br>
 	<% 
 		HttpSession correctSession = request.getSession();
 	%>
 	Wartosc zmiennej: <%=correctSession.getAttribute("correct") %>
</body>
</html>