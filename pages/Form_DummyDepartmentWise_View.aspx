<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Form_DummyDepartmentWise_View.aspx.cs" Inherits="pages_Form_DummyDepartmentWise_View" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <title>Issue Reporting</title>
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
            <div class="col-md-4"> <a id="A1" runat="server" href="Form_DummyDashboardView.aspx">  <img src="images/sanjeevlogo.png"  style="margin-left:-6%;margin-top:8%;background-color:white"></a></div>
           <div class="col-md-8">  <h2 style="color:black"><b>Department Wise Reports</b></h2></div>
            
                 <hr />
            <br />

        </div>

     <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card">
                                 
                                    <asp:Label ID="lblDapartment" Font-Bold="True" Font-Size="30px" runat="server" Text="0" meta:resourcekey="lblDapartmentResource1"></asp:Label>
                                    <br />
                                    <telerik:RadTabStrip SelectedIndex="0" ID="tabStrip" MultiPageID="RadMultiPage1" runat="server"  Skin="Silk">
                                        <Tabs>
                <telerik:RadTab Text="Summary" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="Open Tickets" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="Close Tickets" Width="200px"></telerik:RadTab>

            </Tabs>
                                    </telerik:RadTabStrip>
                                    <telerik:RadMultiPage ID="RadMultiPage1"  SelectedIndex="0" runat="server">
                                        <telerik:RadPageView ID="RadPageView1" runat="server">
                                            <br />
                                              <table id="operator"  style=" color:black; font-size:15px;height:100px;" >
                 
   <tr>
       <td>Total Tickets</td>
       <td style="font-size:30px;font-weight:bold">
           <asp:Label ID="lblTotalTickets" runat="server" Text="0"></asp:Label></td>

   </tr>
                     <tr>
                         <td>Open</td>
                         <td style="font-size:30px;font-weight:bold"><asp:Label ID="lblOpenTickets" runat="server" Text="0"></asp:Label></td>
                     </tr>
                      <tr>
                         <td>Closed</td>
                         <td style="font-size:30px;font-weight:bold"><asp:Label ID="lblCloseTickets" runat="server" Text="0"></asp:Label></td>
                     </tr>
                                                   <tr>
       <td>Average Closed Time</td>
       <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblAverageClosedTime" runat="server" Text="0"></asp:Label></td>

   </tr>
                     <tr>
                         <td>Fastest Closed Time</td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblFastestClosedTime" runat="server" Text="0"></asp:Label></td>
                     </tr>
                      <tr>
                         <td>Slowest Closed Time</td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblSlowestClosedTime" runat="server" Text="0"></asp:Label></td>
                     </tr>
 <tr>
                         <td>Total Open Duration </td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblTotalSpentTime" runat="server" Text="0"></asp:Label></td>
                     </tr>

</table>
                                            

                                        </telerik:RadPageView>
                                          <telerik:RadPageView ID="RadPageView2" runat="server">
              <br />
                                               <div >
                                           <telerik:radgrid id="rgvDetails" runat="server" allowfilteringbycolumn="true"  AutoGenerateColumns="false"  OnNeedDataSource="rgvDetails_NeedDataSource" Skin="Simple"  ActiveItemStyle-Wrap="true" cellspacing="-1" gridlines="Both" OnItemDataBound="rgvDetails_ItemDataBound" ItemStyle-BackColor="LightGray" AlternatingItemStyle-BackColor="LightGray" >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                            <MasterTableView>
                                                <Columns>
                                               

                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Ticket_Id" HeaderText="Id" ItemStyle-HorizontalAlign="Center" DataType="System.String"  ></telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Status" HeaderText="Status"  DataType="System.String"></telerik:GridBoundColumn>
                                               <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="userName" HeaderText="User"  DataType="System.String" ></telerik:GridBoundColumn>
                                                   
                                                    <telerik:GridBoundColumn DataField="Type_Name" HeaderText="Type"   ></telerik:GridBoundColumn>
                                
                                 <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="Application_Name" HeaderText="Application" DataType="System.String" ></telerik:GridBoundColumn>
                                
                                 <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"   DataField="Priority" HeaderText="Priority"  DataType="System.String" ></telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="Created_Time" HeaderText="Created Time" Visible="false" DataType="System.String"  ></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="Updated_Time" HeaderText="Closed"  visible="false" DataType="System.String"></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="createdDays" ItemStyle-HorizontalAlign="Center"    HeaderText="Created days(Days)"   DataType="System.String"></telerik:GridBoundColumn>
                                
                                                    
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings>
                                                <Resizing AllowColumnResize="false" ResizeGridOnColumnResize="false" AllowResizeToFit="false" />
                                            </ClientSettings>
                                        </telerik:radgrid>
                
                    </div>
                                          </telerik:RadPageView>

                                         <telerik:RadPageView ID="RadPageView3" runat="server">
              <br />
                                               <div >
                                           <telerik:radgrid id="rgClosedTicket" runat="server" allowfilteringbycolumn="true"  AutoGenerateColumns="false"  OnNeedDataSource="rgClosedTicket_NeedDataSource" Skin="Simple"  ActiveItemStyle-Wrap="true" cellspacing="-1" gridlines="Both" OnItemDataBound="rgClosedTicket_ItemDataBound" ItemStyle-BackColor="LightGray" AlternatingItemStyle-BackColor="LightGray"  >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                            <MasterTableView>
                                                <Columns>
                                               

                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Ticket_Id" HeaderText="Id" ItemStyle-HorizontalAlign="Center" DataType="System.String"  ></telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Status" HeaderText="Status" DataType="System.String" ></telerik:GridBoundColumn>
                                               <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="userName" HeaderText="User" DataType="System.String"  ></telerik:GridBoundColumn>
                                                   
                                                    <telerik:GridBoundColumn DataField="Type_Name" HeaderText="Type"   DataType="System.String"></telerik:GridBoundColumn>
                                
                                 <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="Application_Name" HeaderText="Application" DataType="System.String" ></telerik:GridBoundColumn>
                                
                                 <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"   DataField="Priority" HeaderText="Priority" DataType="System.String" ></telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="Created_Time" HeaderText="Created Time" DataType="System.String" ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="Updated_Time" HeaderText="Closed At"  ></telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataField="closedDays" HeaderText="Closed in(Days)" DataType="System.String" ></telerik:GridBoundColumn>
                                
                                                    
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings>
                                                <Resizing AllowColumnResize="false" ResizeGridOnColumnResize="false" AllowResizeToFit="false" />
                                            </ClientSettings>
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
