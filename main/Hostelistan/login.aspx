<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Hostelistan.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">


        
    /*	Background*/
body {
    background-image: url('https://images.unsplash.com/photo-1557683311-eac922347aa1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1129&q=80'); /* <------ */
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: 100% 100%;
}


/*Round Corners*/
.rcorners1 {
    border-radius: 25px;
}

/*white Division*/
.divi {
    height: 600px;
    width: 28%;
    margin-left: auto;
    margin-right: auto;
    margin-top: 130px;
    background-color: white;
    border-radius: 2%;
}




/*Aligning center */
.centeral {
    display: flex;
    justify-content: center;
    align-items: center;
    height: auto;
}


.center {
    display: inline-block;
    margin-left: auto;
    margin-right: auto;
}

.text {
    font: 13px/24px "Lato", Arial, sans-serif;
    color: #858686;
}










/*TextBox*/
.col {
    margin-top: 12px;
    display: inline-block;
    position: relative;
}

.textbox {
    border: 0;
    padding: 2px 0;
    border-bottom: 1px solid #ccc;
    font: 13px/24px "Lato", Arial, sans-serif;
    color: #333;
    width: 275px;
    box-sizing: border-box;
    letter-spacing: 1px;
}

    .textbox ~ .focus-border {
        position: absolute;
        bottom: 0;
        left: 50%;
        width: 0;
        height: 2px;
        background-color: #3399FF;
        transition: 0.4s;
    }

    .textbox:focus {
        outline: none;
    }

        .textbox:focus ~ .focus-border {
            width: 100%;
            transition: 0.4s;
            left: 0;
        }





.logo h1{

    text-align:center;
    font-style:normal;
    margin-top:60px;
}



/*Froms*/
.form {
    margin: auto;
    width: 268px;
}

.form label {
    display: inline-block;
    text-align: right;
    float: left;
}

.form input {
    display: inline-block;
    text-align: left;
    float: right;
    margin-left: 0px;
}



.box {
    background-color: white;
    color: #1E9EEA;
    border: 2px solid #1E9EEA;
    border-radius: 25px;
    Width :268px;
    Height :40px;
}
.box:hover {
    background-color: #1E9EEA;
    color: white;
}





/*Buttons	*/
.button {
    background-color: #1E9EEA; /* Green */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: solid;
    display: block;
    font-size: 35px;
    margin: 4px 2px;
    transition-duration: 0.9s;
    border-radius: 25px;
    cursor: pointer;
}

.button1 {
    background-color: white;
    color: #1E9EEA;
    border: 2px solid #1E9EEA;
    border-radius: 25px;
    Width :"268px" ;
    Height:"40px";
}

    .button1:hover {
        background-color: #1E9EEA;
        color: white;
    }





    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">






   
      <form id="form1" runat="server">
            
              <div class="divi">
			  <br />
                  <div class="logo">
                  <h1>Hostelistan</h1>
                  </div>
			  <br />
		      <br />
   
	          <div class="form">
           
               <br />
           
               <div class="col">
               <asp:TextBox ID="username" cssclass="textbox" runat="server" placeholder="Username"  ></asp:TextBox>
			   <span class="focus-border"></span>

			   </div>
              
               <br />
			   <div class="col"> <asp:TextBox ID="password" TextMode="Password" cssclass="textbox" runat="server"  placeholder="Password" ></asp:TextBox>   <span class="focus-border"></span> </div><br /><br /></div> 
                  
                
               <div class="centeral"> <asp:Button ID="login" CssClass="button1" runat="server" Text="Login" Width="268px" Height="40px" OnClick="login_Click" />   </div>


			   <div class="centeral"><p><br />  <br /></p> <asp:Button ID="register" CssClass="button1" runat="server" Text="Register" Width="268px" Height="40px" OnClick="register_Click"  />	   </div>
			 
               <br />
               <asp:Label class="centeral" style="color:red; font-family:'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif" ID="Msg" runat="server" Text=" "></asp:Label>
                
               <br />
           
       </div>
    </form>







</asp:Content>
