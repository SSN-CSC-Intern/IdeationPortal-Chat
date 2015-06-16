

<%@page import="java.sql.ResultSet"%>
<%@page import="Connection.DbConnection"%>
<!DOCTYPE HTML>
<head>
<title>Ideation Portal</title>
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
</head>
<body>	
    <%
         try {
              String mail=(String)session.getAttribute("mail");
           String name=(String)session.getAttribute("name");
          Integer id=(Integer)session.getAttribute("id");
  
               DbConnection db=new DbConnection();
               ResultSet rs=db.Select("select * from register where Email_Id='"+mail+"' and S_No='"+id+"'");
               String ss="select * from register where Email_Id='"+mail+"' and S_No='"+id+"'";
               System.out.println(ss);
               if(rs.next())
               {
               
            
        %>
	    <div class="wrap">	 
	      <div class="header">
	      	  <div class="header_top">
					  <div class="menu">
						  <a class="toggleMenu" href="#"><img src="images/nav.png" alt="" /></a>
							<ul class="nav">
                                                            <li><a href="User_Home.jsp"><i><img src="images/home_1-512.png" alt="" style="width: 32px;"/></i>Home</a></li>
								<li><a href="Setting.jsp"><i><img src="images/settings.png" alt="" /></i>Settings</a></li>
								<li><a href="Message.jsp"><i><img src="images/mail.png" alt="" /></i>Messages </a></li>
								<li><a href="Interest.jsp"><i><img src="images/favourite.png" alt="" /></i>Favorites</a></li>
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
                    <div class="menu_box">
	    		 	 <h3>Menu Box</h3>
	    		 	   <div class="menu_box_list">
				      		<ul>
                                                    <li><a href="Setting.jsp"><img src="images/lock.png" alt=""  /><span>Password Change</span><div class="clear"></div></a></li>
                                                    <li ><a href="Change_User.jsp" ><img src="images/user.png"><span>Change Username</span><div class="clear"></div></a></li>
						  		<li><a href="Change_ph.jsp" ><img src="images/nnm.png" alt="" style="width: 32px;" /><span>Change Phone Number</span><div class="clear"></div></a></li>
						  		<li><a href="Change_pic.jsp"><img src="images/sss.png" alt="" style="width: 32px;" /><span>Change Profile Picture</span></a></li>
						  							  	
				    		</ul>
				      </div>
	    		 </div>
                   <br>
	    	    <div class="column_middle_grid1">
		         <div class="profile_picture">
		        	<a href=""><img src="servlet_1.jsp?id=<%=id%>" alt="" />	</a>		         
		            <div class="profile_picture_name">
		            	<h2><%=name%></h2>
		            	<p> </p>
		            </div>
                                <span><a href="#"> <img src="" alt="" /> </a></span>
		          </div>
		           <div class="articles_list">
		           	  <ul>
                                      <li><a href="#" class="red"> </a></li>
                                      <li><a href="#" class="purple"></a> </li>
                                      <li><a href="#" class="yellow"></a> </li>
		           	  	<div class="clear"></div>	
		           	  </ul>
		           </div>
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
		     	           
		       
    	
    	     <div class="column_right_grid date_events">
				     	  <h3><a href="#" id="slide_prev"><img src="images/arrow-left.png" alt="" /></a>Change Password  <a href="#" id="slide_next"><img src="images/arrow-right.png" alt="" /></a></h3>
				     	 		<ul id="slide" class="event_dates">					            
						            <li>
                                                                
				     
                                       <form name="form"  action="Change_pass" method="get" onsubmit="return form_validation();">
                                           <font size="3">Enter Old Password<input type="password" name="opass" value="" placeholder="Enter Here" required><br>
                                           <font size="3">Enter New Password<input type="password" name="npass" value="" placeholder="Enter Here" required><br>
                                           <input type="text" name="option" value="1" hidden>
					 	 
                                           <input type="submit" value="Submit">
                                         
					 	</form>
			
                                                            </li>
						          
						        </ul>
						       										 				
				           <script type="text/javascript">
				            $(function() {						
				                $('#slide').ulslide({
				                   
									effect: {
										type: 'carousel', // slide or fade
				                        axis: 'x',        // x, y
										showCount:1
									},
				                    nextButton: '#slide_next',
				                    prevButton: '#slide_prev',
				                    duration: 800,
				                    /*autoslide: 2000,*/
									easing: 'easeOutBounce'
				                });
				            });
				        </script>
				    </div>
				
				
			  	
				  
          
                    </div>
                                <div class="column_left">
                                       <div class="column_middle_grid1">
		         <div class="profile_picture">
                             <a href=""><img src="images/logo1.png" alt="" />	</a>		         
		            <div class="profile_picture_name">
		            	<h2>Ideation Portal-Chat</h2>
		            	<p>Online Chat</p>   </div>
		             <span><a href="#"> <img src="images/follow_user.png" alt="" /> </a></span>
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
                               
    	 
				
		            
                                </div>
                                .
                                <div>
    	<div class="clear"></div>
 	 </div>
                                   
   </div>
            <%
               }
               else
               {
                   session.setAttribute("msg","Session out Login Please");
                   response.sendRedirect("Home.jsp");
               }
               
           }
           catch(Exception e)
                   {
                       System.out.println(e);
                   }
                   %>
          
</body>
</html>

