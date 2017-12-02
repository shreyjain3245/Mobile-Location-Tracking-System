/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.time;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.sum;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class GetLocation extends HttpServlet {

    Connection con; PreparedStatement ps;
    
    @Override
    public void init(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/siddhant","root","");
            String qr="insert into location values(?,?,?,?)";
            ps=con.prepareStatement(qr);
        }catch(Exception e){
         }
    }
    @Override
    public void destroy(){
        try{
        con.close();
        }catch(Exception e){}
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        double s1=Double.parseDouble(request.getParameter("number1"));
        double s2=Double.parseDouble (request.getParameter("number2"));
        String s3 = request.getParameter("PID");
 PrintWriter out = response.getWriter();
Date date= new Date();
        try{
            ps.setDouble(1,s1);
            ps.setDouble(2,s2);
            ps.setString(3,s3);
            ps.setString(4,date.toString());
            
            ps.executeUpdate();    
        }catch(Exception e){
           out.println(e);
        }
         out.println("Location sent!");
       
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
