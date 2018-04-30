<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/pages/UserMaster.master" CodeFile="ViewTicket_Admin.aspx.cs" Inherits="pages_ViewTicket_Admin" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>View All Tickets</title>
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
        <asp:Label ID="Label3" runat="server" Text="View All Tickets" meta:resourcekey="Label3Resource1"></asp:Label></a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">
                                            <asp:Label ID="Label4" runat="server" Text="Tickets" meta:resourcekey="Label4Resource1"></asp:Label></h4>
                                        <p class="category">
                                            <asp:Label ID="Label5" runat="server" Text="Select Appropriate Filter" meta:resourcekey="Label5Resource1"></asp:Label></p>
                                    </div>

                                    <div style="margin: 10px 0px 0px 20px;" class="title">
                                        <asp:DropDownList ID="ddlStatus" runat="server"  AutoPostBack="false" ValidationGroup="statusApply" meta:resourcekey="ddlStatusResource1">
                                               <asp:ListItem meta:resourcekey="ListItemResource1"  >All</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource2">Open</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource3" >Closed</asp:ListItem>
                                        </asp:DropDownList>

                                          <asp:DropDownList ID="ddlMenu" AutoPostBack="false" runat="server" meta:resourcekey="ddlMenuResource1" >
                                            <asp:ListItem meta:resourcekey="ListItemResource4">Created Time</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource5">Ticket No</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource6">Priority</asp:ListItem>
                                        </asp:DropDownList>
                                             <asp:DropDownList ID="ddlOrder" AutoPostBack="false"  runat="server" meta:resourcekey="ddlOrderResource1" >
                                            <asp:ListItem Value="desc" meta:resourcekey="ListItemResource7">Descending </asp:ListItem>
                                            <asp:ListItem Value="asc" meta:resourcekey="ListItemResource8">Ascending</asp:ListItem>
                                            
                                        </asp:DropDownList>
                
                                        <asp:Label ID="Label1" runat="server" Text="From Date:" meta:resourcekey="Label1Resource1"></asp:Label>&nbsp;<telerik:RadDateTimePicker ID="dtpFromDate"  width="126px"  AutoPostBackControl="None" runat="server" meta:resourcekey="dtpFromDateResource1">  <TimePopupButton Visible="false" /></telerik:RadDateTimePicker>
                                         <asp:Label ID="Label2" runat="server" Text="To Date:" meta:resourcekey="Label2Resource1"></asp:Label>&nbsp;<telerik:RadDateTimePicker ID="dtpToDate" width="127px" AutoPostBackControl="None"  runat="server">  <TimePopupButton Visible="false" meta:resourcekey="dtpToDateResource1"/></telerik:RadDateTimePicker>
                                        <asp:Button ID="btnTicketTypeApply" runat="server" Text="Apply" ValidationGroup="statusApply" OnClick="btnTicketTypeApply_Click" meta:resourcekey="btnTicketTypeApplyResource1"/>
                                      
                                    </div>

                                    <div class="content table-responsive table-full-width">
                                        <telerik:radgrid id="rgTickets" runat="server" allowfilteringbycolumn="true"  onitemdatabound="rgTickets_ItemDataBound" AutoGenerateColumns="false" ActiveItemStyle-Wrap="true" skin="Simple" cellspacing="-1" gridlines="Both" CssClass="text-center" meta:resourcekey="rgTicketsResource1"      >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                             <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName=" View Tickets Report"> </ExportSettings>
                                              <MasterTableView CommandItemDisplay="Top" >
                                                  <CommandItemSettings ShowExportToCsvButton="false" ShowRefreshButton="false" ShowAddNewRecordButton="false" ShowExportToExcelButton="true" />
                                                <Columns>

                                                     <telerik:GridHyperLinkColumn  HeaderStyle-Font-Bold="true" DataNavigateUrlFields="Ticket No" DataType="System.String" 
                                   DataNavigateUrlFormatString="ManageTicket.aspx?id={0}" HeaderText="Id" AutoPostBackOnFilter="false"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"  ItemStyle-ForeColor="CadetBlue" ItemStyle-Font-Size="Larger" FilterCheckListEnableLoadOnDemand="true" DataTextField="Ticket No" ItemStyle-Font-Underline="true" meta:resourcekey="GridHyperLinkColumnResource1"></telerik:GridHyperLinkColumn>
                                                     <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Ticket No" HeaderText="ID" DataType="System.String" Visible="false" meta:resourcekey="GridBoundColumnResource1"></telerik:GridBoundColumn>


                                                    <telerik:GridHyperLinkColumn AllowSorting="False" FilterControlAltText="Filter view column" ImageUrl="images/Search3.png" Text="View" UniqueName="view"  DataType="System.String" AllowFiltering="false" Visible="false" meta:resourcekey="GridHyperLinkColumnResource2">
                                                    </telerik:GridHyperLinkColumn>


                                                   




                                               <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="User_Email" HeaderText="User" DataType="System.String" meta:resourcekey="GridBoundColumnResource2"  ></telerik:GridBoundColumn>

                                                    
                                               <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Status" HeaderText="Status" DataType="System.String" meta:resourcekey="GridBoundColumnResource3"  ></telerik:GridBoundColumn>
                                                     
                                                      <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Priority" HeaderText="Priority" DataType="System.String" meta:resourcekey="GridBoundColumnResource4"   ></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Type Name" HeaderText="Type Name" DataType="System.String" meta:resourcekey="GridBoundColumnResource5"    ></telerik:GridBoundColumn>
                                                    
                                                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Application Name" HeaderText="Application" DataType="System.String" meta:resourcekey="GridBoundColumnResource6"   ></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Issue Name" HeaderText="Issue" DataType="System.String" meta:resourcekey="GridBoundColumnResource7"   ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Issue Details" HeaderText="Issue Details" DataType="System.String" FilterControlWidth="100px" meta:resourcekey="GridBoundColumnResource8" ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Created Time" Visible="false" HeaderText="Created" DataType="System.String" meta:resourcekey="GridBoundColumnResource9"   ></telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataField="pendingDays" HeaderText="Created Before(days)" DataType="System.String" meta:resourcekey="GridBoundColumnResource10"   ></telerik:GridBoundColumn>
                                                   
                                                     <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  ItemStyle-HorizontalAlign="Center" DataField="Created Time" HeaderText="Created At" DataType="System.String" Visible="false" meta:resourcekey="GridBoundColumnResource11"    ></telerik:GridBoundColumn>


                                                     <telerik:GridDateTimeColumn DataField="Created Time" AllowFiltering="true" HeaderText="Created At"
                                                 EnableTimeIndependentFiltering="true"  PickerType="DatePicker" FilterControlWidth="100px" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" meta:resourcekey="GridDateTimeColumnResource1">
                                                </telerik:GridDateTimeColumn>

                                                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataField="Hours" HeaderText="Time Spent(Hours.Min)" DataType="System.String" meta:resourcekey="GridBoundColumnResource12"   ></telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataField="isValid" HeaderText="Is Valid?" DataType="System.String" meta:resourcekey="GridBoundColumnResource13"   ></telerik:GridBoundColumn>
                                                    
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

       function pageLoad() {
           var grid = $find("<%= rgTickets.ClientID %>");
            var columns = grid.get_masterTableView().get_columns();
           for (var i = 0; i < columns.length-1; i++) {
               columns[i].resizeToFit();
            }
        }

	</script>
</asp:Content>

