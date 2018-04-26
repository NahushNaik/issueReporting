<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="UserTicketReports.aspx.cs" Inherits="pages_Reports" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

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
    <a class="navbar-brand" href="#">
        <asp:Label ID="Label1" runat="server" Text="Reports" meta:resourcekey="Label1Resource1"></asp:Label></a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">
                                            <asp:Label ID="Label2" runat="server" Text="Tickets" meta:resourcekey="Label2Resource1"></asp:Label></h4>
                                        <p class="category">
                                            <asp:Label ID="Label3" runat="server" Text="Select Appropriate type" meta:resourcekey="Label3Resource1"></asp:Label></p>
                                    </div>

                                    <div style="margin: 10px 0px 0px 20px;" class="title">
                                        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" meta:resourcekey="DropDownList1Resource1">
                                            <asp:ListItem meta:resourcekey="ListItemResource1">All</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource2">Open</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource3">Closed</asp:ListItem>
                                        </asp:DropDownList>


                                          <asp:DropDownList ID="ddlMenu" runat="server" meta:resourcekey="ddlMenuResource1" >
                                            <asp:ListItem meta:resourcekey="ListItemResource4">Created Time</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource5">Ticket No</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource6">Priority</asp:ListItem>
                                        </asp:DropDownList>
                                             <asp:DropDownList ID="ddlOrder" runat="server" meta:resourcekey="ddlOrderResource1" >
                                            <asp:ListItem Value="desc" meta:resourcekey="ListItemResource7">Descending </asp:ListItem>
                                            <asp:ListItem Value="asc" meta:resourcekey="ListItemResource8">Ascending</asp:ListItem>
                                            
                                        </asp:DropDownList>
                                        <asp:Button ID="btnFilterApply" runat="server" OnClick="btnFilterApply_Click" Text="Apply" meta:resourcekey="btnFilterApplyResource1" />


                                    </div>
                                     <div>
                                       
                                       
                                    </div>
                                  

                                    <div class="content table-responsive table-full-width" style="overflow:scroll">
                                          <telerik:radgrid id="RadGrid1" runat="server" allowfilteringbycolumn="True" allowpaging="True" onitemdatabound="RadGrid1_ItemDataBound" skin="Simple" cellspacing="-1" gridlines="Both" AutoGenerateColumns="False" pagesize="100" meta:resourcekey="RadGrid1Resource1">
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                            <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName="User Tickets Report" > </ExportSettings>
                                            <MasterTableView  CommandItemDisplay="Top">
                                                <CommandItemSettings ShowAddNewRecordButton="false" ShowExportToExcelButton="true" ShowRefreshButton="false" />
                                                <Columns>
                                                      <telerik:GridHyperLinkColumn AllowSorting="False" FilterControlAltText="Filter view column" Text="Update" UniqueName="updateLink"  DataType="System.String" AllowFiltering="false" HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"  ItemStyle-ForeColor="CadetBlue" ItemStyle-Font-Size="Larger" ItemStyle-Font-Underline="true" meta:resourcekey="GridHyperLinkColumnResource1">
                                                    </telerik:GridHyperLinkColumn>

                                                     <telerik:GridHyperLinkColumn  HeaderStyle-Font-Bold="true" DataNavigateUrlFields="Ticket No" DataType="System.String" 
                                   DataNavigateUrlFormatString="UserTicketView.aspx?id={0}" HeaderText="Id" AutoPostBackOnFilter="false"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"  ItemStyle-ForeColor="CadetBlue" ItemStyle-Font-Size="Larger" FilterCheckListEnableLoadOnDemand="true" DataTextField="Ticket No" ItemStyle-Font-Underline="true" UniqueName="view" meta:resourcekey="GridHyperLinkColumnResource2" ></telerik:GridHyperLinkColumn>


                                                    <telerik:GridHyperLinkColumn AllowSorting="False"  FilterControlAltText="Filter view column" ImageUrl="images/Search3.png" Text="View" Visible="false"   UniqueName="view" AllowFiltering="false" meta:resourcekey="GridHyperLinkColumnResource3"  >
                                                    </telerik:GridHyperLinkColumn>
                                                     

                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Status" HeaderText="Status" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource1" ></telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn Visible="false" HeaderStyle-HorizontalAlign="Center"  DataField="Ticket No" HeaderText="Ticket No" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource2" ></telerik:GridBoundColumn>

                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Priority" HeaderText="Priority" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource3" ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Type Name" HeaderText="Type Name" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource4" ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Application Name" HeaderText="Application Name" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource5" ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Issue Name" HeaderText="Issue Name" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource6" ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Issue Details" HeaderText="Issue Details" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource7" ></telerik:GridBoundColumn>
                                                    
                                                     <telerik:GridDateTimeColumn DataField="Created Time" AllowFiltering="true" HeaderText="Created Time"
                                                    SortExpression="Date_of_PITCH_Validation" EnableTimeIndependentFiltering="true"  UniqueName="Date_of_PITCH_Validation" PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" FilterControlWidth="100px" meta:resourcekey="GridDateTimeColumnResource1">
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

