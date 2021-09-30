<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Recent Books</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #e8d5d3;
}
</style>
</head>
<body>
<% 
 User u=(User)session.getAttribute("userobj");
%>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-3">
			
			<%
			String ch=request.getParameter("ch");
			
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConnection());
			List<BookDtls> list2 = dao2.getBookBySearch(ch);
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 100px; height: 150px" class="img-thumblin">
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
	</div>

</body>
</html>