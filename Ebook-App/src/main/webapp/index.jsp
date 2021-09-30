

<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook:Index Page</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url(images/1.jpg);
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #e8d5d3;
}
</style>
</head>
<body style="background-color: #f2eeed;">

<% 
 User u=(User)session.getAttribute("userobj");
%>


	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-danger">Ebook management System</h2>
	</div>

	<!-- Start Recent book -->
	<div class="container-fluid">
		<h3 class="text-center">Recent Book</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConnection());
			List<BookDtls> list2 = dao2.getRecentBooks();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p>
							Author:-<%=b.getAuthor()%></p>
						<p>
							<%
							if (b.getBookCategory().equals("old")) {
							%>
							Categories:-<%=b.getBookCategory()%></p>
						<div class="row">
							<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn sm ml-5">view Details</a> <a
								href="" class="btn btn-danger btn sm ml-1"><%=b.getPrice()%>
								<i class="fas fa-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						Categories:-<%=b.getBookCategory()%></p>
						<div class="row">
						
						<% if (u==null)
							{%>
							<a href="login.jsp" class="btn btn-danger btn sm ml-2"> Add Cart </a> 
							<% 
							}else
							{
								%>
								<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn sm ml-2"> Add Cart </a> 
								<% 
							}
							%>
						
						
						 <a href="view_books.jsp?bid=<%=b.getBookId() %>"
								class="btn btn-success btn sm ml-1">view Details</a><a href=""
								class="btn btn-danger btn sm ml-0"><i
								class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white"> View All</a>

		</div>
	</div>
	<!-- End Recent Book -->

	<hr>
	<!-- Start New book -->
	<div class="container-fluid">
		<h3 class="text-center">New Book</h3>
		<div class="row">


			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p>
							Author:-<%=b.getAuthor()%></p>
						<p>
							Categories:-<%=b.getBookCategory()%></p>
						<div class="row">
						<% if (u==null)
							{%>
							<a href="login.jsp" class="btn btn-danger btn sm ml-2"> Add Cart </a> 
							<% 
							}else
							{
								%>
								<a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn sm ml-2"> Add Cart </a> 
								<% 
							}
							%>
							
								<a href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn sm ml-1">view Details</a> <a
								href="" class="btn btn-danger btn sm ml-1"><i
								class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>

			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-2">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white"> View All</a>

		</div>
	</div>
	<!-- End New Book -->

	<hr>

	<!-- Start Old book -->
	<div class="container-fluid">
		<h3 class="text-center">Old Book</h3>
		<div class="row">


			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConnection());
			List<BookDtls> list3 = dao2.getoldBooks();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150px; height: 200px" class="img-thumblin">
						<p><%=b.getBookName()%></p>
						<p>
							Author:-<%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row">
							 <a
								href="view_books.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn sm ml-5">view Details</a> <a
								href="" class="btn btn-danger btn sm ml-1"><i
								class="fas fa-rupee-sign"></i><%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>




		</div>
		<div class="text-center mt-2">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white"> View All</a>

		</div>
	</div>
	<!-- End Old Book -->
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>