<%-- 
    Document   : feedback
    Created on : 02 17, 22, 7:05:49 PM
    Author     : John Jeco Villanueva
--%>
<%--<%
 
    //clears cache so that if session is already destroyed then user won't be able to go 
    //back to the success page
    response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expire", 0);
    PortsDatabase ports = (PortsDatabase) session.getAttribute("dbConnection");
    if (session.getAttribute("customer") != null)
    {
         Customer c = (Customer) session.getAttribute("customer");
         Order o = c.getOrder(ports);
         if(o.isEmpty() || o.getOrder_Status_Id() < 5)
            response.sendRedirect("orderstatus.jsp");
    }
    else if (session.getAttribute("employee") != null)
    {
        response.sendRedirect("adminOrderList.jsp");
    }
 
%> --%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" type="image/png" href="image/logo.png">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedback</title>

        <link href="feedback.jsp?v={random number/string}" rel="stylesheet">

        <!-- font awesome cdn link  -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

        <!-- custom css file link  -->
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <!-- header section starts -->
        <%@include file="header_external.jsp"%>
        <!-- header section ends -->
        <%

            //clears cache so that if session is already destroyed then user won't be able to go 
            //back to the success page
            response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expire", 0);
            
            if(session.getAttribute("customerOrderFeedback") == null) {
               response.sendRedirect("orderstatus.jsp"); 
            }
        %>
        <section class="feedback">
            <div class="feedbackheader">
                <p class="headerfeedback">Feedback</p>
            </div>

            <div class="feedbackcontent" id="feedbackDiv">
                <p>Thank you for taking your time to answer our short customer survey. Kindly rate our services from 1 to 5 with 5 being the best rating for our overall service.</p>
            </div>

            <form class="feedbackcontent" id = "feedbackForm" action="giveFeedback" method = "POST">
                <div class="feedbackcontent" id="feedbackDiv">
                    <div class="feedbackitem">
                        <input type="radio" id="radio1" name="ratingF" value="1" required>
                        <label class="rating__star far fa-star" value="one" title="1 Star" for='radio1'></label>
                        <input type="radio" id="radio2" name="ratingF" value="2">
                        <label class="rating__star far fa-star" value="two" title="2 Stars" for='radio2'></label>
                        <input type="radio" id="radio3" name="ratingF" value="3">
                        <label class="rating__star far fa-star" value="three" title="3 Stars" for='radio3'></label>
                        <input type="radio" id="radio4" name="ratingF" value="4">
                        <label class="rating__star far fa-star" value="four" title="4 Stars" for='radio4'></label>
                        <input type="radio" id="radio5" name="ratingF" value="5">
                        <label class="rating__star far fa-star" value="five" title="5 Stars" for='radio5'></label>
                    </div>
                    <script>
                        const ratingStars = [...document.getElementsByClassName("rating__star")];

                        function executeRating(stars) {
                            const starClassActive = "rating__star fas fa-star";
                            const starClassInactive = "rating__star far fa-star";
                            const starsLength = stars.length;
                            let i;
                            stars.map((star) => {
                                star.onclick = () => {
                                    i = stars.indexOf(star);

                                    if (star.className === starClassInactive) {
                                        for (i; i >= 0; --i)
                                            stars[i].className = starClassActive;
                                    } else {
                                        for (i; i < starsLength; ++i)
                                            stars[i].className = starClassInactive;
                                    }
                                };
                            });
                        }
                        executeRating(ratingStars);
                    </script>
                </div>
                <div class="feedbackcontent" id="feedbackDiv">
                    <textarea id="feedbacktext" name="commentF" placeholder="We welcome any additional comments and suggestions:"></textarea>
                </div>

                <div class="feedbackcontent" id="feedbackDiv">
                    <input type="submit" value="Submit" class="feedbacksubmit">
                </div>
            </form>
        </section>
    </body>
</html>