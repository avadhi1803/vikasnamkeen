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

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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
				
		PreparedStatement stmt;
		ResultSet rs;
		Connection con;
		RequestDispatcher rd;
		int count =0;
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen","root","root");
			
			String sql="select * from login";
			stmt=con.prepareStatement(sql);
			
			rs=stmt.executeQuery();
			
			while(rs.next())
			{
				if(email.equals(rs.getString("username")) && pass.equals(rs.getString("password")))
				{
					count=1;
				}
			}
			
			if(count==1)
			{
                int user_id=0;
                PreparedStatement st = con.prepareStatement("select * from login where username=?");
                st.setString(1,email);
                ResultSet rs1 = st.executeQuery();
                while(rs1.next())
                {
                    user_id = rs1.getInt(4);
                }
                HttpSession session = request.getSession();
                session.setAttribute("user_id", user_id);
				request.setAttribute("status","Login Succesfully.... as "+email);
				rd=request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
				count=0;
			}
			
			else
			{
				request.setAttribute("status","Failed to Login..");
				rd=request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}

		}
		catch (IOException | ClassNotFoundException | SQLException | ServletException e) 
		{
			e.printStackTrace();
		}
		
	}
}