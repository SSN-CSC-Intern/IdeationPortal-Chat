
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
    <script language="javascript" type="text/javascript">
        var xmlHttp
        var xmlHttp
        function showState(str) {
            if (typeof XMLHttpRequest != "undefined") {
                xmlHttp = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (xmlHttp == null) {
                alert("Browser does not support XMLHTTP Request")
                return;
            }
            var url = "state1.jsp";
            url += "?count=" + str;
            xmlHttp.onreadystatechange = stateChange;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }

        function show() {
            var k = document.getElementById("country");
            var str = k.options[k.selectedIndex].text;

            var a = document.getElementById("stat");
            var str1 = a.options[a.selectedIndex].text;

            var b = document.getElementById("city");
            var str2 = b.options[b.selectedIndex].text;

            var qty = document.getElementById("qty").value;
            // alert(str3);
            var xmlhttp;
            var url = "calc.jsp?c=" + str + "&s=" + str1 + "&ci1=" + str2 + "&qty=" + qty;
            // alert(url)
            if (window.XMLHttpRequest) {
                xmlhttp = new XMLHttpRequest();
            }
            else {
                xmlhttp = new ActiveXObiect("Microsoft.XMLHTTP");
            }

            xmlhttp.onreadystatechange = function()
            {
                if (xmlhttp.readyState == 4)
                {
                    document.getElementById("rate").innerHTML = xmlhttp.responseText;
                    // document.f.rate.value=xmlhttp.responseText;
                    // alert(xmlhttp.responseText);
                }
            }
            xmlhttp.open("GET", url, true);
            xmlhttp.send();
        }

        function ch() {
            if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                document.getElementById("rate").innerHTML = xmlHttp.responseText
            }
        }




        function stateChange() {
            if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                document.getElementById("state").innerHTML = xmlHttp.responseText
            }
        }

        function showCity(str) {
            if (typeof XMLHttpRequest != "undefined") {
                xmlHttp = new XMLHttpRequest();
            }
            else if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            if (xmlHttp == null) {
                alert("Browser does not support XMLHTTP Request")
                return;
            }
            var url = "city.jsp?count=" + str;

            xmlHttp.onreadystatechange = stateChange1;
            xmlHttp.open("GET", url, true);
            xmlHttp.send(null);
        }
        function stateChange1() {
            if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
                document.getElementById("city").innerHTML = xmlHttp.responseText
            }
        }

        function check() {
            //alert("sdsd");

            var bb = document.getElementById("rat").value;
            // alert(bb);
            document.form1.tot.value = bb * 1.12;


        }
    </script> 
