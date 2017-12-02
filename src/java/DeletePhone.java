import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class DeletePhone extends HttpServlet {
    
    Connection con; PreparedStatement ps,ps2;  ResultSet rs;
    
    @Override
    public void init(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/siddhant","root","");
            String qr="delete from phoneinfo where username=? and pid=?";
            String qr2="delete from location where pid=?";
            ps=con.prepareStatement(qr);  
            ps2=con.prepareStatement(qr2);
        }
        catch(Exception e){}
    }
    @Override
    public void destroy(){
        try{
        con.close();
        }
        catch(Exception e){}
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        String s1=(String) session.getAttribute("uid");
        String s2=(String) request.getParameter("PhoneList");
        try {
            ps.setString(1,s1);
            ps.setString(2,s2);
            ps.executeUpdate();
            ps2.setString(1, s2);
            ps2.executeUpdate();
        }
        catch(Exception e){
            out.println(e);
        }
        //out.println(s1+s2);
        response.sendRedirect("PhoneList");
           
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
