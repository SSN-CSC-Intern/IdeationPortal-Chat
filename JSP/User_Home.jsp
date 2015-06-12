<%@page import="java.sql.ResultSet"%>
<%@page import="Connection.DbConnection"%>
<!DOCTYPE HTML>
<head>
    <title>Ideation Portal - Chat</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/nav.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/blink.css" rel="stylesheet" type="text/css" media="all"/>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
    <script type="text/javascript" src="js/Chart.js"></script>
    <script type="text/javascript" src="js/jquery.easing.js"></script>
    <script type="text/javascript" src="js/jquery.ulslide.js"></script>
    <!----Calender -------->
    <link rel="stylesheet" href="css/clndr.css" type="text/css" />
    <script src="js/underscore-min.js"></script>
    <script src= "js/moment-2.2.1.js"></script>
    <script src="js/clndr.js"></script>
    <script src="js/site.js"></script>
    <!----End Calender -------->
    <script>
function myFunction(ele)
{
var x;

var person=prompt("Please Enter Your Comment","");

if (person==="")
  {
 alert('Comment Should Not be Empty');
  }
  else
      {
          window.location.href="Comment.jsp?k="+person+"&id1="+ele+"";
         
      }
}
</script>
</head>
<body>	
    <%
        try {
            String mail = (String) session.getAttribute("mail");
            String name = (String) session.getAttribute("name");
            Integer id = (Integer) session.getAttribute("id");

            DbConnection db = new DbConnection();
            ResultSet rs = db.Select("select * from register where Email_Id='" + mail + "' and S_No='" + id + "'");
            String ss = "select * from register where Email_Id='" + mail + "' and S_No='" + id + "'";
            System.out.println(ss);
            if (rs.next()) {


    %>
    <div class="wrap">	 
        <div class="header">
            <div class="header_top">
                <div class="menu">
                    <a class="toggleMenu" href="#"><img src="images/nav.png" alt="" /></a>
                    <ul class="nav">
                        <li><a href="User_Home.jsp"><i><img src="images/home_1-512.png" alt="" style="width: 32px;"/></i>Home</a></li>
                        <li><a href="Setting.jsp"><i><img src="images/settings.png" alt="" /></i>Settings</a></li>
                        <li><a href="Message.jsp"><i><img src="images/mail.png" alt="" /></i>Messages 
                                <%
ResultSet rh=db.Select("select count(*) as count1 from offline_msg where To_Uid='"+mail+"' and Status1='0'");
int m=0,b=0;
while(rh.next())
{
    m=rh.getInt("count1");
    b=b+m;
}
System.out.println(m);
                                if(b!=0)
                                {%><span class="messages"><%=b%></span>
                                <%}
%></a></li>
                        <li><a href="Interest.jsp"><i><img src="images/favourite.png" alt="" /></i>Favorites</a></li>
                        <li><a href="Group.jsp"><i><img src="images/favourite.png" alt="" /></i>Groups</a></li>
                        <li><a href="groupchat.jsp"><i><img src="images/favourite.png" alt="" /></i>Chat</a></li>
                        <div class="clear"></div>
                    </ul>
                    <script type="text/javascript" src="js/responsive-nav.js"></script>
                </div>	
                <div class="profile_details">
                    <div id="loginContainer">
                        <a ><span><font style="color: white"><%=name%></span></a>   
                        <div id="loginBox">                
                            <form id="loginForm">
                                <fieldset id="body">
                                    <div class="user-info">
                                        <h4>Hello,<a href="#"><%=name%></a></h4>
                                        <ul>
                                            <li class="profile active"><a href="User_Home.jsp">Home</a></li>
                                            <li class="logout"><a href="logout.jsp"> Logout</a></li>
                                            <div class="clear"></div>		
                                        </ul>
                                    </div>			                            
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    <div class="profile_picture">
                        <a id="loginButton" class=""><img src="servlet_1.jsp?id=<%=id%>" alt="" style="width: 138px; height: 54px; margin-left: -88px; margin-top: -102px;" />	</a>
                    </div>
                    <div class="clear"></div>		  	
                </div>	
                <div class="clear"></div>				 
            </div>
        </div>	  					     
    </div>
    <div class="main">  
        <div class="wrap">  		 
            <div class="column_left">	          
                <div class="column_middle_grid1">
                    <div class="profile_picture">
                        <a href=""><img src="servlet_1.jsp?id=<%=id%>" alt="" />	</a>		         
                        <div class="profile_picture_name">
                            <h2><%=name%></h2>
                            <p> </p>
                        </div>
                      
                    </div>
                    <div class="articles_list">
                        <ul>
                            <li><a class="red"> </a></li>
                            <li><a href="#" class="purple"> </a></li>
                            <li><a href="#" class="yellow"> </a></li>
                            <div class="clear"></div>	
                        </ul>
                    </div>
                </div>
                <div class="column_right_grid calender">
                    <div class="cal1"> </div>
                </div>





            </div> 

            <div class="column_middle">
 <%
                  String msg=(String)session.getAttribute("msg");
                  if(msg!=null)
                  {%>
                  <div class="ab"> <font face="Comic sans MS" size="5" style="color: red" ><%=msg%></font></div>
                      
             
                                          <%  
                       session.removeAttribute("msg");
                  }
                
                 
                  %>



                <%

 String ssq2 = "SELECT Count(*) as ss FROM friend_list where To_Uid='" + mail + "' And Status1='pending'";

                                            ResultSet rd2 = db.Select(ssq2);
                                            if (rd2.next()) {
                                                int l=rd2.getInt("ss");
                                                if(l!=0)
                                                {
                                                %>
                                                 <center>
                                                     <a href="Friend_List.jsp"><p><font style=" color: red">You Have <%=l%> Friend Request</font></p></a>  </center>
                                                <%
                                                }
}%>

                <div class="tweets">
                    <h3><i><img src="images/comment-.png" alt="" style="width: 25px; height: 25px; margin-left: -19px;" /> </i> Latest Post</h3>		              
                    <div class="tweets_list">
                        <ul>
                            <li>
                                <form action="post_add.jsp" method="post">
                                    <center>
                                        <p>Post Your Status</p>  </center>
                                    Enter Status  <textarea name="post1" required></textarea>
                                    <center>
                                        <input type="submit" value="Update"> </center>
                                </form>
                                <a href="User_Home.jsp?option=all"><input type="button" value="ALL POST"></a>
                                  <a href="User_Home.jsp?option=own"><input type="button" value="OWN POST"></a>
                            </li>

                            <%
                                            String gdf=request.getParameter("option");
                                            if(gdf!=null)
                                                
                                            {
                                                    if(request.getParameter("option").equals("all")){
                                ResultSet rd = db.Select("SELECT * FROM user_post a ,friend_list b where (b.Frm_Uid='"+mail+"' and b.To_Uid=a.User_Id and b.Status1='Accepted') or (b.To_Uid='"+mail+"' and b.Frm_Uid=a.User_Id and b.Status1='Accepted') ");
                                while (rd.next()) {
                            %><li> <%=rd.getString("Post_Msg")%><a href="#">@<%=rd.getString("U_Name")%></a>
                                <span><%=rd.getDate("P_Date")%></span>
                                <input type="text" id="ids" value="<%=rd.getInt("S_No")%>" hidden>
                                <input type="button" value="Comment" onclick="myFunction(<%=rd.getInt("S_No")%>);">
                                <a href="User_Home.jsp?idc=<%=rd.getInt("S_No")%>">View Comments </a>
                        </li>
                                <%}
            }%>
                              <%
                            if(request.getParameter("option").equals("own")){
                                ResultSet rd1 = db.Select("SELECT * FROM user_post where User_Id='"+mail+"'");
                                System.out.println("SELECT * FROM user_post where User_Id='"+id+"'");
                                while (rd1.next()) {
                            %><li> <%=rd1.getString("Post_Msg")%><a href="#">@<%=rd1.getString("U_Name")%></a>
                                <span><%=rd1.getDate("P_Date")%></span>
                              <a href="User_Home.jsp?idc=<%=rd1.getInt("S_No")%>">View Comments </a></li>
                                <%}
                            }
                                            }
                            %>
                                                
          <li>
                                <%
                                            String im=request.getParameter("idc");
                                            if(im!=null)
                                            {
                                                %>
                                                
                                            
                                                <table>
                                                    <tr><th>User Name</th><th>Comments</th></tr>
                                                <%
                                                int idm=Integer.parseInt(im);
                                                ResultSet rm1=db.Select("select a.User_Id,a.User_Cmt,b.U_Name,b.Post_Msg,b.P_Date from comment1 a,user_post b where a.Post_Id='"+im+"' and  b.S_No='"+im+"'");
                                                if(rm1.next())
                                                {%>
                                                    <li> <%=rm1.getString("Post_Msg")%><a href="#">@<%=rm1.getString("U_Name")%></a>
                                <span><%=rm1.getDate("P_Date")%></span>
                                                    <%
                                                    
                                                }
                                                ResultSet rm=db.Select("select a.User_Id,a.User_Cmt,b.User_Id,b.Post_Msg from comment1 a,user_post b where a.Post_Id='"+im+"' and  b.S_No='"+im+"'");
                                                while(rm.next())
                                                {%>
                                                    
                                                    <tr><td><%=rm.getString("User_Id")%></td><td><%=rm.getString("User_cmt")%></td></tr>
                                                    <%
                                                    
                                                }
                                                %>
                                                </table>
                                                <%
                                            }
                                            %>
                            </li>

                        </ul>
                    </div>

                </div>
                             


            </div>
            <div class="column_left">
                <div class="column_middle_grid1">
                    <div class="profile_picture">
                        <a href=""><img src="images/logo1.png" alt="" />	</a>		         
                        <div class="profile_picture_name">
                            <h2>Ideation Portal - Chat</h2>
                            <p>Online Chat</p>   </div>
                       
                    </div>
                    <div class="articles_list">
                        <ul>
                            <li><a href="#" class="red"> </a></li>
                            <li><a href="#" class="purple"></a></li>
                            <li><a href="#" class="yellow"> </a></li>
                            <div class="clear"></div>	
                        </ul>
                    </div>
                </div>  
                <br>
               <div class="column_middle_grid1">
                    <div class="profile_picture">
                        <a href="onlineChat.jsp"><img src="images/chat1.jpg" alt="" />	</a>		         
                        <div class="profile_picture_name">
                            <h2>Online Chat</h2>
                            <p> </p>
                        </div>
                        <span><a href="#"> <img src="" alt="" /> </a></span>
                    </div>
                  
                    </div>
                
                </div>

  
  
        <div>
            <div class="clear"></div>
        </div>
    </div>
    <%
            } else {
                session.setAttribute("msg", "Session out Login Please");
                response.sendRedirect("Home.jsp");
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    %>

</body>
</html>

