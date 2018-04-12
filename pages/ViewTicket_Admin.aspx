<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/pages/UserMaster.master" CodeFile="ViewTicket_Admin.aspx.cs" Inherits="pages_ViewTicket_Admin" %>

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
    <a class="navbar-brand" href="#">View All Tickets</a>
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
                                        <asp:DropDownList ID="ddlStatus" runat="server"  AutoPostBack="false" ValidationGroup="statusApply">
                                               <asp:ListItem  >All</asp:ListItem>
                                            <asp:ListItem>Open</asp:ListItem>
                                            <asp:ListItem >Closed</asp:ListItem>
                                        </asp:DropDownList>


                   
                                        <asp:Label ID="Label1" runat="server" Text="From Date:"></asp:Label>&nbsp;<telerik:RadDateTimePicker ID="dtpFromDate"  width="120px"  AutoPostBackControl="None" runat="server">  <TimePopupButton Visible="false" /></telerik:RadDateTimePicker>&nbsp;&nbsp;&nbsp;
                                         <asp:Label ID="Label2" runat="server" Text="To Date:"></asp:Label>&nbsp;<telerik:RadDateTimePicker ID="dtpToDate" width="122px" AutoPostBackControl="None"  runat="server">  <TimePopupButton Visible="false" /></telerik:RadDateTimePicker>
                                        <asp:Button ID="btnTicketTypeApply" runat="server" Text="Apply" ValidationGroup="statusApply" OnClick="btnTicketTypeApply_Click" />
                                      
                                    </div>

                                    <div class="content table-responsive table-full-width">
                                        <telerik:radgrid id="rgTickets" runat="server" allowfilteringbycolumn="true"  onitemdatabound="rgTickets_ItemDataBound" AutoGenerateColumns="false" ActiveItemStyle-Wrap="true" skin="Simple" cellspacing="-1" gridlines="Both"      >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                             <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName=" View Tickets Report"> </ExportSettings>
                                              <MasterTableView CommandItemDisplay="Top" >
                                                  <CommandItemSettings ShowExportToCsvButton="false" ShowRefreshButton="false" ShowAddNewRecordButton="false" ShowExportToExcelButton="true" />
                                                <Columns>
                                                    <telerik:GridHyperLinkColumn AllowSorting="False" FilterControlAltText="Filter view column" ImageUrl="images/Search3.png" Text="View" UniqueName="view"  DataType="System.String" AllowFiltering="false">
                                                    </telerik:GridHyperLinkColumn>


                                                   




                                               <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Status" HeaderText="Status" DataType="System.String"  ></telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Ticket No" HeaderText="ID" DataType="System.String"  ></telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Priority" HeaderText="Priority" DataType="System.String"   ></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Type Name" HeaderText="Type Name" DataType="System.String"    ></telerik:GridBoundColumn>
                                                    
                                                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Application Name" HeaderText="Application" DataType="System.String"   ></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Issue Name" HeaderText="Issue" DataType="System.String"   ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Issue Details" HeaderText="Issue" DataType="System.String"  ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Created Time" Visible="false" HeaderText="Created" DataType="System.String"   ></telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataField="pendingDays" HeaderText="Created Before(days)" DataType="System.String"   ></telerik:GridBoundColumn>
                                                   
                                                     <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataField="Created Time" HeaderText="Created At" DataType="System.String" Visible="false"   ></telerik:GridBoundColumn>


                                                     <telerik:GridDateTimeColumn DataField="Created Time" AllowFiltering="true" HeaderText="Created At"
                                                 EnableTimeIndependentFiltering="true"  PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                                </telerik:GridDateTimeColumn>


                                                      <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataField="isValid" HeaderText="Is Valid?" DataType="System.String"   ></telerik:GridBoundColumn>
                                                    
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

