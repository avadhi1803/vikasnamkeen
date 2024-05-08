import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONException;
import org.json.JSONObject;

@WebServlet("/forgotPwServlet")
public class forgotPwServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public forgotPwServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String contact = request.getParameter("contact");
        String color = request.getParameter("color");
        String pass = request.getParameter("pass");
        String cpass = request.getParameter("cpass");

        RequestDispatcher rd;

        try {
            // Check if passwords match
            if (!pass.equals(cpass)) {
                request.setAttribute("status", "Passwords do not match.");
                rd = request.getRequestDispatcher("signup.jsp");
                rd.forward(request, response);
                return; // Exit the method
            }
            

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen", "root", "root");
            
            PreparedStatement st = con.prepareStatement("select * from login where username=?");
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if(rs.next())
            {     
                if(email.equals(rs.getString("username")) && contact.equals(rs.getString("contact")) && color.equals(rs.getString("color")))
                {
            String sql = "update login set password=? where username=?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(2, email);
            stmt.setString(1, pass);

            int row = stmt.executeUpdate();

            if (row > 0) {
                request.setAttribute("status", "Successfully Updated Password... Now you can Login.");
                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("status", "Failed to updated password....! Please Try again.");
                rd = request.getRequestDispatcher("forgotPw.jsp");
                rd.forward(request, response);
            }
                }
                else
                {
                    request.setAttribute("status", "Please check entered email / contact / color!");
                    rd = request.getRequestDispatcher("forgotPw.jsp");
                    rd.forward(request, response);
                }
            }
            else
            { 
                request.setAttribute("status", "Account does not exist!");
                rd = request.getRequestDispatcher("signUp.jsp");
                rd.forward(request, response);
                return; // Exit the method
            }
            con.close(); // Close the database connection when done
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // You should log the exception or provide a meaningful error message for debugging.
            request.setAttribute("status", "An error occurred while updating password. Please try again later.");
            rd = request.getRequestDispatcher("forgotPw.jsp");
            rd.forward(request, response);
        } 
    }
}
