<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="contactus.aspx.cs" Inherits="Hostelistan.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">




        body,
html {
    margin: 0;
    padding: 0;
    font-family: sans-serif;
}

textarea {
    font-family: sans-serif;
}

* {
    box-sizing: border-box;
}

.wrapper {
    width: 100%;
    padding-right: 15px;
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
}

@media (min-width: 576px) {
    .wrapper {
        max-width: 540px;
    }
}

@media (min-width: 768px) {
    .wrapper {
        max-width: 720px;
    }
}

@media (min-width: 992px) {
    .wrapper {
        max-width: 960px;
    }
}

@media (min-width: 1200px) {
    .wrapper {
        max-width: 1140px;
    }
}

.d-grid {
    display: grid;
}

.text-center {
    text-align: center;
}

.text-left {
    text-align: left;
}

.text-right {
    text-align: right;
}

button,
select {
    outline: none;
    appearance: none;
}

button,
.btn,
select {
    cursor: pointer;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
}

a {
    text-decoration: none;
}

h1,
h2,
h3,
h4,
h5,
h6 {
    margin: 0;
    padding: 0;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
}

p {
    margin: 0;
    padding: 0;
}

/* Section top bottom gap */
.section-gap {
    padding: 3.5rem 0;
}

@media screen and (max-width:767px) {
    .section-gap {
        padding: 3.5rem 0;
    }
}

@media screen and (max-width:480px) {
    .section-gap {
        padding: 3rem 0;
    }
}
/* / Section top bottom gap */

/* title-styling */
h3.global-title {
    font-size: 40px;
    line-height: 45px;
    color: #16191e;
    margin-bottom: 50px;
    text-transform: capitalize;
}

@media screen and (max-width:767px) {
    h3.global-title {
        font-size: 40px;
        line-height: 45px;
    }
}

@media screen and (max-width:600px) {
    h3.global-title {
        font-size: 35px;
        line-height: 40px;
    }
}

@media screen and (max-width:500px) {
    h3.global-title {
        font-size: 30px;
        line-height: 35px;
    }
}
/* / title-styling */


/* contact1 */
.margin-up {
    margin-top: 2.5rem;
}

h4.sub-title {
    font-size: 16px;
    margin: 0;
    color: #4cb1ff;
    font-weight: normal;
}

.contact-view {
    grid-template-columns: 1fr 1.3fr;
    grid-gap: 30px;
}

.cont-top {
    display: grid;
    grid-template-columns: 20px auto;
    grid-column-gap: 20px;
}

.twice {
    margin-bottom: 20px;
}

.cont-details span.fa {
    font-size: 22px;
    color: #4cb1ff;
    display: block;
    margin-top: 3px;
}

.cont-details h6 {
    font-size: 20px;
    color: #051b35;
    font-weight: 600;
}

.cont-details p,
.cont-details p a {
    font-style: normal;
    font-weight: normal;
    font-size: 16px;
    line-height: 24px;
    color: #777777;
    margin-top: 3px;
}

    .cont-details p a:hover {
        text-decoration: underline;
        opacity: 0.8;
        color: #051b35;
    }

.cont-details address {
    margin: 25px 0;
}

    .cont-details address p {
        margin: 5px 0;
    }

.twice-two {
    display: grid;
    grid-gap: 20px;
    grid-template-columns: 1fr 1fr;
    margin-bottom: 20px;
}

.map-content form input,
.map-content form textarea {
    background: #f8f9fa;
    border: 2px solid rgba(216, 216, 216, 0.3);
    color: #777;
    font-size: 16px;
    padding: 12px 15px;
    width: 100%;
    border-radius: 4px;
    height: 55px;
}

.map-content h5 {
    font-size: 25px;
    line-height: 30px;
    margin-bottom: 20px;
    color: #000000;
}

.map-content form textarea {
    resize: none;
    min-height: 140px;
}

    .map-content form input:focus,
    .map-content form textarea:focus {
        outline: none;
        border: 2px solid #051b35;
        background: #fff;
        box-shadow: none;
    }

button.btn-contact {
    border: none;
    font-size: 16px;
    padding: 15px 30px;
    margin: 20px auto 0;
    color: #fff;
    background: #2691d9;
    border-color: #2691d9;
    border-radius: 25px;
    display: inline-block;
    font-weight: 400;
    text-align: center;
    vertical-align: middle;
    cursor: pointer;
    user-select: none;
    border: 1px solid transparent;
}

.cont-details h6 a {
    color: #051b35;
}

/* contact1-responsive */
@media(max-width: 992px) {

    .cont-details p,
    .cont-details p a {
        font-size: 16px;
    }

    .cont-details h5 {
        font-size: 32px;
        line-height: 35px;
    }

    .contact-view {
        grid-template-columns: 1fr;
    }

    .map-content {
        margin-top: 40px;
    }
}

@media(max-width: 480px) {
    .twice-two {
        grid-template-columns: 1fr;
    }

    button.btn-contact {
        width: 100%;
    }
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav>
        <div class="menu">
            <div class="logo">
                <a href="#">Hostelistan</a>
            </div>
            <ul>
                <li><a href="login.aspx">List Your Hostel</a></li>
                <li><a href="login.aspx">Offer Your Services</a></li>
                <li><a href="hostellist.aspx">Find Hostels</a></li>
                <li><a href="servicelist.aspx">Find Services</a></li>
                <li><a href="login.aspx">LOGIN</a></li>
            </ul>
        </div>

    </nav>

     <div class=" section-gap"></div>
      <div class="wrapper">
        <h4 class="sub-title text-center">Find us</h4>
        <h3 class="global-title text-center">Contact us</h3>
        <div class="d-grid contact-view">
          <div class="cont-details">
            <div class="cont-top">
              <div class="cont-left text-center">
                <span class="fa fa-phone text-primary"></span>
              </div>
              <div class="cont-right">
                <h6>Call Us</h6>
                <p><a href="#">+123 45 67 89</a></p>
              </div>
            </div>
            <div class="cont-top margin-up">

              <div class="cont-left text-center">
                <span class="fa fa-envelope-o text-primary"></span>
              </div>
              <div class="cont-right">
                <h6>Email Us</h6>
                <p><a href="mailto:example@mail.com" class="mail">student.hostels@gmail.com</a></p>
              </div>
            </div>
            <div class="cont-top margin-up">
              <div class="cont-left text-center">
                <span class="fa fa-map-marker text-primary"></span>
              </div>
              <div class="cont-right">
                <h6>Address</h6>
                <p>Lahore,Pakistan</p>
              </div>
            </div>
          </div>
          <div class="map-content">
            <form action="#" method="post">
              <div class="twice-two">
                <input type="text" class="form-control" name="w3lName" id="w3lName" placeholder="Name" required="">
                <input type="email" class="form-control" name="w3lSender" id="w3lSender" placeholder="Email"
                  required="">
              </div>
              <div class="twice">
                <input type="text" class="form-control" name="w3lSubject" id="w3lSubject" placeholder="Subject"
                  required="">
              </div>
              <textarea name="w3lMessage" class="form-control" id="w3lMessage" placeholder="Message"
                required=""></textarea>
              <button type="submit" class="btn btn-contact">Send Message</button>
            </form>
          </div>
        </div>
      </div>
</asp:Content>
