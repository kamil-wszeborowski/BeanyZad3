<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cwiczenie3</title>
</head>

<body>
 Witaj na stronie <strong>Pożyczek u Bronka</strong>-<em>"Komornik to nasz przyjaciel"</em>
 <br>
 <a href="/loanParameters.jsp"> złóż wniosek online</a>
 
 
 <% 
 	String zmienna = "1";
 	HttpSession correctSession = request.getSession();
    correctSession.setAttribute("correct", zmienna);
 %>
 <br>
 	<br>
 	<br>
 	<br>
 	Wartosc zmiennej: <%=correctSession.getAttribute("correct") %>
</body>

</html>