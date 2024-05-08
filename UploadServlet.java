import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UploadServlet")
@MultipartConfig
public class UploadServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ptitle = request.getParameter("ProductTitle");
        String pbrand = request.getParameter("ProductCategory");
        int pweight = Integer.parseInt(request.getParameter("ProductWeight"));
        int pprice = Integer.parseInt(request.getParameter("ProductPrice"));

        InputStream inputStream = null; // Input stream for the image file.

        // Retrieves the file part from the form.
        Part filePart = request.getPart("ProductImage");

        if (filePart != null) {
            // Obtains input stream of the upload file.
            inputStream = filePart.getInputStream();
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/namkeen", "root", "root");
            PreparedStatement st = con.prepareStatement("insert into products(title, weight, price, brand, img) values(?,?,?,?,?)");
            st.setString(1, ptitle);
            st.setInt(2, pweight);
            st.setInt(3, pprice);
            st.setString(4, pbrand);
            st.setBlob(5, inputStream);
            st.executeUpdate();
            con.close();
            response.sendRedirect("addproduct.jsp"); // Redirect to the form page or any other page.
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
