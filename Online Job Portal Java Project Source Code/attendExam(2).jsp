<%@ page import="java.sql.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
   <body bgcolor="#EAEBEC" background="Images/background1.jpg" style="background-attachment: fixed">
    <form action="startExam.jsp" method="post" name="irtcon">
        
            <div style="position: absolute; width: 58px; height: 20px; z-index: 3; left: 668px; top: 75px" id="layer7">
                <b><a style="text-decoration: none" href="seekExamMgmt.jsp">
            <font face="Candara" size="2" color="#000000">Back</font></a></b></div>
        
        <%! 
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        Statement st;
        String cname,paperid,tech,time,prid;
        Date examdate;
        int numofqs;
        String uname="";
        %>
        <%
        uname=(String)session.getAttribute("uname");
        paperid=request.getParameter("paperid");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","itcon","itcon");
        st=con.createStatement();        
        rs=st.executeQuery("select * from paperdetails where status='Prepared' and examdate=to_date(sysdate)");
        if(rs.next())
        {
        prid=rs.getString(1);
        cname=rs.getString(2);
        paperid=rs.getString(3);
        numofqs=rs.getInt(4);
        tech=rs.getString(5); 
        %>
        <div style="position: absolute; width: 321px; height: 207px; z-index: 1; left: 84px; top: 50px" id="layer1">
            <div align="center">
            <table id="table1" height="260">
            <tr><td><font face="Tahoma" color="#CC0000">Welcome : <%=uname%></font></b><font face="Tahoma"> </td></tr>
            <tr><td><b><font face="Tahoma" size="2">The Rules for the Examination :</font></b></td></tr>
            <tr><td><b><font face="Tahoma" size="2">1) Every Question has 1Min time.</font></b></td></tr>
            <tr><td><b><font face="Tahoma" size="2">2) You have <%=numofqs%> Question to Answer.</font></b></td></tr>
            <tr><td><b><font face="Tahoma" size="2">3) Each Question carry 10 Marks.</font></b></td></tr>
            <tr><td><b><font face="Tahoma" size="2">4) No Negative marks for the wrong Answers.</font></b></td></tr></font>
            <tr><td>
				<p align="center"><font size="5" face="Verdana"><input type="submit" value="Start Exam" name="B1"></font></td></tr>
            </table>
        	</div>
        </div>
        
        
        <%
        }
        %>  <input type="hidden" name="qno" value="1">
    </form>
   
    </body>
</html>
