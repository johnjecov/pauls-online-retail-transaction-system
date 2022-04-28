<%-- 
    Document   : Login
    Created on : 05 17, 21, 1:36:23 AM
    Author     : manuellouisecruz
--%>
<%@page import="java.util.*, ports.models.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@  page import = "ports.models.*" %> 
    <%@  page import = "java.util.*" %>  
    <%@  page import = "javax.servlet.*" %>  
  
     <%  ServletContext app = getServletContext();
         PortsDatabase port = (PortsDatabase)app.getAttribute("dbConnection");
             %>
    <head>
        <link rel="icon" type="image/png" href="image/logo.png">
        <title>View Addresses</title>
        <link rel="shortcut icon" type="image/png" href="images/logotrans.png">
        <meta charset = "utf-8">
        <meta name = "viewport" content = "width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv = "Content-Type" content = "text/html; charset=UTF-8">
        <script src = "https://kit.fontawesome.com/a076d05399.js"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Cinzel&display=swap" rel="stylesheet">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans&display=swap" rel="stylesheet">
        <link rel = "stylesheet" href = "https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src = "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src = "https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
        <link rel = "stylesheet" href = "https://unpkg.com/swiper/swiper-bundle.min.css"/>
        <script src = "https://unpkg.com/swiper/swiper-bundle.min.js"></script>
      
        <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">
    <script>
