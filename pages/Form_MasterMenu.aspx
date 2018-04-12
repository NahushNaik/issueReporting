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
    <a class="navbar-brand" href="#">Master Menu</a>
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
                                    <a href="Form_Type_Master.aspx" onclick="skm_LockScreen('We are processing your request...')"  class="btn btn-default btn-login" style="height:64px; background-color:#68B3C8; color:black; width:170px; font-size:25px;" >Type</a>
								</center>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-slice"></i><a href="UserTicketAdd.aspx" style="color: black;" onclick="skm_LockScreen('We are processing your request...')">Type Master</a>

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
                                    <a href="Form_Application_Master.aspx" onclick="skm_LockScreen('We are processing your request...')"  class="btn btn-default btn-login" style="height:64px; background-color:#68B3C8; color:black; width:170px; font-size:25px;" >Application</a>
								</center>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-slice"></i><a href="UserTicketAdd.aspx" style="color: black;" onclick="skm_LockScreen('We are processing your request...')">Application Master</a>

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
                                    <a href="Form_Issue_Master.aspx" onclick="skm_LockScreen('We are processing your request...')"  class="btn btn-default btn-login" style="height:64px; background-color:#68B3C8; color:black; width:170px; font-size:25px;" >Issue</a>
								</center>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-slice"></i><a href="UserTicketAdd.aspx" style="color: black;" onclick="skm_LockScreen('We are processing your request...')">Issue Master</a>

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
                                    <a href="Form_Department_Master.aspx" onclick="skm_LockScreen('We are processing your request...')"  class="btn btn-default btn-login" style="height:64px; background-color:#68B3C8; color:black; width:170px; font-size:25px;" >Department</a>
								</center>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-slice"></i><a href="UserTicketAdd.aspx" style="color: black;" onclick="skm_LockScreen('We are processing your request...')">Department Master</a>

                                </div>
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
                                    <a href="Form_User_Master.aspx" onclick="skm_LockScreen('We are processing your request...')"  class="btn btn-default btn-login" style="height:64px; background-color:#68B3C8; color:black; width:170px; font-size:25px;" >User</a>
								</center>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-slice"></i><a href="UserTicketAdd.aspx" style="color: black;" onclick="skm_LockScreen('We are processing your request...')">User Master</a>

                                </div>
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

