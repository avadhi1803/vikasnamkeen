import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminLoginServlet")
public class adminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
        @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
     * @param request
     * @param response
     * @throws javax.servlet.ServletException
     * @throws java.io.IOException
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
        @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String email=request.getParameter("emailid");
		String pass=request.getParameter("password");
				
		RequestDispatcher rd;
		
		try
		{
			if(email.equals("vikasnamkeen@gmail.com") && pass.equals("vikasnamkeenshop"))
                        {
                                HttpSession session = request.getSession();
                                session.setAttribute("adminLogin", 1);
				request.setAttribute("status","Login Succesfully.... as "+email);
				rd=request.getRequestDispatcher("addproduct.jsp");
				rd.forward(request, response);
                        }
			
			else
			{
				request.setAttribute("status","Failed to Login..");
				rd=request.getRequestDispatcher("adminLogin.jsp");
				rd.forward(request, response);
			}

		}
		catch (IOException | ServletException e) 
		{
			e.printStackTrace();
		}
		
	}
}