</head>
<body onload="loadfn()">	
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
                 <div class="column_right_grid date_events">

                    <h3><a href="#" id="slide_prev"><img src="images/arrow-left.png" alt="" /></a>
                       Type Name to Add Member
                        <a href="#" id="slide_next"><img src="images/arrow-right.png" alt="" /></a>
                    </h3>
                    <ul id="slide" class="event_dates">	
                        <li>
                            <div id="feids">
                                
                            </div>
                        </li>
                        <li>
                            <table class="new_search">
                                <tr>
                                    <td><input type="text" name="search" id="search" placeholder="Type e-Mail Id" size="45" onkeyup="call(this.value)"></td>
                                </tr>
                            </table>
                        </li>
                        <li>
                            <div id="eids">
                                
                            </div>
                        </li>
                    </ul>

                    <script type="text/javascript">
                        $(function() {
                            $('#slide').ulslide({
                                effect: {
                                    type: 'carousel', // slide or fade
                                    axis: 'x', // x, y
                                    showCount: 1
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
                <br>
           







            </div> 

            <div class="column_middle">
                <div class="column_right_grid date_events">
                    <h3>
                        <a href="#" id="slide_prev"><img src="images/arrow-left.png" alt="" /></a>
                        chat  
                        <a href="#" id="slide_next"><img src="images/arrow-right.png" alt="" /></a>
                    </h3>
			<ul id="slide" class="event_dates">					            
                            <li>
                                <table class="new_search" style="margin-top: 10px;">
                                <tr>
                                    <td>
                                        <input type="text" name="txt_chat" id="txt_chat" placeholder="Type Message" size="35">
                                        <input type="button" name="button1" value="GO" onclick="call4()">
                                    </td>
                                </tr>
                            </table>
                            </li>
                            <li>
                                <div id="chatmsg">
                                    
                                </div>
                            </li>
                        </ul>
                </div>

 <%
                  String msg=(String)session.getAttribute("msg");
                  if(msg!=null)
                  {%>
                  <div class="ab"> <font face="Comic sans MS" size="5" style="color: red" ><%=msg%></font></div>
                      
             
                                          <%  
                       session.removeAttribute("msg");
                  }
                
                 
                  %>
                  <br>
                  <br>
               </div>



            
            <div class="column_left">
              
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
            .
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
<script>

    function call(p1) {
        if(p1!="") {
        ob = getObject()
        ob.onreadystatechange = doWork1
        ob.open("POST","geteids.jsp",true)
        ob.setRequestHeader("Content-type","application/x-www-form-urlencoded")
        ob.send("eid="+p1)
        } else {
           document.getElementById("eids").innerHTML = "" 
        }
    }

    function call1(p2) {
        ob = getObject()
        ob.onreadystatechange = doWork1
        ob.open("POST","updateeids.jsp",true)
        ob.setRequestHeader("Content-type","application/x-www-form-urlencoded")
        ob.send("eid="+p2+"&stxt="+document.getElementById("search").value)
    }
    
    function call2() {        
        ob1 = getObject()
        ob1.onreadystatechange = doWork2
        ob1.open("POST","showeids.jsp",true)
        ob1.setRequestHeader("Content-type","application/x-www-form-urlencoded")
        ob1.send()        
    }
    
    function call3(p3) {
        ob2 = getObject()
        ob2.onreadystatechange = doWork2
        ob2.open("POST","updatefeids.jsp",true)
        ob2.setRequestHeader("Content-type","application/x-www-form-urlencoded")
        ob2.send("eid="+p3)
    }
    
    function call4() {
        if(document.getElementById("txt_chat").value != "") {
            txt = document.getElementById("txt_chat").value
            ob3 = getObject()
            ob3.onreadystatechange = doWork3
            ob3.open("POST","chat.jsp",true)
            ob3.setRequestHeader("Content-type","application/x-www-form-urlencoded")
            ob3.send("txt="+txt)
            document.getElementById("txt_chat").value = ""
        }
    }
    
    function call5() {
            ob4 = getObject()
            ob4.onreadystatechange = doWork4
            ob4.open("POST","showchat.jsp",true)
            ob4.setRequestHeader("Content-type","application/x-www-form-urlencoded")
            ob4.send()
    }
    function doWork1() {
        if(ob.readyState==4 && ob.status==200) {
            document.getElementById("eids").innerHTML = ob.responseText
        }
    }
   
    function doWork2() {        
        if(ob1.readyState==4 && ob1.status==200) {            
            document.getElementById("feids").innerHTML = ob1.responseText
        }
    }
    
    function doWork3() {
        if(ob3.readyState==4 && ob3.status==200) {
            //document.getElementById("chatmsg").innerHTML = ob3.responseText
        }
    }
    
    function doWork4() {
        if(ob4.readyState==4 && ob4.status==200) {
            document.getElementById("chatmsg").innerHTML = ob4.responseText
        }
    }
    
    function getObject() {
        if(window.ActiveXObject)
            return new ActiveXObject("Microsoft.XMLHTTP")
        else
            return new XMLHttpRequest()
    }
    
    function loadfn() {
        window.setInterval("call2()","1000")
        window.setInterval("call5()","1000")
    }
    
</script>
</html>

