<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="Form_MasterMenu.aspx.cs" Inherits="pages_Form_MasterMenu" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Master Menu</title>
    <script src="style/d3.v3.min.js" language="JavaScript"></script>
    <script src="style/liquidFillGauge.js" language="JavaScript"></script>
    <style>
        .liquidFillGaugeText
        {
            font-family: Helvetica;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyStart" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body1" runat="Server">
    <a class="navbar-brand" href="#">
    <asp:Label ID="Label2" runat="server" Text="Master Menu" meta:resourcekey="Label2Resource1"></asp:Label>
    </a>
&nbsp;
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body2" runat="Server">
    
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <center> 
                                    <a href="Form_Type_Master.aspx" onclick="skm_LockScreen('We are processing your request...')"  class="btn btn-default btn-login" style="height:64px; background-color:#68B3C8; color:black; width:170px; font-size:25px;" >
                                    <asp:Label ID="Label1" runat="server" Text="Type" meta:resourcekey="Label1Resource1"></asp:Label>
                                    </a>
								&nbsp;</center>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-slice"></i><a href="UserTicketAdd.aspx" style="color: black;" onclick="skm_LockScreen('We are processing your request...')">
                                        <asp:Label ID="Label3" runat="server" Text="Type Master" meta:resourcekey="Label3Resource1"></asp:Label></a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <center> 
                                    <a href="Form_Application_Master.aspx" onclick="skm_LockScreen('We are processing your request...')"  class="btn btn-default btn-login" style="height:64px; background-color:#68B3C8; color:black; width:170px; font-size:25px;" >
                                    <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="Application"></asp:Label>
                                    </a>&nbsp;</center>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-slice"></i><a href="UserTicketAdd.aspx" style="color: black;" onclick="skm_LockScreen('We are processing your request...')">
                                    <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="Application Master"></asp:Label>
                                    </a>&nbsp;</div>
                            </div>
                        </div>
                    </div>
                </div>
                  <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <center> 
                                    <a href="Form_Issue_Master.aspx" onclick="skm_LockScreen('We are processing your request...')"  class="btn btn-default btn-login" style="height:64px; background-color:#68B3C8; color:black; width:170px; font-size:25px;" >
                                    <asp:Label ID="Label11" runat="server" meta:resourcekey="Label11Resource1" Text="Issue"></asp:Label>
                                    </a>
								&nbsp;</center>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-slice"></i><a href="UserTicketAdd.aspx" style="color: black;" onclick="skm_LockScreen('We are processing your request...')">
                                    <asp:Label ID="Label6" runat="server" meta:resourcekey="Label6Resource1" Text="Issue Master"></asp:Label>
                                    </a>&nbsp;</div>
                            </div>
                        </div>
                    </div>
                </div>
                  <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <center> 
                                    <a href="Form_Department_Master.aspx" onclick="skm_LockScreen('We are processing your request...')"  class="btn btn-default btn-login" style="height:64px; background-color:#68B3C8; color:black; width:170px; font-size:25px;" >
                                    <asp:Label ID="Label10" runat="server" meta:resourcekey="Label10Resource1" Text="Department"></asp:Label>
                                    </a>
								&nbsp;</center>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-slice"></i><a href="UserTicketAdd.aspx" style="color: black;" onclick="skm_LockScreen('We are processing your request...')">
                                    <asp:Label ID="Label7" runat="server" meta:resourcekey="Label7Resource1" Text="Department Master"></asp:Label>
                                    </a>&nbsp;</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

               <div class="row">
              
                <div class="col-lg-3 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <center> 
                                    <a href="Form_User_Master.aspx" onclick="skm_LockScreen('We are processing your request...')"  class="btn btn-default btn-login" style="height:64px; background-color:#68B3C8; color:black; width:170px; font-size:25px;" >
                                    <asp:Label ID="Label9" runat="server" meta:resourcekey="Label9Resource1" Text="User"></asp:Label>
                                    </a>
								&nbsp;</center>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-slice"></i><a href="UserTicketAdd.aspx" style="color: black;" onclick="skm_LockScreen('We are processing your request...')">
                                    <asp:Label ID="Label8" runat="server" meta:resourcekey="Label8Resource1" Text="User Master"></asp:Label>
                                    </a>&nbsp;</div>
                            </div>
                        </div>
                    </div>
                </div>
              
            </div>
       
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

