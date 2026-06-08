<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ page import ="model.Product" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="util.ProductHandler" %> 
   
<!doctype html>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
<link href="css/style.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>Project example - products</title>
</head>
<body>

    <%@include file="WEB-INF/jsp/navbar.jsp" %>
    
<div class="container-fluid">
        <main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">
          <h1>Products</h1>
          <section class="row text-center placeholders">
            <p>Our products. Displays some of the data to do with our pipes and glues. It's formatted, but not nicely (e.g. look at the prices).</p>
            <p>Please remember to enter a quantity before you try and purchase something. Perhaps things could work more nicely.
          </section>

          <h2>All products</h2>
          <div class="table-responsive">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th>Product Id</th>
                  <th>Name</th>
                  <th>Description</th>
                  <th>Price</th>
                  <th>Quantity</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
<%
// List of Products
	ArrayList<Product> products = ProductHandler.getProducts();
	for(Product p : products) {              	
%>
                <tr class="prod p<%= p.getId() %>">
                	
                  		<td><%= p.getId() %></td>
                  		<td><%= p.getName() %></td>
                  		<td><%= p.getDescription() %></td>
                  		<td><%= p.getFormattedPrice() %></td>
                    		<td><form class="form-horizontal"  action="/ALE_Final_Project/AddToBasket" method="get">
                  			<input type="text" name="qty" value="0" class="col-xs-2"></input>
                  			<input type="hidden" name="pid" value="<%= p.getId() %>" ><button type="submit" >Purchase</button>
                  			</form>	
                  		</td>	
                </tr>
<%
	}
%>
       			</tbody>
            </table>
          </div>
        </main>
      </div>

<script src="https://code.jquery.com/jquery-1.12.4.min.js" type ="text/javascript"> </script >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" > </script >
</body>
</html>