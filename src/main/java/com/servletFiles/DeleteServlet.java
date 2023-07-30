package com.servletFiles;

import java.io.IOException;

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


@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int noteId=Integer.parseInt(req.getParameter("note_id").trim());
			
			Session s=FactoryProvider.buildFactory().openSession();
			Transaction tx=s.beginTransaction();
			Note note=(Note)s.get(Note.class, noteId);
			s.delete(note);
			tx.commit();
			s.close();
			
			HttpSession session=req.getSession();
			session.setAttribute("successMsg", "From Here !!!  One Note Deleted Successfully.");
			resp.sendRedirect("showNotes.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	

}
