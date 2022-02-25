<%-- 
    Document   : feedback
    Created on : 02 17, 22, 7:05:49 PM
    Author     : John Jeco Villanueva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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

        <section class="feedback">
            <div class="feedbackheader">
                <p class="headerfeedback">Feedback</p>
            </div>

            <div class="feedbackcontent">
                <p>Thank you for taking your time to answer our short customer survey. Kindly rate our services from 1 to 5 with 5 being the best rating for the indicated service.</p>
            </div>

            <form class=feedbackcontent id = "feedbackForm" action="">
                <div class="feedbackcontent">
                    <div class="feedbackitem0">
                        <div class="labels"></div>
                        <div class="itemf">1</div>
                        <div class="itemf">2</div>
                        <div class="itemf">3</div>
                        <div class="itemf">4</div>
                        <div class="itemf">5</div>
                    </div>
                    <div class="feedbackitem">
                        <div class="labels">Taste Satisfaction</div>
                        <input class="itemf" type="radio" name="taste" value="one">
                        <input class="itemf" type="radio" name="taste" value="two">
                        <input class="itemf" type="radio" name="taste" value="three">
                        <input class="itemf" type="radio" name="taste" value="four">
                        <input class="itemf" type="radio" name="taste" value="five">
                    </div>
                    <div class="feedbackitem">
                        <div class="labels">Quality Packaging</div>
                        <input class="itemf" type="radio" name="quality" value="one">
                        <input class="itemf" type="radio" name="quality" value="two">
                        <input class="itemf" type="radio" name="quality" value="three">
                        <input class="itemf" type="radio" name="quality" value="four">
                        <input class="itemf" type="radio" name="quality" value="five">
                    </div>
                    <div class="feedbackitem">
                        <div class="labels">Efficient Delivery</div>
                        <input class="itemf" type="radio" name="efficient" value="one">
                        <input class="itemf" type="radio" name="efficient" value="two">
                        <input class="itemf" type="radio" name="efficient" value="three">
                        <input class="itemf" type="radio" name="efficient" value="four">
                        <input class="itemf" type="radio" name="efficient" value="five">
                    </div>
                    <div class="feedbackitem">
                        <div class="labels">Responsive Staff</div>
                        <input class="itemf" type="radio" name="responsive" value="one">
                        <input class="itemf" type="radio" name="responsive" value="two">
                        <input class="itemf" type="radio" name="responsive" value="three">
                        <input class="itemf" type="radio" name="responsive" value="four">
                        <input class="itemf" type="radio" name="responsive" value="five">
                    </div>
                    <div class="feedbackitem">
                        <div class="labels">Value for Money</div>
                        <input class="itemf" type="radio" name="value" value="one">
                        <input class="itemf" type="radio" name="value" value="two">
                        <input class="itemf" type="radio" name="value" value="three">
                        <input class="itemf" type="radio" name="value" value="four">
                        <input class="itemf" type="radio" name="value" value="five">
                    </div>
                </div>

                <div class="feedbackcontent">
                    <p>Would you order from us again?</p>
                    <div class="feedbackitem">
                        <div class="itemf"></div>
                        <div class="itemf"></div>
                        <div class="itemf"></div>
                        <input class="itemf" id="yes" type="radio" name="value" value="yes"><label  class="itemf"  for="yes">Yes</label>       
                        <input class="itemf" id="no" type="radio" name="value" value="no"><label  class="itemf"  for="No">No</label>
                        <div class="itemf"></div>
                        <div class="itemf"></div>
                        <div class="itemf"></div>
                    </div>
                </div>
                <div class="feedbackcontent">
                    <textarea id="feedbacktext" name="feedbacktext" placeholder="We welcome any additional comments and suggestions:"></textarea>
                </div>

                <div class="feedbackcontent">
                    <input type="submit" value="Submit" class="feedbacksubmit">
                </div>
            </form>
        </section>
    </body>
</html>
