<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ page import ="model.Product" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="util.ProductHandler" %>

<%-- This is NOT used by products.jsp but IS used by the ProductList servlet.  It's a different way to show your products (you only want to use one!) 
	A better system here would split out the page header and footer (etc.) into separate JSP files, all within WEB-INF (so none can be accessed directly
	via a URL by a web browser).
	
	This file lives inside WEB-INF/jsp and so cannot be directly accessed by a user via a URL
--%>

    
<!doctype html>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
<link href="css/style.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>Project example - products</title>
</head>
<body>

<%@ include file="/WEB-INF/jsp/navbar.jsp" %>

        <main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">
          <h1>Products</h1>

          <section class="row text-center placeholders">
            <p>A different display of our products. This is used by the ProductList servlet: a different route to viewing products. Does a user need to be told this? No. Does it make a difference? Perhaps...</p>
            <p>Here is some of the data to do with our pipes and glues. It's formatted, but not nicely (e.g. look at the prices).</p>
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
//List of Products - set in ProductList servlet
// Wow - I hope it's set properly and working; we're not checking anything here!
// What should we do? 
ArrayList<Product> products = (ArrayList) request.getAttribute("products");
	for(Object o : products) {
		Product p = (Product) o;
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
    </div>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" type ="text/javascript"> </script >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" > </script >
</body>
</html>