<%@ Page Title="" Language="C#" MasterPageFile="~/pages/AdminMaster.master" AutoEventWireup="true" CodeFile="AdminDash.aspx.cs" Inherits="pages_AdminDash" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body1" runat="Server">

<a class="navbar-brand" href="#">Dashboard</a>
           
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
     <div class="content">
                <div class="container-fluid">


                    <div class="row" style="margin-top: 0px !important;">
                        <div class="col-md-12">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">Tickets</h4>
                                    <p class="category">Recent 5 tickets</p>
                                </div>

                                <div style="margin: 10px 0px 0px 20px;" class="title">
                                    <asp:DropDownList ID="DropDownList1" runat="server" meta:resourcekey="DropDownList1Resource1">
                                        <asp:ListItem meta:resourcekey="ListItemResource1">All</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource2">Open</asp:ListItem>
                                        <asp:ListItem meta:resourcekey="ListItemResource3">Closed</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="content table-responsive table-full-width">
                                    <telerik:radgrid id="RadGrid1" runat="server" allowfilteringbycolumn="True" allowpaging="True" onitemdatabound="RadGrid1_ItemDataBound" skin="Bootstrap" cellspacing="-1" gridlines="Both" pagesize="5">
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                            <MasterTableView>
                                                <Columns>
                                                    <telerik:GridHyperLinkColumn AllowSorting="False" FilterControlAltText="Filter view column" ImageUrl="images/Viewfolder.png" Text="View" UniqueName="view">
                                                    </telerik:GridHyperLinkColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings>
                                                <Resizing AllowColumnResize="true" ResizeGridOnColumnResize="true" AllowResizeToFit="true" />
                                            </ClientSettings>
                                        </telerik:radgrid>
                                </div>
                                <div class="stats">
                                    <i class="ti-list-ol"></i><a href="AdminReport.aspx?type=closed" style="color: black;" onclick="skm_LockScreen('We are processing your request...')">View List</a>
                                </div>
                            </div>
                        </div>


                    </div>

                    <!--CHART-->
                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">
                                <div class="header">
                                    <h4 class="title">Ticket Statistics</h4>
                                    <p class="category">Last 6 months overview</p>
                                </div>
                                <div class="content">
                                    <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>

                                    <div class="footer">
                                        <div class="chart-legend">
                                            <i class="fa fa-circle text-info"></i>Closed
									   
												<i class="fa fa-circle text-danger"></i>Open
									   
												<i class="fa fa-circle text-warning"></i>Discarded
								   
                                        </div>
                                        <hr>
                                        <div class="stats">
                                            <i class="ti-timer"></i>Last ticket created 3 days ago...
								   
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card ">
                                <div class="header">
                                    <h4 class="title">Tickets Creation Overview</h4>
                                    <p class="category">Last 6 months overview</p>
                                </div>
                                <div class="content">
                                    <div id="chartActivity" class="ct-chart"></div>

                                    <div class="footer">
                                        <div class="chart-legend">
                                            <i class="fa fa-circle text-info"></i>Ticket Count								   
                                        </div>
                                        <hr>
                                        <div class="stats">
                                            <i class="ti-check"></i>Total created in each month...							   
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

