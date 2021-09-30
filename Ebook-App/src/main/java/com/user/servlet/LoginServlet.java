package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDaoImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			UserDaoImpl dao=new UserDaoImpl(DBConnect.getConnection());
			
			HttpSession session=request.getSession();
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			
			if("admin@gmail.com".equals(email)&&"admin".equals(password)) {
				
				User us=new User();
				us.setName("Admin");
				session.setAttribute("userobj",us);
				response.sendRedirect("admin1/home.jsp");
			}
			else {
				User us=dao.login(email, password);
				if(us!=null) {
					session.setAttribute("userobj", us);
					response.sendRedirect("index.jsp");
				}else {
					session.setAttribute("failedMsg","Email Or Password Invalid");
					response.sendRedirect("login.jsp");
				}
				
				//response.sendRedirect("home.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
