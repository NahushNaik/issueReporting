<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Form_UserFeedback.aspx.cs" Inherits="pages_Form_UserFeedback" EnableViewState="true" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>



<!DOCTYPE html>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<style type="text/css">
    /* FONTS */
    @media screen {
        @font-face {
          font-family: 'Lato';
          font-style: normal;
          font-weight: 400;
          src: local('Lato Regular'), local('Lato-Regular'), url(https://fonts.gstatic.com/s/lato/v11/qIIYRU-oROkIk8vfvxw6QvesZW2xOQ-xsNqO47m55DA.woff) format('woff');
        }
        
        @font-face {
          font-family: 'Lato';
          font-style: normal;
          font-weight: 700;
          src: local('Lato Bold'), local('Lato-Bold'), url(https://fonts.gstatic.com/s/lato/v11/qdgUG4U09HnJwhYI-uK18wLUuEpTyoUstqEm5AMlJo4.woff) format('woff');
        }
        
        @font-face {
          font-family: 'Lato';
          font-style: italic;
          font-weight: 400;
          src: local('Lato Italic'), local('Lato-Italic'), url(https://fonts.gstatic.com/s/lato/v11/RYyZNoeFgb0l7W3Vu1aSWOvvDin1pK8aKteLpeZ5c0A.woff) format('woff');
        }
        
        @font-face {
          font-family: 'Lato';
          font-style: italic;
          font-weight: 700;
          src: local('Lato Bold Italic'), local('Lato-BoldItalic'), url(https://fonts.gstatic.com/s/lato/v11/HkF_qI1x_noxlxhrhMQYELO3LdcAZYWl9Si6vvxL-qU.woff) format('woff');
        }
    }
    
    /* CLIENT-SPECIFIC STYLES */
    body, table, td, a { -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }
    table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; }
    img { -ms-interpolation-mode: bicubic; }

    /* RESET STYLES */
    img { border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; }
    table { border-collapse: collapse !important; }
    body { height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important; }

    /* iOS BLUE LINKS */
    a[x-apple-data-detectors] {
        color: inherit !important;
        text-decoration: none !important;
        font-size: inherit !important;
        font-family: inherit !important;
        font-weight: inherit !important;
        line-height: inherit !important;
    }
    
    /* MOBILE STYLES */
    @media screen and (max-width:600px){
        h1 {
            font-size: 32px !important;
            line-height: 32px !important;
        }
    }

    /* ANDROID CENTER FIX */
    div[style*="margin: 16px 0;"] { margin: 0 !important; }
</style>



<!-- Currency Master table Style -->

 
<style>
#customers {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #66bb7f;
    color: white;
}
</style>








</head>
<body style="background-color: #f4f4f4; margin: 0 !important; padding: 0 !important;">
    <form runat="server">
<!-- HIDDEN PREHEADER TEXT -->
<div style="display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: 'Lato', Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;">
 Feed Back Form:Adhar System
</div>

<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <!-- LOGO -->
    <tr>
        <td bgcolor="#66BB7F" align="center">
        	<br>

        	
                  </td>
    </tr>
    <!-- HERO -->
    <tr>
        <td bgcolor="#66BB7F" align="center" style="padding: 0px 10px 0px 10px;">
          
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;" >
                <tr>
                    <td bgcolor="#ffffff" align="center" valign="top" style="padding: 40px 20px 20px 20px; border-radius: 4px 4px 0px 0px; color: #111111; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; letter-spacing: 4px; line-height: 48px;">
                    	<img src="http://sanjeevauto.com/wp-content/uploads/2017/05/logo.png" alt="Sanjeev Group">
                    	<br>


                      <h1 style="font-size: 38px; font-weight: 400; margin: 0;">
    <asp:Label ID="lblStatus" runat="server" Text="Your Status" meta:resourcekey="lblStatusResource1"></asp:Label></h1>
                    </td>
                </tr>
            </table>
          
        </td>
    </tr>
    <br>
    <!-- COPY BLOCK -->
    <tr>
        <td bgcolor="#f4f4f4" align="center" style="padding: 0px 10px 0px 10px;">
          
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;" >
              <!-- COPY -->
              <tr>
                <td bgcolor="#ffffff" align="left" style="padding: 20px 30px 40px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;" >
                  <p style="margin: 0;">
        <asp:Label ID="Label1" runat="server" Text="Hello Sir/Ma'am." meta:resourcekey="Label1Resource1"></asp:Label></p>
                      <p style="margin: 0;">
            <asp:Label ID="Label2" runat="server" Text="Please let us know your experience with Aadhar System" meta:resourcekey="Label2Resource1"></asp:Label> </p>
                   
                     

                   


                </td>
              </tr>

                



                      <!-- COPY -->
              <tr>
                <td bgcolor="#ffffff" align="left" style="padding: 0px 30px 40px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;" >
                
                
                 <!-- Currency Master Data  -->
                
                <table id="customers">
                    <tr>
                        <td>
                <asp:Label ID="Label3" runat="server" Text="Ticket Id" meta:resourcekey="Label3Resource1"></asp:Label></td>
                          <td>  <asp:Label ID="lblTktId" runat="server" meta:resourcekey="lblTktIdResource1"></asp:Label>    </td>
                    </tr>
                      <tr>
                        <td>
                        <asp:Label ID="Label4" runat="server" Text="Type" meta:resourcekey="Label4Resource1"></asp:Label></td>
                          <td>  <asp:Label ID="lblTicketType" runat="server" meta:resourcekey="lblTicketTypeResource1"></asp:Label>    </td>
                    </tr>
                       <tr>
                        <td>
                        <asp:Label ID="Label5" runat="server" Text="Application" meta:resourcekey="Label5Resource1"></asp:Label></td>
                          <td>  <asp:Label ID="lblTktApplication" runat="server" meta:resourcekey="lblTktApplicationResource1"></asp:Label>    </td>
                    </tr>
                      <tr>
                        <td>
                        <asp:Label ID="Label6" runat="server" Text="Created Date:" meta:resourcekey="Label6Resource1"></asp:Label></td>
                          <td>  <asp:Label ID="lblCreatedDate" runat="server" meta:resourcekey="lblCreatedDateResource1"></asp:Label>    </td>
                    </tr>
                    <tr>
                        <td>
                        <asp:Label ID="Label7" runat="server" Text="Ticket Details" meta:resourcekey="Label7Resource1"></asp:Label></td>
                          <td>  <asp:Label ID="lblTicketDetails" runat="server" meta:resourcekey="lblTicketDetailsResource1"></asp:Label>    </td>
                    </tr>
                  <tr>
                      <td>
                        <asp:Label ID="Label8" runat="server" Text="FeedBack " meta:resourcekey="Label8Resource1"></asp:Label></td>
                      <td> <asp:DropDownList ID="ddlReasons" Height="100%" width="100%" runat="server" AutoPostBack="false" Enabled="true" meta:resourcekey="ddlReasonsResource1">
                                                
                                              
                                            </asp:DropDownList></td>
   
  </tr>
                      

 
  
</table>

                
                
                
                </td>
              </tr>
              <!-- BULLETPROOF BUTTON -->
              <tr>
                <td bgcolor="#ffffff" align="left">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td bgcolor="#ffffff" align="center" style="padding: 20px 30px 60px 30px;">
                        <table border="0" cellspacing="0" cellpadding="0">
                          <tr>
                              <td align="center" style="border-radius: 3px;" bgcolor="#66BB7F">
                                                <asp:Button ID="btnSendFeedBack" runat="server" Text="Send Feedback" height="50px" Font-Bold="True"   Width="130px" OnClick="btnSendFeedBack_Click" meta:resourcekey="btnSendFeedBackResource1"/></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          
        </td>
    </tr>
  
   
    <!-- SUPPORT CALLOUT -->
    <tr>
        <td bgcolor="#f4f4f4" align="center" style="padding: 30px 10px 0px 10px;">
         
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;" >
             
                <tr>
                  <td bgcolor="#C0EDE0" align="center" style="padding: 30px 30px 30px 30px; border-radius: 4px 4px 4px 4px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;" >
                  
                 <%--   <img src="http://sanjeevauto.com/wp-content/uploads/2017/05/logo.png" alt="sanjeevauto">--%>
                     <img src="images/Aadhaar-3.jpg" style="height:100px"  alt="Aadhar System">
                  </td>
                </tr>
            </table>
          
        </td>
    </tr>
    <!-- FOOTER -->
   
</table>
    </form>
</body>
</html>

