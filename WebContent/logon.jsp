<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log In</title>
</head>

<body>

<%@include file="WEB-INF/jsp/navbar.jsp" %>

<main class="col-sm-9 offset-sm-3 col-md-10 offset-md-2 pt-3">

  <h1>Log In</h1>

	<form action="LoginServlet" method="post" class="form-horizontal">

    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Email:</label>
      <div class="col-sm-6">
        <input type="email" class="form-control" id="email" name="email" required>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="password">Password:</label>
      <div class="col-sm-6">
        <input type="password" class="form-control" id="password" name="password" required>
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-offset-2 col-sm-6">
        <button type="submit" class="btn btn-primary">Log In</button>
      </div>
    </div>

  </form>

</main>

</body>
</html>