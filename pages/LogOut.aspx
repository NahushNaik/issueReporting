<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogOut.aspx.cs" Inherits="pages_LogOut" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Thank You</title>
    <script type="text/javascript">
        window.history.forward();
        function noBack() { window.history.forward(); }
</script>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
    onunload="">
    <form id="form1" runat="server">
        <div >
            <p>

                <asp:Label ID="Label1" runat="server" Text="You have successfully logged out." meta:resourcekey="Label1Resource1"></asp:Label>
            </p>
            <h3>
            <asp:Label ID="Label2" runat="server" Text="Thank You for using AADHAR system." meta:resourcekey="Label2Resource1"></asp:Label></h3>
        <br />
           <asp:Button ID="btnLogin" runat="server" Text="Login Again..." OnClick="btnLogin_Click" meta:resourcekey="btnLoginResource1" />
        </div>
    </form>
</body>
</html>
