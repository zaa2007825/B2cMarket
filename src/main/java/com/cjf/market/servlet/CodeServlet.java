package com.cjf.market.servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CodeServlet
 */
public class CodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    int imgwidth;
   	int imgheight;
   	int imgcount;
   	Random ra = new Random();
   	char[] ch = "123456789abcdefghijklmnopqrstuvwxyz".toCharArray();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BufferedImage bi = new BufferedImage(imgwidth, imgheight, imgcount);
		Graphics2D g = (Graphics2D) bi.getGraphics();
		g.fillRect(0, 0, imgwidth, imgheight);
		g.setColor(new Color(200,200,200));
		g.setFont(new Font("Ink Free",Font.BOLD, 15));
		
		StringBuffer sb = new StringBuffer();
		for(int i=0; i < imgcount; i++) {
			int a = ra.nextInt(ch.length);
			g.setColor(new Color(ra.nextInt(255),ra.nextInt(255),ra.nextInt(255)));
			g.drawString(String.valueOf(ch[a]), 15*i + 3,18 + i -ra.nextInt(5));
			sb.append(ch[a]);
		}
		request.getSession().setAttribute("code", sb.toString());
		ImageIO.write(bi, "jpg", response.getOutputStream());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	@Override
	public void init(ServletConfig con) throws ServletException {
		imgwidth = Integer.parseInt(con.getInitParameter("width"));
		imgheight = Integer.parseInt(con.getInitParameter("height"));
		imgcount = Integer.parseInt(con.getInitParameter("count"));
	}
	
}
