<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form_DummyTypeWiseDrillDown_View.aspx.cs" Inherits="pages_form_DummyTypeWiseDrillDown_View" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Issue Reporting</title>
    <meta charset="utf-8" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <!-- Bootstrap core CSS     -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Animation library for notifications   -->
    <link href="assets/css/animate.min.css" rel="stylesheet" />

    <!--  Paper Dashboard core CSS    -->
    <link href="assets/css/paper-dashboard.css" rel="stylesheet" />


    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="assets/css/demo.css" rel="stylesheet" />


    <!--  Fonts and icons     -->
    <link href="style/font-awesome.min.css" rel="stylesheet" />
    <link href="style/css.css" rel="stylesheet" />
    <link href="assets/css/themify-icons.css" rel="stylesheet" />

    <style type="text/css">
        .LockOff {
            display: none;
            visibility: hidden;
        }

        .LockOn {
            display: block;
            visibility: visible;
            position: absolute;
            z-index: 999;
            top: 0px;
            left: 0px;
            width: 105%;
            height: 105%;
            background-color: #ccc;
            color: black;
            font-weight: bold;
            font-size: 100%;
            text-align: center;
            padding-top: 20%;
            filter: alpha(opacity=75);
            opacity: 0.75;
        }
    </style>

    <script type="text/javascript">
        function skm_LockScreen(str) {
            var lock = document.getElementById('skm_LockPane');
            if (lock)
                lock.className = 'LockOn';

            lock.innerHTML = str;
        }
    </script>
    <style>
                 #operator,#averageTable {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#operator td, #operator th,#averageTable td,#averageTable th {
    border: 1px solid #000000;
    padding: 5px;
}

            #operator td,averageTable td {
               
                background:white;
            }




#operator th , #averageTable th{
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: white;
   
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
          <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>
    <div>

          <div class="col-md-12">
            <div class="col-md-4"> <a id="A1" runat="server" href="Form_DummyDashboardView.aspx">  <img src="images/sanjeevlogo.png"  style="margin-left:-5%;margin-top:8%;background-color:white"></a></div>
           <div class="col-md-8">  <h2><b style="color:black">
               <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="Type Wise Reports"></asp:Label>
               </b></h2></div>
            
                 <hr />
            <br />

        </div>
     <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card">
                                 
                                    <asp:Label ID="lblType" Font-Bold="True" Font-Size="30px" runat="server" Text="0" meta:resourcekey="lblTypeResource1"></asp:Label>
                                    <br />
                                    <telerik:RadTabStrip SelectedIndex="2" ID="tabStrip" MultiPageID="RadMultiPage1" runat="server"  Skin="Silk" meta:resourcekey="tabStripResource1">
                                        <Tabs>
                <telerik:RadTab Text="Summary" Width="200px" meta:resourcekey="RadTabResource1"></telerik:RadTab>
                <telerik:RadTab Text="Open Ticket" Width="200px" meta:resourcekey="RadTabResource2"></telerik:RadTab>
                 <telerik:RadTab Text="Closed Ticket" Width="200px" meta:resourcekey="RadTabResource3" Selected="True"></telerik:RadTab>

            </Tabs>
                                    </telerik:RadTabStrip>
                                    <telerik:RadMultiPage ID="RadMultiPage1"  SelectedIndex="2" runat="server" meta:resourcekey="RadMultiPage1Resource1">
                                        <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourcekey="RadPageView1Resource1">
                                            <br />
                                              <table id="operator"  style=" color:black; font-size:15px;height:100px;" >
                 
   <tr>
       <td>
           <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="Total Tickets"></asp:Label>
       </td>
       <td style="font-size:30px;font-weight:bold">
           <asp:Label ID="lblTotalTickets" runat="server" Text="0" meta:resourcekey="lblTotalTicketsResource1"></asp:Label></td>

   </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="Open"></asp:Label>
                         </td>
                         <td style="font-size:30px;font-weight:bold"><asp:Label ID="lblOpenTickets" runat="server" Text="0" meta:resourcekey="lblOpenTicketsResource1"></asp:Label></td>
                     </tr>
                      <tr>
                         <td>
                             <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="Closed"></asp:Label>
                          </td>
                         <td style="font-size:30px;font-weight:bold"><asp:Label ID="lblCloseTickets" runat="server" Text="0" meta:resourcekey="lblCloseTicketsResource1"></asp:Label></td>
                     </tr>
                                                   <tr>
       <td>
           <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="Average Closed Time"></asp:Label>
                                                       </td>
       <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblAverageClosedTime" runat="server" Text="0" meta:resourcekey="lblAverageClosedTimeResource1"></asp:Label></td>

   </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label6" runat="server" meta:resourcekey="Label6Resource1" Text="Fastest Closed Time"></asp:Label>
                         </td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblFastestClosedTime" runat="server" Text="0" meta:resourcekey="lblFastestClosedTimeResource1"></asp:Label></td>
                     </tr>
                      <tr>
                         <td>
                             <asp:Label ID="Label7" runat="server" meta:resourcekey="Label7Resource1" Text="Slowest Closed Time"></asp:Label>
                          </td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblSlowestClosedTime" runat="server" Text="0" meta:resourcekey="lblSlowestClosedTimeResource1"></asp:Label></td>
                     </tr>
 <tr>
                         <td>
                             <asp:Label ID="Label8" runat="server" meta:resourcekey="Label8Resource1" Text="Total Open Duration "></asp:Label>
                         </td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblTotalSpentTime" runat="server" Text="0" meta:resourcekey="lblTotalSpentTimeResource1"></asp:Label></td>
                     </tr>

