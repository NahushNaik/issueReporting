<%@ Page Language="C#" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="pages_error" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Oops</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server" Width="79%" meta:resourcekey="Panel1Resource1">
                <table style="width: 58%;" frame="box">
                    <tr>
                        <td>&nbsp;
                        </td>
                        <td>&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td align="left">&nbsp;
                        </td>
                        <td>
                            <br />
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Not an Authenticated User" meta:resourcekey="Label2Resource1"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Button ID="Button1" runat="server" CssClass="Buttons_Blue" Text="Back to Home" OnClick="Button1_Click" meta:resourcekey="Button1Resource1" />
                            <asp:Button ID="Button2" runat="server" CssClass="Buttons_Blue" Text="Back to Previous Page" OnClick="Button2_Click" meta:resourcekey="Button2Resource1" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
