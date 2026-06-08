<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
<!DOCTYPE html>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
<link href="css/style.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Project example</title>
</head>
<body>

	<%@include file="WEB-INF/jsp/navbar.jsp" %>
    

    <!-- Main jumbotron -->
     
    <div class="jumbotron">
      <div class="container">
        <h1 class="display-3">Project example</h1>
        <p>An example of a styled page or two which interacts with a database and utilises a Java model to facilitate this.</p>
        <p>This DOES NOT claim to be the best way to structure code, nor does it aim to demonstrate all things that will help you (e.g. there's little templating so a change to the structure of one page can require a change to all of them).</p>
        <p>Think about what's here, what is similar to what you need, and what is missing. Think, too, about what could be improved: what's making your life difficult?</p>
        <p>Styling: This is (almost) plain Bootstrap. You don't have to use the default colours/layouts; you don't have to use Bootstrap at all.</p>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-4">
          <h2>Products</h2>
          <p>See a list of products. </p>
          <p><a class="btn btn-secondary" href="products.jsp" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>Products - again</h2>
          <p>See a different list of the same products. </p>
          <p>Why? What's the difference?</p>
          <p><a class="btn btn-secondary" href="ProductList" role="button">View details &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2>Basket</h2>
          <p>See what's in the basket.</p>
          <p><a class="btn btn-secondary" href="basket.jsp" role="button">View details &raquo;</a></p>
        </div>
      </div>

      <hr>

      <footer>
        <p>Something at the bottom of the page</p>
      </footer>
    </div> <!-- /container -->
<script src="https://code.jquery.com/jquery-1.12.4.min.js" type ="text/javascript"> </script >
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" > </script >
</body>
</html>