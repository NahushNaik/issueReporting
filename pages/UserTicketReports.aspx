<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="UserTicketReports.aspx.cs" Inherits="pages_Reports" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Reports</title>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BodyStart" runat="Server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body1" runat="Server">
    <a class="navbar-brand" href="#">Reports</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Tickets</h4>
                                        <p class="category">Select Appropriate type</p>
                                    </div>

                                    <div style="margin: 10px 0px 0px 20px;" class="title">
                                        <asp:DropDownList ID="DropDownList1" AutoPostBack="false" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                            <asp:ListItem>All</asp:ListItem>
                                            <asp:ListItem>Open</asp:ListItem>
                                            <asp:ListItem>Closed</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Button ID="btnFilterApply" runat="server" OnClick="btnFilterApply_Click" Text="Apply" />


                                    </div>

                                    <div class="content table-responsive table-full-width" style="overflow:scroll">
                                        <telerik:radgrid id="RadGrid1" runat="server" allowfilteringbycolumn="true" allowpaging="True" onitemdatabound="RadGrid1_ItemDataBound" skin="Simple" cellspacing="-1" gridlines="Both" AutoGenerateColumns="false" pagesize="100">
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                            <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName="User Tickets Report" > </ExportSettings>
                                            <MasterTableView  CommandItemDisplay="Top">
                                                <CommandItemSettings ShowAddNewRecordButton="false" ShowExportToExcelButton="true" ShowRefreshButton="false" />
                                                <Columns>
                                                    <telerik:GridHyperLinkColumn AllowSorting="False"  FilterControlAltText="Filter view column" ImageUrl="images/Search3.png" Text="View"   UniqueName="view" AllowFiltering="false">
                                                    </telerik:GridHyperLinkColumn>
                                                       <telerik:GridHyperLinkColumn AllowSorting="False" FilterControlAltText="Filter view column" Text="Update" UniqueName="updateLink"  DataType="System.String" AllowFiltering="false">
                                                    </telerik:GridHyperLinkColumn>

                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" DataType="System.String" ></telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Ticket No" HeaderText="Ticket No" ItemStyle-HorizontalAlign="Center" DataType="System.String" ></telerik:GridBoundColumn>

                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Priority" HeaderText="Priority" ItemStyle-HorizontalAlign="Center" DataType="System.String" ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Type Name" HeaderText="Type Name" ItemStyle-HorizontalAlign="Center" DataType="System.String" ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Application Name" HeaderText="Application Name" ItemStyle-HorizontalAlign="Center" DataType="System.String" ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Issue Name" HeaderText="Issue Name" ItemStyle-HorizontalAlign="Center" DataType="System.String" ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Issue Details" HeaderText="Issue Details" ItemStyle-HorizontalAlign="Center" DataType="System.String" ></telerik:GridBoundColumn>
                                                    
                                                     <telerik:GridDateTimeColumn DataField="Created Time" AllowFiltering="true" HeaderText="Created Time"
                                                    SortExpression="Date_of_PITCH_Validation" EnableTimeIndependentFiltering="true"  UniqueName="Date_of_PITCH_Validation" PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                                </telerik:GridDateTimeColumn>

                                                                              </Columns>
                                            </MasterTableView>
                                           <ClientSettings>
                                                 <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
                                            </ClientSettings>
                                        </telerik:radgrid>
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

      

	</script>

      <%--function pageLoad() {
            var grid = $find("<%= RadGrid1.ClientID %>");
            var columns = grid.get_masterTableView().get_columns();
            for (var i = 0; i < columns.length; i++) {
                columns[i].resizeToFit();
            }
        }--%>
</asp:Content>

