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

@WebServlet("/signupServlet")
public class signupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public signupServlet() {
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

            String sql = "INSERT INTO login(username,contact,password,color) VALUES (?,?,?,?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, contact);
            stmt.setString(3, pass);
            stmt.setString(4, color);

            int row = stmt.executeUpdate();

            if (row > 0) {
                request.setAttribute("status", "Successfully Signed up... Now you can Login.");
                rd = request.getRequestDispatcher("index.jsp");
                rd.forward(request, response);
            } else {
                request.setAttribute("status", "Failed to sign up....! Please Try again.");
                rd = request.getRequestDispatcher("signup.jsp");
                rd.forward(request, response);
            }

            con.close(); // Close the database connection when done
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // You should log the exception or provide a meaningful error message for debugging.
            request.setAttribute("status", "An error occurred while signing up. Please try again later.");
            rd = request.getRequestDispatcher("signup.jsp");
            rd.forward(request, response);
        } 
    }
}
