package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDtls;

@WebServlet("/edit_books")
@MultipartConfig
public class EditBookServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
		
			String status = req.getParameter("bstatus");
			
			BookDtls b=new BookDtls();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDAOImpl dao=new BookDAOImpl(DBConnect.getConnection());
			boolean f=dao.updateEditBooks(b);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("sussMsg", "Book Update Successfully");
				resp.sendRedirect("admin1/all_books.jsp");
			}else {
				session.setAttribute("failed", "something wrong");
				resp.sendRedirect("admin1/all_books.jsp");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	

}
