<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="pages_User" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   
    <title>User Profile</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyStart" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body1" runat="Server">
    <a class="navbar-brand" href="#">
        <asp:Label ID="Label5" runat="server" Text="User Profile" meta:resourcekey="Label5Resource1"></asp:Label></a>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body2" runat="Server">
     <telerik:RadScriptManager ID="rsm" runat="server"></telerik:RadScriptManager>
        <telerik:RadWindowManager ID="rwm1" runat="server" meta:resourcekey="rwm1Resource1"></telerik:RadWindowManager>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="card">
                        <div class="header">
                            <h4 class="title"> <asp:Label ID="Label6" runat="server" Text="Hi" meta:resourcekey="Label6Resource1"></asp:Label>&nbsp&nbsp<asp:Label ID="lblUserName" runat="server" Text="Welcome" meta:resourcekey="lblUserNameResource1"></asp:Label></h4>

                        </div>
                        <div class="content">
                            <ul class="list-unstyled team-members">
                                <li>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <asp:Label ID="Label7" runat="server" Text="Total Tickets" meta:resourcekey="Label7Resource1"></asp:Label>
														<br />
                                            <span class="text-info"><small>
                                                <asp:Label ID="Label8" runat="server" Text="Created by you" meta:resourcekey="Label8Resource1"></asp:Label></small></span>
                                        </div>

                                        <div class="col-xs-3 text-right">
                                            <asp:LinkButton ID="lblTicketsAll" runat="server" class="btn btn-sm btn-success btn-icon" meta:resourcekey="lblTicketsAllResource1" />

                                            <%--                                        
    
        <asp:Button ID="btnTotalTickets" runat="server" class="btn btn-sm btn-success btn-icon"><h5><asp:Label ID="lblTicketsAll" runat="server"></asp:Label></h5></asp:Button>--%>

                                            <%--                                            <btn class="btn btn-sm btn-success btn-icon"><h5><asp:Label ID="lblTicketsTotal" runat="server"></asp:Label></h5></btn>--%>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <asp:Label ID="Label9" runat="server" Text="Closed Tickets" meta:resourcekey="Label9Resource1"></asp:Label>
														<br />
                                            <span class="text-success"><small>
                                                <asp:Label ID="Label10" runat="server" Text="Solution Provided" meta:resourcekey="Label10Resource1"></asp:Label></small></span>
                                        </div>

                                        <div class="col-xs-3 text-right">
                                            <asp:LinkButton ID="lblTicketsClosed" runat="server" class="btn btn-sm btn-success btn-icon" meta:resourcekey="lblTicketsClosedResource1" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row">
                                        <div class="col-xs-6">
                                            <asp:Label ID="Label11" runat="server" Text="Open" meta:resourcekey="Label11Resource1"></asp:Label>
                                            <br />
                                            <span class="text-danger"><small>
                                                <asp:Label ID="Label12" runat="server" Text="Solution Pending" meta:resourcekey="Label12Resource1"></asp:Label></small></span>
                                        </div>

                                        <div class="col-xs-3 text-right">
                                            <asp:LinkButton ID="lblTicketOpen" runat="server" class="btn btn-sm btn-success btn-icon" meta:resourcekey="lblTicketOpenResource1" />
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
                            <h4 class="title">
                                <asp:Label ID="Label13" runat="server" Text="Edit Profile" meta:resourcekey="Label13Resource1"></asp:Label></h4>
                        </div>
                        <div class="content">
                            <form>
                                <div class="row">
                                    <div class="col-md-7">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">
                                                <asp:Label ID="Label14" runat="server" Text="Email address" meta:resourcekey="Label14Resource1"></asp:Label></label>
                                            <%--                                            <input type="email" class="form-control border-input" disabled placeholder="Sanjeev Group Email">--%>
                                            <asp:TextBox ID="txtEmail" runat="server" class="form-control border-input" disabled placeholder="Sanjeev Group Email" meta:resourcekey="txtEmailResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><asp:Label ID="Label15" runat="server" Text="First Name" meta:resourcekey="Label15Resource1"></asp:Label></label>
                                            
                                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label1Resource1"></asp:Label>
                                            <%--<input type="text" class="form-control border-input" placeholder="First Name">--%>
                                            <asp:TextBox ID="txtFirstName" runat="server" ValidationGroup="check" class="form-control border-input" placeholder="First Name" meta:resourcekey="txtFirstNameResource1"></asp:TextBox>

                                         

                                             <asp:RequiredFieldValidator runat="server" id="reqName" ValidationGroup="check" ForeColor="Red" controltovalidate="txtFirstName" errormessage="Please Enter First Name " meta:resourcekey="reqNameResource1" />


                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label16" runat="server" Text="Last Name" meta:resourcekey="Label16Resource1"></asp:Label></label>
                                            <asp:Label runat="server" ForeColor="Red" Text="*" meta:resourcekey="LabelResource1"></asp:Label>
                                            <%--                 <input type="text" class="form-control border-input" placeholder="Last Name">--%>
                                            <asp:TextBox ID="txtLastName" runat="server" ValidationGroup="check" class="form-control border-input" placeholder="Last Name" meta:resourcekey="txtLastNameResource1"></asp:TextBox>

                                             <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" ValidationGroup="check" ForeColor="Red" controltovalidate="txtLastName" errormessage="Please Enter Last Name " meta:resourcekey="RequiredFieldValidator1Resource1" />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label17" runat="server" Text="Contact Details" meta:resourcekey="Label17Resource1"></asp:Label></label>
                                            <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label2Resource1"></asp:Label>
                                            <%--<input type="text" class="form-control border-input" placeholder="Comma seperated contact details" value="">--%>
                                            <asp:TextBox ID="txtContactDetails" MaxLength="10" runat="server" ValidationGroup="check" class="form-control border-input" placeholder="Contact Details" meta:resourcekey="txtContactDetailsResource1"></asp:TextBox>


                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtContactDetails"
                                                ErrorMessage="Please Enter Only Numbers" ForeColor="Red" Display="Dynamic"
                                                ValidationExpression="^\d+$" ValidationGroup="check" meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>


                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label18" runat="server" Text="Plant" meta:resourcekey="Label18Resource1"></asp:Label></label>
                                            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label3Resource1"></asp:Label>
                                            <%--                                            <input type="text" class="form-control border-input" placeholder="Plant">--%>
                                            <asp:DropDownList ID="DropDownListPlant" runat="server" class="form-control border-input" placeholder="Plant" meta:resourcekey="DropDownListPlantResource1">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label19" runat="server" Text="Plant" meta:resourcekey="Label19Resource1"></asp:Label></label>
                                            <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label4Resource1"></asp:Label>
                                            <asp:DropDownList ID="DropDownListDepartment" runat="server" class="form-control border-input" placeholder="Plant" meta:resourcekey="DropDownListDepartmentResource1">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <label>
                                            <asp:Label ID="Label20" runat="server" Text="Save/Update" meta:resourcekey="Label20Resource1"></asp:Label></label>
                                        <%--                                        <button type="submit" class="btn btn-info btn-fill btn-wd">OK</button>--%>
                                        <asp:Button ID="btnSave" runat="server" Text="OK" ValidationGroup="check" class="btn btn-info btn-fill btn-wd" OnClick="btnSave_Click" meta:resourcekey="btnSaveResource1" />
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

