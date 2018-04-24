<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="parmeters" class="domain.LoanParameters" scope="session"/>
	<jsp:useBean id="loan" class="domain.LoanApplication" scope="session"></jsp:useBean>
    
    <!--  
    <jsp:useBean id="person" class="domain.Person" scope="session"></jsp:useBean>
    <jsp:setProperty property="firstName" name="person" param="firstName"/>
	<jsp:setProperty property="surname" name="person" param="surname"/>
	<jsp:setProperty property="pesel" name="person" param="pesel"/>
	
    Imie: <jsp:getProperty property="firstName" name="person"/> 
	Nazwisko: <jsp:getProperty property="surname" name="person"/>
    Pesel: <jsp:getProperty property="pesel" name="person"/>
    -->
    
	<jsp:setProperty property="*" name="parameters"/>
	
	Numer wniosku: ${loan.number}<br>
	Wnioskowana kwota: ${parameters.amount}

	<form action="success.jsp">
		<label>Miasto: 		 	 <input type="text" id="city" name="city"/></label><br>
		<label>Kod pocztowy: 	 <input type="text" id="zipCode" name="zipCode"/></label><br>
		<label>Ulica: 		 	 <input type="text" id="street" name="street"/></label><br>
		<label>Numer domu:   	 <input type="number" id="houseNumber" name="houseNumber"/></label><br>
		<label>Numer mieszkania: <input type="number" id="localNumber" name="localNumber"/></label><br>
		<label>Numer telefonu:   <input type="number" id="phoneNumber" name="phoneNumber"/></label><br>
		
		<input type="submit" value="Następny krok"/>
	</form>
	<% 
 		HttpSession correctSession = request.getSession();
 	%>
 	Wartosc zmiennej: <%=correctSession.getAttribute("correct") %>
</body>
</html>