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


@WebServlet("/EditNote")
public class EditNote extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			
			int noteId=Integer.parseInt(req.getParameter("note_id").trim());
			String title=req.getParameter("title");
			String content=req.getParameter("content");
			
			Session s=FactoryProvider.buildFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			Note note=(Note)s.get(Note.class, noteId);
			
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			
			tx.commit();
			s.close();
			HttpSession session=req.getSession();
			session.setAttribute("successMsg", "Your Note Update successfully.");
			resp.sendRedirect("showNotes.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
