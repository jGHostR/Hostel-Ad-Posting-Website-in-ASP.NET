<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Hostelistan.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <style type="text/css">

    
.img {
    background: url('estate.jpg')repeat;
    width: 100%;
    height: 80vh;
    background-size: cover;
    background-position: center;
    position: relative;
}

    .img::before {
        content: '';
        position: absolute;
        height: 100%;
        width: 100%;
        background: rgba(0, 0, 0, 0.4);
    }

.img1 {
    background: url('Banner.png')repeat;
    width: 100%;
    height: 80vh;
    background-size: cover;
    background-position: center;
    position: relative;
}

    .img1::before {
        content: '';
        position: absolute;
        height: 100%;
        width: 100%;
        background: rgba(0, 0, 0, 0.4);
    }

.center {
    position: absolute;
    top: 52%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
    padding: 0 20px;
    text-align: center;
}

    .center .title {
        color: #fff;
        font-size: 55px;
        font-weight: 600;
    }

    .center .sub_title {
        color: #fff;
        font-size: 32px;
        font-weight: 600;
    }

    .center .btns {
        margin-top: 20px;
    }

        .center .btns button {
            height: 55px;
            width: 170px;
            border-radius: 5px;
            border: none;
            margin: 0 10px;
            border: 2px solid white;
            font-size: 20px;
            font-weight: 500;
            padding: 0 10px;
            cursor: pointer;
            outline: none;
            transition: all 0.3s ease;
        }

            .center .btns button:first-child {
                color: #fff;
                background: none;
            }

.btns button:first-child:hover {
    background: white;
    color: black;
}

.center .btns button:last-child {
    background: white;
    color: black;
}

input[type=text] {
    width: 40%;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-position: 10px 10px;
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
}


h3.global-title {
    font-size: 40px;
    line-height: 45px;
    color: #16191e;
    margin-bottom: 12px;
    margin-top: 50px;
    text-transform: capitalize;
    text-align: center;
    font-family: 'Poppins', sans-serif;
}

input[type="submit"]{
    width: 95px;
    height: 42px;
    border: 1px solid;
    background: #2691d9;
    font-size: 18px;
    color: #e9f4fb;
    font-weight: 700;
    cursor: pointer;
    outline: none;
}


.avail {
   
    padding-top:10px;
    padding-left:65px;
    padding-right:50px;
}




.cards_wrap {
    padding: 20px;
    width: 100%;
    display: flex;
    justify-content: space-between;
    flex-wrap: wrap;
}

    .cards_wrap .card_item {
        padding: 15px 25px;
        width: 25%;
    }

    .cards_wrap .card_inner {
        background: #fff;
        border-radius: 5px;
        padding: 35px 20px;
        min-width: 225px;
        min-height: 315px;
        max-height: 325px;
        width: 100%;
    }

    .cards_wrap .card_item img {
        width: 80px;
        height: 80px;
        margin-bottom: 5px;
    }

    .cards_wrap .card_item .role_name {
        color: black;
        letter-spacing: 2px;
        text-transform: uppercase;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        font-family: 'Poppins', sans-serif;
        font-size: 20px;
        font-weight: 1000;
    }

    .cards_wrap .card_item .real_name {
        color: #b6c0c2;
        font-size: 12px;
        font-weight: 100;
        margin: 5px 0 10px;
    }

    .cards_wrap .card_item .film {
        font-size: 14px;
        line-height: 24px;
        color: #7b8ca0;
    }

@media screen and (max-width: 1024px) {
    .cards_wrap .card_item {
        width: 33%;
    }
}

@media screen and (max-width: 768px) {
    .cards_wrap .card_item {
        width: 50%;
    }

    .wrapper .header {
        font-size: 16px;
        height: 60px;
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
                <li><a href="#">Find Hostels</a></li>
                <li><a href="#">Find Services</a></li>
                <li><a href="login.aspx">LOGIN</a></li>
                <li><a href="contactus.aspx">Contact Us</a></li>
            </ul>
        </div>

    </nav>
    <div>
        <div class="img"></div>
    <div class="center">
        <div class="title">Search For Hostels</div>

        <form>
            <input type="text" name="search" placeholder="Search..">
        </form>
        <div class="btns">
        <button onclick="document.location='login.aspx'">Search</button>

        </div>
    </div>
        </div>
    <div>
     <div class="img1">
    <div class="center">
        <div class="title">Search For Services</div>

        <form>
            <input type="text" name="search" placeholder="Search..">
        </form>
        <div class="btns">
            <button onclick="document.location=''">Search</button>
        </div>
    </div>
        </div>
        </div>






</asp:Content>
