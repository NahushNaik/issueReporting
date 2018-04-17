<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="userDetails_FeedbackForm.aspx.cs" Inherits="pages_userDetails_FeedbackForm"  EnableViewState="true" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>


<!DOCTYPE html>
<html>
<head>
<title>Feedback</title>



      <!--THEME CODE START-->
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <!--THEME CODE END-->

   

    <!--THEME CODE START-->
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
   

    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet" />

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet" />

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />

 <%--   <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
    <link href="assets/css/themify-icons.css" rel="stylesheet">
    <!--THEME CODE END-->--%>

    <!-- Visavail.js style -->
  <%--  <link href='https://fonts.googleapis.com/css?family=Muli' rel='stylesheet' type='text/css'> --%>
    <link href='visavail/css/visavail.css' rel='stylesheet' type='text/css'>

    <!-- font-awesome -->
    <link href='font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'>

    <!-- body style for this example -->
   <%-- <style>
        body {
            font-family: "Muli", "Helvetica", Arial, sans-serif;
        }
    </style>--%>














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
    <style type=”text/css”> 
.normalRow
{
background-color: #FCFCFC;
}
.alternateRow
{
background-color: #ECECEC;
}
        </style>
    

    <%--<style>
        #repeater th, td {
   
}
   #repeater th, td {
    padding: 5px;
    text-align: left;    
}
    </style>--%>



     <%-- <script type="text/javascript">
          function DisableButton() {
              document.getElementById("<%=btnSendFeedBack.ClientID %>").disabled = true;
       

            $('#loading').show();


        }
        window.onbeforeunload = DisableButton;

    </script>--%>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <script type='text/javascript' src="../Scripts/jquery-1.4.1.min.js"></script>
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.maskedinput.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%= btnSendFeedBack.ClientID %>").click(function () {
                debugger;
                if (Page_IsValid == true) {

                    $('#loading').show();

                    return true;
                }
                else {
                    return false;
                }
            });
        });

    </script>

</head>
<body style="background-color: #f4f4f4; margin: 0 !important; padding: 0 !important;">
    <form id="Form1" runat="server">
         <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>
<!-- HIDDEN PREHEADER TEXT -->




           <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle">
                                <span class="sr-only">
                                    <asp:Label ID="Label1" runat="server" Text="Toggle navigation" meta:resourcekey="Label1Resource1"></asp:Label></span>
                                <span class="icon-bar bar1"></span>
                                <span class="icon-bar bar2"></span>
                                <span class="icon-bar bar3"></span>
                            </button>
                          <%--  <a class="navbar-brand" href="#" style="color: black;">Feedback form</a>--%>
                            <img src="images/Aadhaar-3.jpg" style="height:73px;float: inline-end;margin-left: -22px;"  alt="Aadhar System">
                        </div>
                        <div class="collapse navbar-collapse">
                            <ul class="nav navbar-nav navbar-right">
                                <li>
                                    
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" style="padding-top: 0 !important; padding-bottom: 0 !important;">
                                        <!--<i class="ti-panel"></i>-->
                                       
                                        <p>
                                            <a id="A1" runat="server" href="http://59.165.153.132:92/portalapp/frmmainpage.aspx">
                                            <img alt="Sanjeev Group" src="http://sanjeevauto.com/wp-content/uploads/2017/05/logo.png" /></a>
                                        </p>
                                    </a>
                                </li>

                           
                            </ul>

                        </div>
                    </div>
                </nav>







<%--<div style="display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: 'Lato', Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;">
 Feed Back Form:Adhar System
</div>--%>

