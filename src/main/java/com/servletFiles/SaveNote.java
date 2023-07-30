package com.servletFiles;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

@WebServlet("/SaveNote")
public class SaveNote extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			String title=req.getParameter("title");
			String content = req.getParameter("content");
			
			
//			System.out.println(note.getId()+" : "+note.getTitle());
			
			Session s=FactoryProvider.buildFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			Note note=new Note(title,content, new Date());
			s.save(note);
			
			tx.commit();
			s.close();
			
			HttpSession session=req.getSession();
			session.setAttribute("successMsg", "Your Note record inserted successfully");
			resp.sendRedirect("showNotes.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			HttpSession session=req.getSession();
			session.setAttribute("errorMsg", "Please Redeploy your project on Server.");
			resp.sendRedirect("index.jsp");
		}
	}
	
	

}
