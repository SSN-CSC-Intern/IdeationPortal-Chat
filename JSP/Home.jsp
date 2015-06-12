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
    <link href="css/mint-choc/jquery-ui-1.10.4.custom.css" rel="stylesheet">
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/jquery-ui-1.10.4.custom.js"></script>
    <script>
        $(function() {
            $("#datepicker").datepicker({
                maxDate: 0,
                changeMonth: true,
                changeYear: true,
                yearRange: '-100y:c+nn'

            });
        });
    </script>

    <script>
        function form_validation()
        {

            var H_Name = document.getElementById("F_Name").value;

            if (!H_Name.match(/^[a-zA-Z ]+$/))
            {
                alert("Invalid First Name ..Don't Use Numbers")
                return false;
            }
            var H_Name = document.getElementById("L_Name").value;

            if (!H_Name.match(/^[a-zA-Z ]+$/))
            {
                alert("Invalid Last Name.. Don't Use Numbers")
                return false;
            }

            var Ph = document.getElementById("U_Ph").value;
            if (!Ph.match(/^\d{10}$/))
            {
                alert("Invalid Phone Number")
                return false;
            }

            var Mail = document.getElementById("email").value;
            var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z]{2,4})+$/;

            if (!filter.test(Mail)) {
                alert("Invalid Mail ID");
                return false;
            }
            var file1 = document.getElementById("file1").value;
            var re = /(\.jpg|\.jpeg|\.bmp|\.gif|\.png)$/i;
            if (!re.exec(file1))
            {
                alert("File extension not supported!");
                return false;
            }
            return true;

        }
    </script>
    <script>
        function Validate1()
        {

            if ((form.gender[0].checked == false) && (form.gender[1].checked == false))
            {
                alert("Please choose your Gender");
                return false;
            }
            return true;
        }
    </script>



<script type="text/javascript"> 
//below javascript is used for Disabling right-click on HTML page
document.oncontextmenu=new Function("return false");//Disabling right-click
	

//below javascript is used for Disabling text selection in web page
//document.onselectstart=new Function ("return false"); //Disabling text selection in web page
if (window.sidebar){
//document.onmousedown=new Function("return false"); 
//document.onclick=new Function("return true") ; 


//Disable Cut into HTML form using Javascript 
document.oncut=new Function("return false"); 


//Disable Copy into HTML form using Javascript 
document.oncopy=new Function("return false"); 


//Disable Paste into HTML form using Javascript  
document.onpaste=new Function("return false"); 
}
</script>
</head>
<body>
 
</body>
</html>

<html>
<head>
</head>
<body oncopy="return false;" onpaste="return false;" oncut="return false;">


    <div class="wrap">	 
        <div class="header">
            <div class="header_top">
                <div class="menu">
                    <a class="toggleMenu" href="#"><img src="images/nav.png" alt="" /></a>
                    <ul class="nav">
                        <li><a href="#"><i><img src="images/logo1.png" alt="" /></i></a></li>

                        <div class="clear"></div>
                    </ul>
                    <script type="text/javascript" src="js/responsive-nav.js"></script>
                </div>	
                <div class="profile_details">
                    <div id="loginContainer">
                        <a id="loginButton" class=""><span><font style="margin-left: -17px">Login</font></span></a>   
                        <div id="loginBox">                
                            <form id="loginForm" action="LoginCheck" method="post">
                                <fieldset id="body">
                                    <div class="user-info">

                                        <font style="color: white">User Name:<input type="Text" value="" name="user" required>
                                        <font style="color: white">PassWord:<input type="password" value="" name="Pass" required>
                                        <input type="submit" value="Login">


                                    </div>			                            
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    <div class="profile_img">	
                        <img src="images/lo.png" alt="" style="width: 45px;height: 45px" />	
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
                    <div class="column_right_grid calender">
                        <div class="cal1"> </div>
                    </div>
                </div>

                <div class="column_middle_grid1">
                    <div class="profile_picture">
                        <a href=""><img src="images/chat1.jpg" alt="" />	</a>		         
                        <div class="profile_picture_name">
                            <h2>Ideation Portal - Chat</h2>
                            <p>Online Chat</p>   </div>

                    </div>
                    <div class="articles_list">
                        <ul>
                            <%
                                DbConnection db = new DbConnection();
                                ResultSet rs = db.Select("select count(*) as count1 from register");
                                int i = 0;
                                int j = 0;
                                while (rs.next()) {
                                    i = rs.getInt("count1");
                                }
                                ResultSet rs1 = db.Select("select count(*) as count1 from register where Status2='" + 1 + "'");

                                while (rs1.next()) {
                                    j = rs1.getInt("count1");
                                }
                            %>
                            <li><a href="#" class="red"> <img src="images/comments.png" alt="" /> <%=i%></a></li>
                            <li><a href="#" class="purple"> <img src="images/likes.png" alt="" /> <%=j%></a></li>
                            <li><a href="#" class="yellow"> <img src="images/views.png" alt="" /> <%=i - j%></a></li>
                            <div class="clear"></div>	
                        </ul>
                    </div>
                </div>  



            </div> 

            <div class="column_middle">
                <%
                      String msg = (String) session.getAttribute("msg");
                      if (msg != null) {%>
                <div class="ab"> <font face="Comic sans MS" size="5" style="color: red" ><%=msg%></font></div>


                <%
                        session.removeAttribute("msg");
                    }


                %>

                <div class="weather">

                    <a href=""><img src="images/chat_home.png" alt="" />	</a>		         
                    <div class="profile_picture_name">

                    </div>


                </div>

            </div>

            <div class="column_right">


                <div class="column_right_grid sign-in">
                    <div class="sign_in">
                        <h3>Sign in to your account</h3>
                        <form name="form" enctype="multipart/form-data" action="Register" method="post" onsubmit="return form_validation();">
                            <span>
                                <i><img src="images/mail.png" alt="" /></i><input type="text" value="Enter your email" id="email" name="email" onfocus="this.value = '';" onblur="if (this.value == '') {
                                                                    this.value = 'Enter your email';
                                                                }">
                            </span>
                            <span>
                                <i><img src="images/lock.png" alt=""  /></i>
                                <input type="password" placeholder="password"  id="password"  name="password" required>
                            </span>
                            <span>
                                <i><img src="images/user.png" alt="" /></i>
                                <input type="text" placeholder="First Name" id="F_Name" name="F_Name" required>
                            </span>
                            <span>
                                <i><img src="images/user.png" alt="" /></i>
                                <input type="text" placeholder="Last Name" id="L_Name" name="L_Name" required>
                            </span>
                            <span>
                                <i><img src="images/nnm.png" alt="" style="width: 32px;" /></i>
                                <input type="text" placeholder="Mobile Number" id="U_Ph" name="U_Ph" required>
                            </span>
                            <span>
                                <i><img src="images/user.png" alt="" style="width: 32px;"  /></i>
                                Gender<input type="radio" name="gender" value="Male" >Male
                                <input type="radio" name="gender" value="Female">Female
                            </span>
                            <span>
                                <i><img src="images/calendar_better.png" alt="" style="width: 32px;" /></i>
                                <input type="text" name="dob"  id="datepicker" class="input" value="12/09/2014" required readonly  />

                            </span>
                            <span>
                                <i><img src="images/sss.png" alt="" style="width: 32px;" /></i>
                                <input type="file" name="file1" id="file1"  required   />

                            </span>
                            <input type="submit" class="my-button" value="Sign In" onclick="return Validate1();">
                        </form>

                    </div>

                </div>


            </div>
            <div class="clear"></div>
        </div>
    </div>
      
</body>
</html>

