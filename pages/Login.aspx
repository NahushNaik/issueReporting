<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <style>
        body {
            padding-top: 60px;
        }
    </style>
    <link href="bootstrap3/css/bootstrap.css" rel="stylesheet" />
    <link href="style/login-register.css" rel="stylesheet" />
    <link href="style/font-awesome.css" rel="stylesheet" />
    <script src="jquery/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="bootstrap3/js/bootstrap.js" type="text/javascript"></script>
    <script src="style/login-register.js" type="text/javascript"></script>
    <title>Login</title>
</head>
<%--    <body style="background-image:url(images/ticketbackground2.jpg); width: 100%; height: 100%;">--%>
<body style="background-color:#929292 !important;">
    <form id="form1" runat="server">
        <div class="container">
            <div class="login" id="loginModal">
                <div class="modal-dialog login animated">
                    <div class="modal-content">
                       <%-- <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>--%>
                        <div class="modal-body">
                            <div class="box">
                                <div class="content">
                                    <div class="social">
                                        <img src="images/Aadhaar-3.jpg" height="120px" alt="X" width="150px" />
                                    </div>
                                    <div class="error">
                                        
                                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="login" />
                                        <asp:Label ID="lblError" runat="server" Text="Invalid user name or password..." Visible="false"></asp:Label>
                                    </div>
                                    <div class="form loginBox">
                                        <asp:TextBox ID="txtUsername" class="form-control" runat="server" placeholder="Email@sanjeevgroup.com" ValidationGroup="login" > </asp:TextBox>  <label></label>
                                        <asp:Label  Text="@sanjeevgroup.com" runat="server" ForeColor="Red" ></asp:Label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="Enter Valid Email" ForeColor="#FF3300" ValidationGroup="login">*</asp:RequiredFieldValidator>
                                      
                                        <asp:TextBox ID="txtPassword" runat="server" class="form-control" type="password" placeholder="Password" ValidationGroup="login"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Valid Password" Display="Dynamic" ControlToValidate="txtPassword" ForeColor="#FF3300" ValidationGroup="login">*</asp:RequiredFieldValidator>
                                        <asp:Button ID="LoginButton" runat="server" Text="Login" class="btn btn-default btn-login" ValidationGroup="login" OnClick="LoginButton_Click" />
                                         <br />
                                         <asp:CheckBox style="margin-right:10px" ID="checkBoxAdmin" runat="server"  Text="  Admin?" OnCheckedChanged="checkBoxAdmin_CheckedChanged"  AutoPostBack="false"   Font-Names="Serif"       Font-Size="Large"   />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="forgot login-footer">
                                <span>
                                    <a href="javascript: showRegisterForm();"></a>
                                    <asp:Label ID="lblBuildId" runat="server" Text="Label"></asp:Label></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
