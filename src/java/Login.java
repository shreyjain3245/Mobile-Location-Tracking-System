

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

    Connection con; PreparedStatement ps;  ResultSet rs;
    
    @Override
    public void init(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/siddhant","root","");
            String qr="select username,usertype from userinfo where username=? and password=?";
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
        String s1=request.getParameter("uid");
        String s2=request.getParameter("pw");
        //String s3=request.getParameter("usertype");
        try{              
            ps.setString(1,s1);               
            ps.setString(2,s2);               
            rs=ps.executeQuery();
            boolean found=rs.next();
            if(found==true){
                String name=rs.getString(1);
                String s3=rs.getString(2);
                HttpSession session=request.getSession();
                session.setAttribute("uid", name);
                //storing id/pwd to cookiess
                String ch=request.getParameter("remempw");
                Cookie c1;
                Cookie c2;
                Cookie c3;
                if(ch!=null){
                    //step-1 (create cookie object(s)
                    c1=new Cookie("uid",s1);
                    c2=new Cookie("pw",s2);
                    c3=new Cookie("usertype",s3);
                    //step-2 (set the maximum age of the cookie)
                    c1.setMaxAge(60*60*24*7);
                    c2.setMaxAge(60*60*24*7);
                    c3.setMaxAge(60*60*24*7);
                    //step-3 (add the cookie object(s) to response
                    response.addCookie(c1);
                    response.addCookie(c2);
                    response.addCookie(c3);
                    
                }
                else if (ch==null){
                                        //step-1 (create cookie object(s)
                    c1=new Cookie("uid",s1);
                    c2=new Cookie("pw",s2);
                    c3=new Cookie("usertype",s3);
                    
                    //step-2 (set the maximum age of the cookie)
                    c1.setMaxAge(0);
                    c2.setMaxAge(0);
                    c3.setMaxAge(0);
                    //step-3 (add the cookie object(s) to response
                    response.addCookie(c1);
                    response.addCookie(c2);
                    response.addCookie(c3);
                }

               if(s3.equals("Customer"))
                    response.sendRedirect("PhoneList");
               else if(s3.equals("Admin"))
                   response.sendRedirect("adminpage.jsp");
            }
            else{
                out.println("Account doesn't exist<br>");
                out.println("<a href=index.jsp>TryAgain</a>");
            }
            
            }
            catch(Exception e){
                out.println(e);
            }   
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}