<table border="0" cellpadding="0" cellspacing="0" width="100%" style="margin-top: -40px;">
    <!-- LOGO -->
   
    <tr>
        <td bgcolor="#66BB7F" align="center" style="padding: 0px 10px 0px 10px;">
          
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;" >
                <tr>
                    <td bgcolor="#ffffff" align="center" valign="top" style="padding: 40px 20px 20px 20px; border-radius: 4px 4px 0px 0px; color: #111111; font-family: 'lato', helvetica, arial, sans-serif; font-size: 48px; font-weight: 400; letter-spacing: 4px; line-height: 48px;">
                    	<%--<img src="http://sanjeevauto.com/wp-content/uploads/2017/05/logo.png" alt="sanjeev group" style="float: inline-start;width: 45%;margin-top:15px">--%>
                       <center> <B style="margin-left: 60PX;"><asp:Label ID="Label3" runat="server" Text="Feedback" meta:resourcekey="Label3Resource1"></asp:Label></B></center>
                            <center> <asp:Image ID="statusImg" style="margin-left: 50px;" runat="server" meta:resourcekey="statusImgResource1"></asp:Image>  </center>
                    	<br>


                   
                    </td>
                     <td bgcolor="#ffffff" align="center" valign="top" style="padding: 40px 20px 20px 20px; border-radius: 4px 4px 0px 0px; color: #111111; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; letter-spacing: 4px; line-height: 48px;">
                    	<%-- <img src="images/Aadhaar-3.jpg" style="height:65px;float: inline-end;"  alt="Aadhar System">--%>
                    	<br>


                      
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

                      <p style="margin: 0;color:red">
                    <asp:Label ID="lblFeedback" runat="server" Visible="False" Text="Your Feedback is already submitted." meta:resourcekey="lblFeedbackResource1"></asp:Label></p>
                  <p style="margin: 0;">
                        <asp:Label ID="Label5" runat="server" Text="Hello Sir/Ma'am." meta:resourcekey="Label5Resource1"></asp:Label></p>
                      <p style="margin: 0;">
                            <asp:Label ID="Label6" runat="server" Text="Please let us know your experience with Aadhar System " meta:resourcekey="Label6Resource1"></asp:Label></p>
                   
                    

                   


                </td>
                  
              </tr>
                <tr >
                     
                    <td bgcolor="#ffffff" align="left" style="padding: 20px 30px 10px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
                          <p style="font-size:20px">
                        <asp:Label ID="Label7" runat="server" Text="Give us your valuable feedback " meta:resourcekey="Label7Resource1"></asp:Label></p>
                    <asp:DropDownList ID="ddlReasons"  runat="server" style="width: 100%;height: 50px;" meta:resourcekey="ddlReasonsResource1">
                                                
                                              
                                            </asp:DropDownList>
                        </td>
                </tr>
               <tr style="background: white;">
                   <td>
                         <center style="padding-bottom:10px"  ><asp:Button ID="btnSendFeedBack" runat="server" Text="Send Feedback" height="50px" Font-Bold="True" OnClick="btnSendFeedBack_Click" meta:resourcekey="btnSendFeedBackResource1"  /></center>
                   </td>
               </tr>

                
                <br />


                      <!-- COPY -->
              <tr>
                <td bgcolor="#ffffff" align="left" style="padding: 0px 30px 40px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;" >
                
                
              <telerik:RadTabStrip SelectedIndex="0" ID="tabStrip" MultiPageID="RadMultiPage1" runat="server"  Skin="Silk" meta:resourcekey="tabStripResource1">
                                        <Tabs>
                <telerik:RadTab Text="Ticket Details" meta:resourcekey="RadTabResource1" ></telerik:RadTab>
               <telerik:RadTab Text="Ticket Updates" meta:resourcekey="RadTabResource2" ></telerik:RadTab>
                 <telerik:RadTab Text="Ticket Comments" meta:resourcekey="RadTabResource3"></telerik:RadTab>

            </Tabs>
                                    </telerik:RadTabStrip>
                                    <telerik:RadMultiPage ID="RadMultiPage1"  SelectedIndex="0" runat="server" meta:resourcekey="RadMultiPage1Resource1">
                                        <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourceKey="RadPageView1Resource1" Selected="True">
                                            <br />
                                               <table id="customers">
                    <tr>
                        <td>
                                                   <asp:Label ID="Label8" runat="server" Text="Ticket Id" meta:resourceKey="Label8Resource1"></asp:Label>
                        </td>
                          <td>  <asp:Label ID="lblTktId" runat="server" meta:resourceKey="lblTktIdResource1"></asp:Label>    </td>
                    </tr>
                      <tr>
                        <td><asp:Label ID="Label9" runat="server" Text="Type" meta:resourceKey="Label9Resource1"></asp:Label></td>
                          <td>  <asp:Label ID="lblTicketType" runat="server" meta:resourceKey="lblTicketTypeResource1"></asp:Label>    </td>
                    </tr>
                       <tr>
                        <td><asp:Label ID="Label10" runat="server" Text="Application" meta:resourceKey="Label10Resource1"></asp:Label></td>
                          <td>  <asp:Label ID="lblTktApplication" runat="server" meta:resourceKey="lblTktApplicationResource1"></asp:Label>    </td>
                    </tr>
                      <tr>
                        <td><asp:Label ID="Label11" runat="server" Text="Created Date:" meta:resourceKey="Label11Resource1"></asp:Label></td>
                          <td>  <asp:Label ID="lblCreatedDate" runat="server" meta:resourceKey="lblCreatedDateResource1"></asp:Label>    </td>
                    </tr>
                    <tr>
                        <td><asp:Label ID="Label12" runat="server" Text="Ticket Details" meta:resourceKey="Label12Resource1"></asp:Label></td>
                          <td>  <asp:Label ID="lblTicketDetails" runat="server" meta:resourceKey="lblTicketDetailsResource1"></asp:Label>    </td>
                    </tr>
                

 
  