</table>
                                            

                                        </telerik:RadPageView>
                                          <telerik:RadPageView ID="RadPageView2" runat="server" meta:resourcekey="RadPageView2Resource1">
              <br />
                                               <div >
                                                <telerik:radgrid id="rgvDetails" runat="server" allowfilteringbycolumn="True" AutoGenerateColumns="False"  OnNeedDataSource="rgvDetails_NeedDataSource" Skin="Simple" OnItemDataBound="rgvDetails_ItemDataBound"  cellspacing="-1" gridlines="Both" meta:resourcekey="rgvDetailsResource1"  >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="False"></GroupingSettings>
                                                    <AlternatingItemStyle BackColor="LightGray" />
                                                    <MasterTableView>
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Ticket_Id" FilterControlAltText="Filter Ticket_Id column" HeaderText="Id" meta:resourcekey="GridBoundColumnResource1" UniqueName="Ticket_Id">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" meta:resourcekey="GridBoundColumnResource2" UniqueName="Status">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="userName" FilterControlAltText="Filter userName column" HeaderText="User" meta:resourcekey="GridBoundColumnResource3" UniqueName="userName">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Type_Name" FilterControlAltText="Filter Type_Name column" HeaderText="Type" meta:resourcekey="GridBoundColumnResource4" UniqueName="Type_Name" Visible="False">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Application_Name" FilterControlAltText="Filter Application_Name column" HeaderText="Application" meta:resourcekey="GridBoundColumnResource5" UniqueName="Application_Name">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Priority" FilterControlAltText="Filter Priority column" HeaderText="Priority" meta:resourcekey="GridBoundColumnResource6" UniqueName="Priority">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Created_Time" FilterControlAltText="Filter Created_Time column" HeaderText="Created Time" meta:resourcekey="GridBoundColumnResource7" UniqueName="Created_Time" Visible="False">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Updated_Time" FilterControlAltText="Filter Updated_Time column" HeaderText="Closed" meta:resourcekey="GridBoundColumnResource8" UniqueName="Updated_Time" Visible="False">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="createdDays" FilterControlAltText="Filter createdDays column" HeaderText="created before(Days)" meta:resourcekey="GridBoundColumnResource9" UniqueName="createdDays">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                    <ActiveItemStyle Wrap="True" />
                                                    <ItemStyle BackColor="LightGray" />
                                        </telerik:radgrid>



                                        
                
                    </div>
                                          </telerik:RadPageView>

                                           <telerik:RadPageView ID="RadPageView3" runat="server" meta:resourcekey="RadPageView3Resource1" Selected="True">
              <br />
                                               <div >
                                                <telerik:radgrid id="rgClosedTicket" runat="server" allowfilteringbycolumn="True" AutoGenerateColumns="False"  OnNeedDataSource="rgClosedTicket_NeedDataSource" Skin="Simple" OnItemDataBound="rgClosedTicket_ItemDataBound"  cellspacing="-1" gridlines="Both" meta:resourcekey="rgClosedTicketResource1"  >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="False"></GroupingSettings>
                                                    <AlternatingItemStyle BackColor="LightGray" />
                                                    <MasterTableView>
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Ticket_Id" FilterControlAltText="Filter Ticket_Id column" HeaderText="Id" meta:resourcekey="GridBoundColumnResource10" UniqueName="Ticket_Id">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" meta:resourcekey="GridBoundColumnResource11" UniqueName="Status">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="userName" FilterControlAltText="Filter userName column" HeaderText="User" meta:resourcekey="GridBoundColumnResource12" UniqueName="userName">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Type_Name" FilterControlAltText="Filter Type_Name column" HeaderText="Type" meta:resourcekey="GridBoundColumnResource13" UniqueName="Type_Name" Visible="False">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Application_Name" FilterControlAltText="Filter Application_Name column" HeaderText="Application" meta:resourcekey="GridBoundColumnResource14" UniqueName="Application_Name">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Priority" FilterControlAltText="Filter Priority column" HeaderText="Priority" meta:resourcekey="GridBoundColumnResource15" UniqueName="Priority">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Created_Time" FilterControlAltText="Filter Created_Time column" HeaderText="Created Time" meta:resourcekey="GridBoundColumnResource16" UniqueName="Created_Time">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Updated_Time" FilterControlAltText="Filter Updated_Time column" HeaderText="Closed Time" meta:resourcekey="GridBoundColumnResource17" UniqueName="Updated_Time">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="closedDays" FilterControlAltText="Filter closedDays column" HeaderText="Closed In(Days)" meta:resourcekey="GridBoundColumnResource18" UniqueName="closedDays">
                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </telerik:GridBoundColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                    <ActiveItemStyle Wrap="True" />
                                                    <ItemStyle BackColor="LightGray" />
                                        </telerik:radgrid>



                                        
                
                    </div>
                                          </telerik:RadPageView>
                                    </telerik:RadMultiPage>
                                  

                                   
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
    </div>
    </form>
</body>
</html>
