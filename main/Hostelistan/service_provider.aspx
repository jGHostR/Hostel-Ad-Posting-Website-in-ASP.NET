<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="service_provider.aspx.cs" Inherits="Hostelistan.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


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

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                     <hr />
                         
                        <center>
                           <h4>Service Details</h4>
                        </center>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <center>
                        </center>

                     </div>
                  </div>

                   
                     <form id="frm" runat="server">

                   
                  <div class="row">
                     <div class="col">
                         <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                        <hr>
                     </div>
                  </div>
                  
                  <div class="row">
                     <div class="col-md-4">
                        <label>Service ID</label>

                        <div class="form-group">
                           <div class="input-group">
                             
                              <asp:TextBox Cssclass="form-control" ID="TextBox1" runat="server" placeholder="Service ID" ></asp:TextBox>
                                     
                              <asp:Button class="form-control btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                                 
                           </div>
                        </div>
                     </div>
                     <div class="col-md-8">
                        <label>Service Name </label>
                        <div class="form-group">
                             
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Service Name"></asp:TextBox>
                                    
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
                       
                        <label>Service Type</label>
                        <div class="form-group">
                           <asp:DropDownList class="form-control" ID="DropDownList3" runat="server">
                               <asp:ListItem Text="Cooking" Value="Cooking" />
                              <asp:ListItem Text="Laundry" Value="Laundry" />
                               <asp:ListItem Text="Cleaning" Value="Cleaning" />
                              <asp:ListItem Text="Delivery" Value="Delivery" />
                               <asp:ListItem Text="Transport" Value="Transport" />
                              
                           </asp:DropDownList>
                        </div>
                     </div>
                     
                     <div class="col-md-4">
                        <label>Location</label>
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
                     <div class="col-12">
                        <label>Service Description</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="Service Description" TextMode="MultiLine" Rows="2"></asp:TextBox>
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
                           <h4>Service Inventory List</h4>
                        </center>
                     </div>
                  </div>
                   
                  <div class="row">
                     <div class="col">
                        
                     </div>
                  </div>
                  <div class="row">
                      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:hostelistanConnectionString %>>" SelectCommand="SELECT [ServiceID], [ServiceName], [ServiceType], [ServiceCost], [Location], [city], [description] FROM [Services]"></asp:SqlDataSource>
                    <div class="col">
                        
                        <asp:GridView class="table table-striped table-bordered" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ServiceId" >
                           <Columns>
                              <asp:BoundField DataField="ServiceId" HeaderText="ID" ReadOnly="True" SortExpression="ServiceId" >
                                 <ControlStyle Font-Bold="True" />
                                 <ItemStyle Font-Bold="True" />
                              </asp:BoundField>
                              <asp:TemplateField>
                                 <ItemTemplate>
                                    <div class="container-fluid">
                                       <div class="row">
                                          <div class="col-lg-10">
                                             <div class="row">
                                                <div class="col-12">
                                                   <asp:Label ID="Label1"  runat="server" Text='<%# Eval("ServiceName") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   <span>Service Type - </span>
                                                   <asp:Label ID="Label2"  runat="server" Font-Bold="True" Text='<%# Eval("ServiceType") %>'></asp:Label>
                                                   &nbsp;| <span><span>&nbsp;</span>Location - </span>
                                                   <asp:Label ID="Label3"  runat="server" Font-Bold="True" Text='<%# Eval("Location") %>'></asp:Label>
                                                   &nbsp;| 
                                                   <span>
                                                      City -<span>&nbsp;</span>
                                                      <asp:Label ID="Label4"  runat="server" Font-Bold="True" Text='<%# Eval("city") %>'></asp:Label>
                                                   </span>
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                      Description -
                                                   <asp:Label ID="Label6" runat="server" Font-Bold="True" Text='<%# Eval("description") %>'></asp:Label>
                                                  
                                                   
                                                   
                                                </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                     Charges Per Month ( in PKR ) -
                                                   <asp:Label ID="Label5" runat="server" Font-Bold="True" Text='<%# Eval("ServiceCost") %>'></asp:Label>
                                                  
                                                </div>
                                             </div>
                                              <div class="row">
                                                <div class="col-12">

                                               </div>
                                             </div>
                                             <div class="row">
                                                <div class="col-12">
                                                   
                                                </div>
                                             </div>
                                          </div>
                                          <div class="col-lg-2">
                                             
                                          </div>
                                       </div>
                                    </div>
                                 </ItemTemplate>
                              </asp:TemplateField>
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
