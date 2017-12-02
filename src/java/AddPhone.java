/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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

/**
 *
 * @author HP
 */
public class AddPhone extends HttpServlet {

    Connection con; PreparedStatement ps,ps1;  ResultSet rs,rs1;
    @Override
    public void init(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/siddhant","root","");
            String qr="select pid from phoneinfo where pid=?";
            ps=con.prepareStatement(qr);            
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
        String s1=request.getParameter("pname");
        String s2=request.getParameter("namePage");
        String s3=request.getParameter("pid");
        
        try{              
            ps.setString(1,s3);
             rs=ps.executeQuery();
            boolean found=rs.next();
            if(found==true)
            {
                out.println("Enter other pid");
                out.println("<h1>Retry with other pid<a href=addphone.jsp>click here</a></h1>");
            }
        }
        catch(Exception e){
            
            out.println(e+"hkadfjska");
        }
        
        try{
            String qr="insert into phoneinfo values (?,?,?)";
            ps1=con.prepareStatement(qr);
            ps1.setString(1,s1);
            ps1.setString(2,s2);
            ps1.setString(3,s3);
            ps1.executeUpdate();
                response.sendRedirect("PhoneList");
        }
        catch(Exception e){
            out.println(e+"sidd");
        }
      
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
