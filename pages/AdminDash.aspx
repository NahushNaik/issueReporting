<%@ Page Title="" Language="C#" MasterPageFile="~/pages/AdminMaster.master" AutoEventWireup="true" CodeFile="AdminDash.aspx.cs" Inherits="pages_AdminDash" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body1" runat="Server">

    <a class="navbar-brand" href="#">
<asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="Dashboard"></asp:Label>
</a>&nbsp;
           
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
     <div class="content">
                <div class="container-fluid">


                    <div class="row" style="margin-top: 0px !important;">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">
                                        <asp:Label ID="Label14" runat="server" Text="Tickets" meta:resourcekey="Label14Resource1"></asp:Label>
                                    </h4>
                                    <p class="category">
                                        <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="Recent 5 tickets"></asp:Label>
                                    </p>
                                </div>

                                <div style="margin: 10px 0px 0px 20px;" class="title">
                                    <asp:DropDownList ID="DropDownList1" runat="server" meta:resourcekey="DropDownList1Resource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource1">All</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource2">Open</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource3">Closed</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="content table-responsive table-full-width">
                                    <telerik:radgrid id="RadGrid1" runat="server" allowfilteringbycolumn="True" allowpaging="True" onitemdatabound="RadGrid1_ItemDataBound" skin="Bootstrap" cellspacing="-1" gridlines="Both" pagesize="5" meta:resourcekey="RadGrid1Resource1">
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                            <MasterTableView>
                                                <Columns>
                                                    <telerik:GridHyperLinkColumn AllowSorting="False" FilterControlAltText="Filter view column" ImageUrl="images/Viewfolder.png" Text="View" UniqueName="view" meta:resourcekey="GridHyperLinkColumnResource1">
                                                    </telerik:GridHyperLinkColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings>
                                                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                                            </ClientSettings>
                                        </telerik:radgrid>
                                </div>
                                <div class="stats">
                                    <a href="AdminReport.aspx?type=closed" style="color: black;" onclick="skm_LockScreen('We are processing your request...')">
                                    <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="View List"></asp:Label>
                                    </a>
                                </div>
                            </div>
                        </div>


                    </div>

                    <!--CHART-->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">
                                        <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="Ticket Statistics"></asp:Label>
                                    </h4>
                                    <p class="category">
                                        <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="Last 6 months overview"></asp:Label>
                                    </p>
                                </div>
                                <div class="content">
                                    <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>

                                    <div class="footer">
                                        <div class="chart-legend">
                                            <i class="fa fa-circle text-info"></i>
                                            <asp:Label ID="Label6" runat="server" meta:resourcekey="Label6Resource1" Text="Closed"></asp:Label>
&nbsp;<i class="fa fa-circle text-danger"></i><asp:Label ID="Label7" runat="server" meta:resourcekey="Label7Resource1" Text="Open"></asp:Label>
&nbsp;<i class="fa fa-circle text-warning"></i><asp:Label ID="Label8" runat="server" meta:resourcekey="Label8Resource1" Text="Discarded"></asp:Label>
								   
                                        </div>
                                        <hr>
                                        <div class="stats">
                                            <asp:Label ID="Label9" runat="server" meta:resourcekey="Label9Resource1" Text="Last ticket created 3 days ago"></asp:Label>
                                            ...</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card ">
                                <div class="header">
                                    <h4 class="title">
                                        <asp:Label ID="Label10" runat="server" meta:resourcekey="Label10Resource1" Text="Tickets Creation Overview"></asp:Label>
                                    </h4>
                                    <p class="category">
                                        <asp:Label ID="Label11" runat="server" meta:resourcekey="Label11Resource1" Text="Last 6 months overview"></asp:Label>
                                    </p>
                                </div>
                                <div class="content">
                                    <div id="chartActivity" class="ct-chart"></div>

                                    <div class="footer">
                                        <div class="chart-legend">
                                            <i class="fa fa-circle text-info"></i>
                                            <asp:Label ID="Label12" runat="server" meta:resourcekey="Label12Resource1" Text="Ticket Count"></asp:Label>
                                        </div>
                                        <hr>
                                        <div class="stats">
                                            <i class="ti-check"></i>
                                            <asp:Label ID="Label13" runat="server" meta:resourcekey="Label13Resource1" Text="Total created in each month... "></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">




    <script type="text/javascript">
        $(document).ready(function () {

            demo.initChartist();
        });

        function pageLoad() {
            var grid = $find("<%= RadGrid1.ClientID %>");
        var columns = grid.get_masterTableView().get_columns();
        for (var i = 0; i < columns.length; i++) {
            columns[i].resizeToFit();
        }
    }

	</script>
</asp:Content>

