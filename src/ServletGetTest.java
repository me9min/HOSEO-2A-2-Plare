

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ServletGetTest
 */
@WebServlet("/ServletGetTest")
public class ServletGetTest extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ServletGetTest() {
        // TODO Auto-generated constructor stub
    	super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();

		String name = req.getParameter("myname");
		String id = req.getParameter("myid");
		String ps = req.getParameter("myps");

		out.println("<html>");
		out.println("<body><BR><BR><BR><H2>");
		if(name.length() < 1 )
			out.println("<SCRIPT> alert('name') </SCRIPT>");
		else{
			out.println("Name : "+ name + "<BR><BR>" );
			out.println("Id : "+ id + "<BR><BR>" );
			out.println("Password : "+ ps + "<BR><BR>" );
			out.println("<hr></H2></body></html>");
		}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
