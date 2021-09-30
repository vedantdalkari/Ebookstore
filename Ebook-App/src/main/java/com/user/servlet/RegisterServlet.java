package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.valves.rewrite.RewriteCond;

import com.DB.DBConnect;
import com.entity.User;
import com.DAO.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
			//System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
		
		User us=new User();
		us.setName(name);
		us.setEmail(email);
		us.setPhno(phno);
		us.setPassword(password);
		
		HttpSession session=req.getSession();
		if(check!=null) {
			UserDaoImpl dao=new UserDaoImpl(DBConnect.getConnection());
			boolean f2=dao.checkUser(email);
			if(f2) {
				boolean f=dao.userRegister(us);
				
				
				if(f) {
					//System.out.println("User registration succesfully");
					session.setAttribute("succMsg", "Registration succesfully");
					resp.sendRedirect("register.jsp");
				}
				else {
					//System.out.println("Somthing went wrong");
					session.setAttribute("failedMsg", "Somthing went wrong");
					resp.sendRedirect("register.jsp");
				}
			}else {
				session.setAttribute("failedMsg", "User already Exist try another email");
				resp.sendRedirect("register.jsp");
				
			}
			
			
		}else {
			//System.out.println("Please check Agree terms & condition");
			session.setAttribute("failedMsg", "Please check Agree terms & condition");
			resp.sendRedirect("register.jsp");
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

}
