package com.tecnosoftware.ap3c.frontend;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tecnosoftware.ap3c.service.ServiceLayer;

/* test          */
@SuppressWarnings("serial")
public class FEServlet extends HttpServlet {

	public ServiceLayer serviceLayer;

	public FEServlet() throws ServletException {
		try {
			serviceLayer = new ServiceLayer();
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String answer = "<html><head></head> <body>" + "<hr> " + "<h1 align='center'>Tecnosoftware - Hola Teco</h1>" + "<hr>" + "<div align='center'>"
			    + "<img height='50' src='logoTecnosoftware.gif'/>" + "<img height='50' src='logoSerena.png'/>" + "</div>" + "<hr>" +
			    // "<h3 align='center'> Texto en el Servlet: " +
					// serviceLayer.getString() + "</h3>" +
			    "<hr>" + "<h4  align='center''>2015 @ Serena - " + new java.util.Date() + "</h4>" + "</body></html>";

			PrintWriter out = response.getWriter();
			out.println(answer);
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
