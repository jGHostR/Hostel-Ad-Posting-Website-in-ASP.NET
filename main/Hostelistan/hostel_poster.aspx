<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="hostel_poster.aspx.cs" Inherits="Hostelistan.WebForm4" %>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });

       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };

               reader.readAsDataURL(input.files[0]);
           }
       }

   </script>

    <style type="text/css">

        .row {
    margin-right: -15px;
    margin-left: -15px;
    margin-top: 25px;
}


        .useremail{
     margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins',sans-serif;
}
        }
    </style>

</asp:Content>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <nav>
        <div class="menu">
            <div class="logo">
                <a href="#">Hostelistan</a>
            </div>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="login.aspx">Logout</a></li>
                <li><a href="contactus.aspx">Contact Us</a></li>
            </ul>
        </div>

    </nav>

    <div class="container-fluid">
        <div class="useremail">
            <h1>Email:</h1>
                                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>

                            </div>
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                     <hr />
                         
                        <center>
                           <h4>Hostel Details</h4>
                        </center>
                     </div>
                  </div>
                  
                     <form id="frm" runat="server">
                  <div class="row">
                     <div class="col">
                        <center>
                           <img id="imgview" Height="150" Width="100" src="estate.jpg" />
                            
&nbsp;</center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                         <asp:FileUpload ID="FileUpload1" runat="server" />
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Hostel ID</label>

                        <div class="form-group">
                           <div class="input-group">
                             
                              <asp:TextBox Cssclass="form-control" ID="TextBox1" runat="server" placeholder="Hostel ID" ></asp:TextBox>
                                     
                              <asp:Button class="form-control btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                                 
                           </div>
                        </div>
                     </div>
                     <div class="col-md-8">
                        <label>Hostel Name </label>
                        <div class="form-group">
                             
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Hostel Name"></asp:TextBox>
                                    
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Select City</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList1" runat="server">
                              <asp:ListItem Text="Lahore" Value="Lahore" />
                              <asp:ListItem Text="Islamabad" Value="Islamabad" />
                              <asp:ListItem Text="Karachi" Value="Karachi" />
                           </asp:DropDownList>
                        </div>
                       
                        <label>Hostel Type</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                               <asp:ListItem Text="Room" Value="Room" />
                              <asp:ListItem Text="Flat" Value="Flat" />
                           </asp:DropDownList>
                        </div>
                     </div>
                     
                     <div class="col-md-4">
                        <label>Hostel Address</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList4" runat="server">
                              <asp:ListItem Text="Johar Town" Value="Johar Town" />
                              <asp:ListItem Text="Wapda Town" Value="Wapda Town" />
                              <asp:ListItem Text="Satelite Town" Value="Satelite Town" />
                              <asp:ListItem Text="North Nazimabad" Value="North Nazimabad" />
                           </asp:DropDownList>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     
                     <div class="col-md-4">
                        <label>Cost(per month)</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Cost(per month)" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                   
                  </div>
                  <div class="row">
                     <div class="col-md-4">
                        <label>Actual Capacity</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Actual Capacity" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Current Capacity</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Current Capacity" TextMode="Number" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-4">
                        <label>Issued Rooms</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Rooms" TextMode="Number" ReadOnly="True"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>Hostel Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Hostel Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button1_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button2_Click" />
                     </div>
                  </div>
               </div>
            </div>
            
            <a href="WebForm1.aspx"><< Back to Home</a><br>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                           
                     <div class="col">
                         <hr />
                         <hr />
                          
                        <center>
                           <h4>Hostel Inventory List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        
                     </div>
                  </div>
                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hostelistanConnectionString %>" SelectCommand="SELECT [Hostel_Id], [Name], [Type], [city], [Location], [No_of_Rooms], [cost] FROM [Hostel]"></asp:SqlDataSource>
                     <div class="col">
                        
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Hostel_Id">
                           <Columns>
                              <asp:BoundField DataField="Hostel_Id" HeaderText="Hostel_Id" ReadOnly="True" SortExpression="Hostel_Id" >
                              </asp:BoundField>
                               <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                               <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                               <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                               <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                               <asp:BoundField DataField="No_of_Rooms" HeaderText="No_of_Rooms" SortExpression="No_of_Rooms" />
                               <asp:BoundField DataField="cost" HeaderText="cost" SortExpression="cost" />
                           </Columns>
                        </asp:GridView>
                        </form>
                     </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   
</asp:Content>