var subjectObject = {
 "Metro Manila": {
      
    "Caloocan": [1400, 1401, 1402, 1403, 1404, 1405, 1406, 1407, 1408, 1409,
1410, 1411, 1412, 1413, 1420, 1421, 1422, 1423, 1424, 1425, 
1426, 1427, 1428],

    "Makati": [1200,1201,1202,1203,1204,1205,1206,1207,1208,1209,1210,
1211,1212,1213,1214,1215,1216,1217,1218,1219,1220,1221,
1222,1223,1224,1225,1226,1227,1228,1229,1230,1231,1232,
1233,1234,1235],

    "Malabon": [1409,1470,1471,1472,1473,1474,1475,1476,1477,1478,1479,1480],
    
    "Mandaluyong": [1550,1551,1552,1553,1554,1555,1556],
    
    "Manila": [1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,
1011,1012,1013,1014,1015,1016,1017,1018],

    "Marikina": [1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1811,1820],

    "Muntinlupa": [1770,1771,1772,1773,1774,1775,1776,1777,1780,1781,1799],
    
    "Navotas": [1409,1411,1412,1413,1485,1489,1490],
    
    "Parañaque": [1700,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1711,1712,1713,1714,1714,1715,1716,1718,1719,1720],
    
    "Pasay": [1300,1301,1302,1303,1304,1305,1306,1307,1308,1309],
    
    "Pasig": [1600,1601,1602,1603,1604,1605,1606,1607,1608,1609,1610,1611,1612],
    
    "Pateros": [1620, 1621],
    
    "Quezon": [1100,1101,1102,1103,1104,1105,1106,1107,1108,1109,1110,1111,1112,
1113,1114,1115,1116,1117,1118,1119,1120,1121,1122,1123,1124,1125,1126,1127,1128,1131],

    "San Juan": [0400,0401,0410,420,1500,1502,1503,1504],
    
    "Taguig": [1630,1631,1632,1633,1634,1636,1637,1638],
    
    "Valenzuela": [0550,560,1440,1441,1442,1443,1444,1445,1446,1447,1448,1496]
}
}
window.onload = function() {
  var subjectSel = document.getElementById("province");
  var topicSel = document.getElementById("city");
  var chapterSel = document.getElementById("postalCode");
  for (var x in subjectObject) {
    subjectSel.options[subjectSel.options.length] = new Option(x, x);
  }
  subjectSel.onchange = function() {
    //empty Chapters- and Topics- dropdowns
    chapterSel.length = 1;
    topicSel.length = 1;
    //display correct values
    for (var y in subjectObject[this.value]) {
      topicSel.options[topicSel.options.length] = new Option(y, y);
    }
  }
  topicSel.onchange = function() {
    //empty Chapters dropdown
    chapterSel.length = 1;
    //display correct values
    var z = subjectObject[subjectSel.value][this.value];
    for (var i = 0; i < z.length; i++) {
      chapterSel.options[chapterSel.options.length] = new Option(z[i], z[i]);
    }
  }
}
</script>
    </head>
    
    <body>
    <!-- header section starts -->
    <%@include file="header_external.jsp"%>
    <%@include file="customerLogout.jsp"%>
     <%  
            String user = "";
            Customer c=null;
            ArrayList<Address> add = new ArrayList<Address>();
            
            if(session.getAttribute("customer")!= null)
            {
                 c = (Customer) session.getAttribute("customer");
                user = (String) c.getUsername();
                add = port.getCustomerAddresses(c.getCustomer_Id());
                
            }
        %>
     <!-- header section ends -->
        <section id="sec">
            <div class = "container">
                <div class = "user Aaddress">
                    
                    <div class = "formBx">
                            <div class="scrollbx">
               
                        <form method="POST" action="removeAddress" autocomplete="off">
                            <h2>View Addresses</h2>
                            <p class = "signup"><a href = "#" onclick = "toggleForm();">Add New Address</a></p>
                            <br>
                            <%  if(add.size()==0)
                                
                            { %>
                            <br><br><br><br><br>
                            <h2>You Do not Have Any Addresses</h2>
                            <h2>Click on the <b>ADD NEW ADDRESS</b> to add</h2>
                            <% } else%>
                            <%  { %> <div class="theBoxA">
                            <% for (int i=0; i < add.size(); i++) { %>
                                <div class="viewAddressBx">
                                    <div class="edit">
                                        <h3><%= ((Address)add.get(i)).getAddressName() %></h3>
                                        <div class="box"></div>
                                    </div>
                                        <table>
                                            <colgroup>
                                                <col span="1" style="width: 30%;">
                                                <col span="1" style="width: 20%;">
                                                <col span="1" style="width: 45%;">
                                             </colgroup>
    
                                              <tr>
                                                <th >House Number</th>
                                                <td></td>
                                                <td><%= ((Address)add.get(i)).getHouseNo() %></td>
                                       
                                              </tr>
                                              <tr>
                                                <th>Street</th>
                                                <td></td>
                                                <td><%= ((Address)add.get(i)).getStreet() %></td>
                                             </tr>
                                              <tr>
                                                <th>City</th>
                                                <td></td>
                                                <td><%= ((Address)add.get(i)).getCity() %></td>
                                             </tr>
                                              <tr>
                                                <th>Province</th>
                                                <td></td>
                                                <td><%= ((Address)add.get(i)).getProvince() %></td>
                                             </tr>
                                              <tr>
                                                <th>Postal Code</th>
                                                <td></td>
                                                <td><%= ((Address)add.get(i)).getPostalCode() %></td>
                                             </tr>
                                              <tr>
                                                  <th> Address Details</th>
                                                  <td></td>
                                                <td><%= ((Address)add.get(i)).getAdditionalDetails() %></td>
                                             </tr>
                                             <tr>
                                                <th>Additional Details</th>
                                                <td></td>
                                                <td><%= ((Address)add.get(i)).getDetails() %></td>
                                             </tr>
                                        </table>
                                   
                                    <button name ="remove" value="<%= ((Address)add.get(i)).getAddressId() %>" class="removebtn" style="cursor: pointer;">Remove</button>
                                     
                                </div> 
                                   <% if(i+1%2==0){  %>
                                   <div class="breakF"></div>
                                   <% } %>
                            <br> <% } %></div>
                            <% } %>
                            
                    </form>  
                          
                </div>
            </div>
                  
                </div>
                <div class = "user Vaddress">
                    <div class = "formBx">
                        <form method="POST" action="addAddress" autocomplete="off">
                            <h2>Add New Address</h2>
                            <input id ="user" type = "text" placeholder = "Address Name" name="addressName" required="required">
                           
                      
                            <div class="radiocon">
                                <input id ="user" type = "text" placeholder = "House No." name="houseNo" required="required">
                                 <div class="boxX"></div>
                            <input id ="user" type = "text" placeholder = "Street" name="street" required="required">
                            
                            </div>
                            
                            <div class ="radiocon">
                                <select name="province" id="province" class="boxD" required="required" >
                                    <option value="" selected="selected">Province</option>
                                  </select>
                                
                                    <div class="boxX"></div>
                                <select name="city" id="city" class="boxD" required="required">
                                    <option value="" selected="selected" >City</option>
                                  </select>
                                    <div class="boxX"></div>
                                <select name="postalCode" id="postalCode" class="boxD" required="required" >
                                    <option value="" selected="selected">Postal Code</option>
                                  </select>
                                    
                        </div>
                           
                            <input id ="user" type = "text" placeholder = "Additional Address Details" name="additionalAddress" required="required" >
                          
                            <input id ="user" type = "text" placeholder = "Additional Information" name="additionalInfo" required="required" >
                          
                            <input type = "submit" value = "Submit"> 
                            <p class = "signup"><a href = "#" onclick = "toggleForm();">View Addresses</a></p>
                        </form>    
                    </div>
                </div>
                    
            </div>
        </section>

        <script>
            function toggleForm()
            {
                section = document. querySelector('section');
                container = document.querySelector('.container');
                container.classList.toggle('active');
                section.classList.toggle('active');
            }
        </script>
        
      
        
        <script>
            const inputs = document.querySelectorAll("input, select, textarea");
            inputs.forEach(input => {
              input.addEventListener(
                "invalid",
                event => {
                  input.classList.add("error");
                },
                false
              );
            });
            </script>

    </body>
    
    <style>
        
        tr, th, td {
        padding-bottom: 8px;
      }
        .boxX
        {
            width: 20px;
        }
        .breakF
        {
            flex-basis: 100%;
            height: 0;
          
        }
        
        .boxD
        {
            width: 100%;
            padding: 10px;
            background: #f5f5f5;
            color: #333;
            border: none;
            outline: none;
            box-shadow: none;
            font-size: 14px;
            margin: 8px 0;
            letter-spacing: 1px;
            font-weight: 300;
        }
        
        .theBoxA
        {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }
        
        .removebtn
        {
            background: red;
            padding: 5px;
            color: white;
            border-radius: 7%;
        }
        
        .scrollbx
        {
            overflow: hidden;
            overflow-y: scroll;
            height: 100%;
            width: 100%;
        }
        
        .viewAddressBx
        {
            background-color: whitesmoke;
            border-radius: 15px;
            padding: 20px;
            width: 400px;
            margin-top: 30px;
           
        }
 
        .edit
        {
            display: flex;
        }
        
     
        
        input:required:focus
        {
            border: 1px solid #aacc9f !important;
        }

        *
        {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        
        #sec
        {
            position: relative;
            min-height: 100vh;
            background: #1e1f20;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            transition: 0.5s;
        }

        #sec.active
        {
            background: #1e1f20;
        }
        
        #sec .container
        {
            position: relative;
            width: 1000px;
            height: 800px;
            background: #302c2c;
            box-shadow: 0 15px 50px rgba(0,0,0,0.1);
            overflow: hidden;
            margin-top: 70px;
        }
        
        #sec .container .user
        {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
        }
                
        #sec .container .user .formBx
        {
            position: relative;
            width: 100%;
            height: 100%;
            background: #302c2c;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px;
            transition: 0.5s;
            font-size: 12px;
        }
        
        #sec .container .user .formBx h3
        {
            font-size: 22px;
        }
        
        #sec .container .user .formBx h2
        {
            font-size: 25px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 5px;
            text-align: center;
            width: 100%;
            margin-bottom: 10px;
            color: white;
        }
        
        #sec .container .user .formBx input
        {
            width: 100%;
            padding: 10px;
            background: #f5f5f5;
            color: #333;
            border: none;
            outline: none;
            box-shadow: none;
            font-size: 14px;
            margin: 8px 0;
            letter-spacing: 1px;
            font-weight: 300;
        }
        
        #sec .container .user .formBx input[type="submit"]
        {
            max-width: 100px;
            background: #CD212A;
            color: #fff;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            letter-spacing: 1px;
            transition: 0.5s;
        }

        #sec .container .user.Vaddress .formBx input[type="submit"]
        {
            background: #CD212A;
        }
        
        #sec .container .user .formBx .signup
        {
            position: relative;
            margin-top: 20px;
            font-size: 12px;
            letter-spacing: 1px;
            color: #555;
            text-transform: uppercase;
            font-weight: 300;
        }
        
        #sec .container .user .formBx .signup a
        {
            font-size: 15px;
            font-weight: 600;
            text-decoration: none;
            color: #CD212A;
        }
        
        #sec .container .user .formBx .Vaddress
        {
            display: none;
        }
        
        #sec .container .Vaddress
        {
            pointer-events: none;
        }
        
        #sec .container.active .Vaddress
        {
            pointer-events: initial;
        }
        
        #sec .container .Vaddress .formBx
        {
            top: 100%;
        }
        
        #sec .container.active .Vaddress .formBx
        {
            top: 0;
        }
        
        #sec .container .Vaddress .imgBx
        {
            top: -100%;
            transition: 0.5s;
        }
        
        #sec .container.active .Vaddress .imgBx
        {
            top: 0;
        }

        #sec .container .Aaddress .formBx
        {
            top: 0;
        }
        
        #sec .container.active .Aaddress .formBx
        {
            top: 100%;
        }
        
        #sec .container .Aaddress .imgBx
        {
            top: 0;
            transition: 0.5s;
        }
        
        #sec .container.active .Aaddress .imgBx
        {
            top: 100%;
        }
        
        @media (max-width: 991px)
        {
            #sec .container
            {
                max-width: 400px;
            }
            #sec .container .imgBx
            {
                display: none;
            }
            #sec .container .user .formBx
            {
                width: 100%;
            }
            #sec .container.active .Aaddress .formBx
            {
                top: -100%  ;
            }
        }
        
        .rad-label
        {
            display: flex;
            align-items: center;
            border-radius: 100px;
            padding: 14px 16px;
            margin: -5px;
            cursor: pointer;
            transition: .3s;
        }
        
        .rad-label:hover,.rad-label:focus-within 
        {
            background: hsla(0, 0%, 80%, .14);
        }
        
        .rad-input
        {
            position: absolute;
            left: 0;
            top: 0;
            width: 1px;
            height: 1px;
            opacity: 0;
            z-index: -1;
        }
        
        .rad-design
        {
            width: 22px;
            height: 22px;
            border-radius: 100px;
            background: linear-gradient(to right bottom, hsl(154, 97%, 62%), hsl(225, 97%, 62%));
            position: relative;
        }
        
        .rad-design::before
        {
            content: '';
            display: inline-block;
            width: inherit;
            height: inherit;
            border-radius: inherit;

            background: hsl(0, 0%, 90%);
            transform: scale(1.1);
            transition: .3s;
        }
        
        .rad-input:checked+.rad-design::before
        {
            transform: scale(0);
        }
        
        .rad-text
        {
            color: hsl(0, 0%, 60%);
            margin-left: 14px;
            letter-spacing: 3px;
            text-transform: uppercase;
            font-size: 12px;
            font-weight: 900;
            transition: .3s;
        }
        
        .rad-input:checked~.rad-text
        {
            color: hsl(0, 0%, 40%);
        }
        
        .radiocon
        {
            display: flex;
        }
        
       
        </style> 
</html>
