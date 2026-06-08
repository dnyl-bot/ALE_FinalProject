<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ page import ="model.Product" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="util.BasketHandler" %>

<!doctype html>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
<link href="css/style.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>Project example - basket</title>
</head>
<body>


    <%@include file="WEB-INF/jsp/navbar.jsp" %>
    
    
        <main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">
          <h1>Basket</h1>

          <section class="row text-center placeholders">
            What should be shown here? Has anything been added to your basket?
          </section>
          In your basket is:
          <ul>
          <%
          ArrayList<Product> products = BasketHandler.getItemsFromBasket();
          for(Product p : products){
        	  %>
        	  <li><%=p.getName() %></li>
        	  <%
          }
          
          %>
          </ul>
		</main>

</body>
</html>