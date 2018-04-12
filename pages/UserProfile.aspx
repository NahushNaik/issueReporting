<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="pages_User" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   
    <title>User Profile</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyStart" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body1" runat="Server">
    <a class="navbar-brand" href="#">User Profile</a>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body2" runat="Server">
     <telerik:RadScriptManager ID="rsm" runat="server"></telerik:RadScriptManager>
        <telerik:RadWindowManager ID="rwm1" runat="server"></telerik:RadWindowManager>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">Hi&nbsp&nbsp<asp:Label ID="lblUserName" runat="server" Text="Welcome"></asp:Label></h4>

                        </div>
                        <div class="content">
                            <ul class="list-unstyled team-members">
                                <li>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            Total Tickets
														<br />
                                            <span class="text-info"><small>Created by you</small></span>
                                        </div>

                                        <div class="col-xs-3 text-right">
                                            <asp:LinkButton ID="lblTicketsAll" runat="server" class="btn btn-sm btn-success btn-icon" />

                                            <%--                                        
    
        <asp:Button ID="btnTotalTickets" runat="server" class="btn btn-sm btn-success btn-icon"><h5><asp:Label ID="lblTicketsAll" runat="server"></asp:Label></h5></asp:Button>--%>

                                            <%--                                            <btn class="btn btn-sm btn-success btn-icon"><h5><asp:Label ID="lblTicketsTotal" runat="server"></asp:Label></h5></btn>--%>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            Closed Tickets
														<br />
                                            <span class="text-success"><small>Solution Provided</small></span>
                                        </div>

                                        <div class="col-xs-3 text-right">
                                            <asp:LinkButton ID="lblTicketsClosed" runat="server" class="btn btn-sm btn-success btn-icon" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            Open 
                                            <br />
                                            <span class="text-danger"><small>Solution Pending</small></span>
                                        </div>

                                        <div class="col-xs-3 text-right">
                                            <asp:LinkButton ID="lblTicketOpen" runat="server" class="btn btn-sm btn-success btn-icon" />
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">Edit Profile</h4>
                        </div>
                        <div class="content">
                            <form>
                                <div class="row">
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <%--                                            <input type="email" class="form-control border-input" disabled placeholder="Sanjeev Group Email">--%>
                                            <asp:TextBox ID="txtEmail" runat="server" class="form-control border-input" disabled placeholder="Sanjeev Group Email"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>First Name</label>
                                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <%--<input type="text" class="form-control border-input" placeholder="First Name">--%>
                                            <asp:TextBox ID="txtFirstName" runat="server" ValidationGroup="check" class="form-control border-input" placeholder="First Name"></asp:TextBox>

                                         

                                             <asp:RequiredFieldValidator runat="server" id="reqName" ValidationGroup="check" ForeColor="Red" controltovalidate="txtFirstName" errormessage="Please Enter First Name " />


                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Last Name</label>
                                            <asp:Label runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <%--                 <input type="text" class="form-control border-input" placeholder="Last Name">--%>
                                            <asp:TextBox ID="txtLastName" runat="server" ValidationGroup="check" class="form-control border-input" placeholder="Last Name"></asp:TextBox>

                                             <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ValidationGroup="check" ForeColor="Red" controltovalidate="txtLastName" errormessage="Please Enter Last Name " />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Contact Details</label>
                                            <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <%--<input type="text" class="form-control border-input" placeholder="Comma seperated contact details" value="">--%>
                                            <asp:TextBox ID="txtContactDetails" MaxLength="10" runat="server" ValidationGroup="check" class="form-control border-input" placeholder="Contact Details"></asp:TextBox>


                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtContactDetails"
                                                ErrorMessage="Please Enter Only Numbers" ForeColor="Red" Display="Dynamic"
                                                ValidationExpression="^\d+$" ValidationGroup="check"></asp:RegularExpressionValidator>


                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Plant</label>
                                            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <%--                                            <input type="text" class="form-control border-input" placeholder="Plant">--%>
                                            <asp:DropDownList ID="DropDownListPlant" runat="server" class="form-control border-input" placeholder="Plant">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>Department</label>
                                            <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <asp:DropDownList ID="DropDownListDepartment" runat="server" class="form-control border-input" placeholder="Plant">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <label>Save/Update</label>
                                        <%--                                        <button type="submit" class="btn btn-info btn-fill btn-wd">OK</button>--%>
                                        <asp:Button ID="btnSave" runat="server" Text="OK" ValidationGroup="check" class="btn btn-info btn-fill btn-wd" OnClick="btnSave_Click" />
                                    </div>
                                    <div class="clearfix"></div>
                            </form>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
    
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

