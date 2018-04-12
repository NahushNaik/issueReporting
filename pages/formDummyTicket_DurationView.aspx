<%@ Page Language="C#" AutoEventWireup="true" CodeFile="formDummyTicket_DurationView.aspx.cs" Inherits="pages_formDummyTicket_DurationView" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
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
            <div class="col-md-4"> <a id="A1" runat="server" href="Form_DummyDashboardView.aspx"> <img src="images/sanjeevlogo.png"  style="margin-left:-5%;margin-top:8%;background-color:white"></a> </div>
           <div class="col-md-8">  <h2><b style="color:black">
               <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="View Tickets"></asp:Label>
               </b></h2></div>
            
            

        </div>
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card">
                                    
                                    <div  style="margin: 10px 0px 0px 20px;" class="title">
                                        <asp:DropDownList ID="ddlStatus" runat="server" Visible="False"  AutoPostBack="True" meta:resourcekey="ddlStatusResource1">
                                               <asp:ListItem meta:resourcekey="ListItemResource1"  >All</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource2">Open</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource3" >Closed</asp:ListItem>
                                        </asp:DropDownList>
                     &nbsp; &nbsp; &nbsp;   
                                        <asp:Label Visible="False" ID="Label1" runat="server" Text="From Date:" meta:resourcekey="Label1Resource1"></asp:Label>&nbsp;<telerik:RadDateTimePicker Visible="false" ID="dtpFromDate"  width="120px"  AutoPostBackControl="Calendar" runat="server">  <TimePopupButton Visible="false" /></telerik:RadDateTimePicker>&nbsp;&nbsp;&nbsp;
                                         <asp:Label Visible="False" ID="Label2" runat="server" Text="To Date:" meta:resourcekey="Label2Resource1"></asp:Label>&nbsp;<telerik:RadDateTimePicker ID="dtpToDate" Visible="false" width="122px" AutoPostBackControl="Calendar"  runat="server">  <TimePopupButton Visible="false" /></telerik:RadDateTimePicker>
                                      
                                    </div>

                                    <div class="content table-responsive table-full-width">
                                        <telerik:radgrid id="rgTickets" runat="server" allowfilteringbycolumn="false"  onitemdatabound="rgTickets_ItemDataBound" AutoGenerateColumns="false" MasterTableView-AllowFilteringByColumn="true" ActiveItemStyle-Wrap="true" skin="Simple" cellspacing="-1" gridlines="Both"  >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                            <MasterTableView>
                                                <Columns>
                                                    
                                                      <telerik:GridBoundColumn DataField="Ticket No" HeaderText="Ticket No" DataType="System.String"  AutoPostBackOnFilter="false" ></telerik:GridBoundColumn>
                                               
                                                     <telerik:GridBoundColumn DataField="Status" HeaderText="Status" DataType="System.String"  AutoPostBackOnFilter="false" ></telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="User_Email" HeaderText="User" DataType="System.String"  AutoPostBackOnFilter="false" ></telerik:GridBoundColumn>
                                                    
                                                
                                                     <telerik:GridBoundColumn DataField="Priority" DataType="System.String"  HeaderText="Priority" AutoPostBackOnFilter="false"  ></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Type Name" DataType="System.String" HeaderText="Type" AutoPostBackOnFilter="false"  ></telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn DataField="Application Name" HeaderText="Application" AutoPostBackOnFilter="false" DataType="System.String"   ></telerik:GridBoundColumn>
  <telerik:GridBoundColumn DataField="Created Time" DataType="System.String"  HeaderText="Created Date" AutoPostBackOnFilter="false"  ></telerik:GridBoundColumn>   
                                                     <telerik:GridBoundColumn DataField="Updated_Time" DataType="System.String"  HeaderText="Updated Time" AutoPostBackOnFilter="false"  ></telerik:GridBoundColumn>                                                    
                                                    
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings>
                                                <Resizing AllowColumnResize="false" ResizeGridOnColumnResize="false" AllowResizeToFit="false" />
                                            </ClientSettings>
                                        </telerik:radgrid>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
    </div>
    </form>
</body>
</html>