</table>
                                            

                                        </telerik:RadPageView>
                                          <telerik:RadPageView ID="RadPageView2" runat="server" meta:resourceKey="RadPageView2Resource1">
              <br />
                                               <div >
                                                <telerik:radgrid id="rgTicketLogs" runat="server" allowfilteringbycolumn="True" AutoGenerateColumns="False"  OnNeedDataSource="rgTicketLogs_NeedDataSource" Skin="Simple"  cellspacing="-1" gridlines="Both" AllowPaging="True" meta:resourceKey="rgTicketLogsResource1" >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="False"></GroupingSettings>
                                                <ExportSettings ExportOnlyData="True" IgnorePaging="True" FileName="Update Ticket Log Report" > 
                                                    <Excel Format="ExcelML" />
                                                    </ExportSettings>
                                                    <AlternatingItemStyle BackColor="LightGray" />
                                                    <MasterTableView CommandItemDisplay="Top">
                                                        <CommandItemSettings ShowAddNewRecordButton="False" ShowExportToExcelButton="True" ShowRefreshButton="False" />
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Ticket_Id" FilterControlAltText="Filter Ticket_Id column" HeaderText="Ticket Id" meta:resourceKey="GridBoundColumnResource1" UniqueName="Ticket_Id" Visible="False">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="AuditAction" FilterControlAltText="Filter AuditAction column" FilterControlWidth="100px" HeaderText="Action" meta:resourceKey="GridBoundColumnResource2" UniqueName="AuditAction">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridDateTimeColumn DataField="AuditDate" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" EnableTimeIndependentFiltering="True" FilterControlAltText="Filter AuditDate column" FilterControlWidth="100px" HeaderText="Action Time" meta:resourceKey="GridDateTimeColumnResource1" SortExpression="AuditDate" UniqueName="AuditDate">
                                                            </telerik:GridDateTimeColumn>
                                                            <telerik:GridBoundColumn DataField="Type_Name" FilterControlAltText="Filter Type_Name column" HeaderText="Type" meta:resourceKey="GridBoundColumnResource3" UniqueName="Type_Name">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Application_Name" FilterControlAltText="Filter Application_Name column" HeaderText="Application" meta:resourceKey="GridBoundColumnResource4" UniqueName="Application_Name">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Issue_Name" FilterControlAltText="Filter Issue_Name column" HeaderText="Issue Name" meta:resourceKey="GridBoundColumnResource5" UniqueName="Issue_Name">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridDateTimeColumn DataField="Created_Time" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" EnableTimeIndependentFiltering="True" FilterControlAltText="Filter Created_Time column" FilterControlWidth="100px" HeaderText="Created Time" meta:resourceKey="GridDateTimeColumnResource2" SortExpression="Date_of_PITCH_Validation" UniqueName="Created_Time">
                                                            </telerik:GridDateTimeColumn>
                                                            <telerik:GridDateTimeColumn DataField="Updated_Time" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" EnableTimeIndependentFiltering="True" FilterControlAltText="Filter Updated_Time column" FilterControlWidth="100px" HeaderText="closing Time" meta:resourceKey="GridDateTimeColumnResource3" SortExpression="Updated_Time" UniqueName="Updated_Time">
                                                            </telerik:GridDateTimeColumn>
                                                            <telerik:GridBoundColumn DataField="User_Email" FilterControlAltText="Filter User_Email column" HeaderText="Ticket Owner" meta:resourceKey="GridBoundColumnResource6" UniqueName="User_Email" Visible="False">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                    <FilterItemStyle CssClass="text-center" />
                                                    <ActiveItemStyle Wrap="True" />
                                                    <ItemStyle BackColor="LightGray" />


                                        </telerik:radgrid>



                                        
                
                    </div>
                                          </telerik:RadPageView>
                                        <telerik:RadPageView ID="RadPageView3" runat="server" meta:resourceKey="RadPageView3Resource1">
              <br />
                                               <div  >
                                      

   <asp:Repeater ID="Repeater1" runat="server"  OnItemDataBound="Repeater1_ItemDataBound" OnItemCreated="Repeater1_ItemCreated">
       
         
                                    <ItemTemplate>
<div id="cmntDiv" runat="server" >
                                     <table runat="server" id="tblRep"   style="width:100%; border: 1px solid black;
    border-collapse: inherit;">
  <tr runat="server" ID="Tr1" style="background-color: #ebe387;">
    <td runat="server" ><asp:Label ID="userName" runat="server" Font-Bold="True" ForeColor="Black" Text='<%# Eval("isAdmin") %>'></asp:Label></td>
    <td runat="server" > <asp:Label ID="Label2" runat="server"  ForeColor="Black" Text='<%# Eval("Created_Datetime") %>'></asp:Label></td>
  </tr>
  <tr runat="server" ID="Tr2" style="background-color: #ebe387;">
    <td  colspan="4" runat="server">  <asp:Label ID="Label4" Font-Bold="True" ForeColor="Black" runat="server" Text='<%# Eval("Comment") %>'></asp:Label></td>
  
  </tr>
</table>
    </div>
                                        <br />

                                    

                                    </ItemTemplate>
                                </asp:Repeater>
    
 <div class="col-md-12">
                                    <div class="form-group">

                                        <div style="overflow: hidden;">
                                            <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnPage"
                                                        Style="padding: 8px; margin: 2px; background: #007acc; border: solid 1px blue; font: 8px;"
                                                        CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                                        runat="server" ForeColor="White" Font-Bold="True" CausesValidation="False" meta:resourceKey="btnPageResource1"><%# Container.DataItem %></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                                        
                
                    </div>
                                          </telerik:RadPageView>
                                         
                                    </telerik:RadMultiPage>
                
                

                
                
                
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
                                  
                                               </td>
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
   <%-- <tr>
        <td bgcolor="#f4f4f4" align="center" style="padding: 30px 10px 0px 10px;">
         
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;" >
             
                <tr>
                  <td bgcolor="#C0EDE0" align="center" style="padding: 30px 30px 30px 30px; border-radius: 4px 4px 4px 4px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;" >
                  
              
                  </td>
                </tr>
            </table>
          
        </td>
    </tr>--%>
    <!-- FOOTER -->
   
</table>
    </form>
      <style type="text/css">
        #page
        {
            display: block;
        }

        #loading
        {
            display: none;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 100;
            width: 100%;
            height: 100%;
            background-color: rgba(255, 255, 255, 0.5);
            background-image: url('../pages/images/ajax-loader.gif');
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>
    <div id="loading"></div>
</body>
</html>


