<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/pages/UserMaster.master" CodeFile="Frm_Departmentwise_Drilldown.aspx.cs" Inherits="pages_Frm_Departmentwise_Drilldown" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
        <asp:Label ID="Label1" runat="server" Text="Department Wise Reports" meta:resourcekey="Label1Resource1"></asp:Label></a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card" style="overflow: scroll;">
                                 
                                    <asp:Label ID="lblDapartment" Font-Bold="True" Font-Size="30px" runat="server" Text="0" meta:resourcekey="lblDapartmentResource1"></asp:Label>
                                    <br />
                                    <telerik:RadTabStrip SelectedIndex="0" ID="tabStrip" MultiPageID="RadMultiPage1" runat="server"  Skin="Silk" meta:resourcekey="tabStripResource1">
                                        <Tabs>
                <telerik:RadTab Text="Summary" Width="200px" meta:resourcekey="RadTabResource1"></telerik:RadTab>
               <telerik:RadTab Text="Open Tickets" Width="200px" meta:resourcekey="RadTabResource2"></telerik:RadTab>
                <telerik:RadTab Text="Close Tickets" Width="200px" meta:resourcekey="RadTabResource3"></telerik:RadTab>

            </Tabs>
                                    </telerik:RadTabStrip>
                                    <telerik:RadMultiPage ID="RadMultiPage1"  SelectedIndex="0" runat="server" meta:resourcekey="RadMultiPage1Resource1">
                                        <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourcekey="RadPageView1Resource1" Selected="True">
                                            <br />
                                              <table id="operator"  style=" color:black; font-size:15px;height:100px;" >
                 
   <tr>
       <td>
       <asp:Label ID="Label2" runat="server" Text="Total Tickets" meta:resourcekey="Label2Resource1"></asp:Label></td>
       <td style="font-size:30px;font-weight:bold">
           <asp:Label ID="lblTotalTickets" runat="server" Text="0" meta:resourcekey="lblTotalTicketsResource1"></asp:Label></td>

   </tr>
                     <tr>
                                  <td>
                                      <asp:Label ID="Label3" runat="server" Text="Open" meta:resourcekey="Label3Resource1"></asp:Label></td>
                         <td style="font-size:30px;font-weight:bold"><asp:Label ID="lblOpenTickets" runat="server" Text="0" meta:resourcekey="lblOpenTicketsResource1"></asp:Label></td>
                     </tr>
                      <tr>
                         <td>
                          <asp:Label ID="Label4" runat="server" Text="Closed" meta:resourcekey="Label4Resource1"></asp:Label></td>
                         <td style="font-size:30px;font-weight:bold"><asp:Label ID="lblCloseTickets" runat="server" Text="0" meta:resourcekey="lblCloseTicketsResource1"></asp:Label></td>
                     </tr>
                                                   <tr>
       <td>
          <asp:Label ID="Label5" runat="server" Text="Average Closed Time" meta:resourcekey="Label5Resource1"></asp:Label></td>
       <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblAverageClosedTime" runat="server" Text="0" meta:resourcekey="lblAverageClosedTimeResource1"></asp:Label></td>

   </tr>
                     <tr>
                         <td>
                         <asp:Label ID="Label6" runat="server" Text="Fastest Closed Time" meta:resourcekey="Label6Resource1"></asp:Label></td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblFastestClosedTime" runat="server" Text="0" meta:resourcekey="lblFastestClosedTimeResource1"></asp:Label></td>
                     </tr>
                      <tr>
                         <td>
                          <asp:Label ID="Label7" runat="server" Text="Slowest Closed Time" meta:resourcekey="Label7Resource1"></asp:Label></td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblSlowestClosedTime" runat="server" Text="0" meta:resourcekey="lblSlowestClosedTimeResource1"></asp:Label></td>
                     </tr>
 <tr>
                         <td>
     <asp:Label ID="Label8" runat="server" Text="Total Open Duration " meta:resourcekey="Label8Resource1"></asp:Label></td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblTotalSpentTime" runat="server" Text="0" meta:resourcekey="lblTotalSpentTimeResource1"></asp:Label></td>
                     </tr>

</table>
                                            

                                        </telerik:RadPageView>
                                          <telerik:RadPageView ID="RadPageView2" runat="server" meta:resourcekey="RadPageView2Resource1">
              <br />
                                               <div >
                                           <telerik:radgrid id="rgvDetails" runat="server" allowfilteringbycolumn="True"  AutoGenerateColumns="False"  OnNeedDataSource="rgvDetails_NeedDataSource" Skin="Simple" cellspacing="-1" gridlines="Both" OnItemDataBound="rgvDetails_ItemDataBound" meta:resourcekey="rgvDetailsResource1" >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="False"></GroupingSettings>
                                                  <ExportSettings ExportOnlyData="True" IgnorePaging="True" FileName=" Department Open Tickets Report">
                                                      <Excel Format="ExcelML" />
                                </ExportSettings>
                                               <AlternatingItemStyle BackColor="LightGray" />
                                               <MasterTableView CommandItemDisplay="Top">
                                                   <CommandItemSettings ShowAddNewRecordButton="False" ShowExportToExcelButton="True" ShowRefreshButton="False" />
                                                   <Columns>
                                                       <telerik:GridHyperLinkColumn AllowSorting="False" AutoPostBackOnFilter="True" DataNavigateUrlFields="Ticket_Id" DataNavigateUrlFormatString="ManageTicket.aspx?id={0}" DataTextField="Ticket_Id" FilterCheckListEnableLoadOnDemand="True" FilterControlAltText="Filter Ticket_Id column" HeaderText="Id" meta:resourcekey="GridHyperLinkColumnResource1" UniqueName="Ticket_Id">
                                                           <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                           <ItemStyle Font-Bold="True" Font-Size="Larger" Font-Underline="True" ForeColor="CadetBlue" HorizontalAlign="Center" />
                                                       </telerik:GridHyperLinkColumn>
                                                       <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" meta:resourcekey="GridBoundColumnResource1" UniqueName="Status">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="userName" FilterControlAltText="Filter userName column" HeaderText="User" meta:resourcekey="GridBoundColumnResource2" UniqueName="userName">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Type_Name" FilterControlAltText="Filter Type_Name column" HeaderText="Type" meta:resourcekey="GridBoundColumnResource3" UniqueName="Type_Name">
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Application_Name" FilterControlAltText="Filter Application_Name column" HeaderText="Application" meta:resourcekey="GridBoundColumnResource4" UniqueName="Application_Name">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Priority" FilterControlAltText="Filter Priority column" HeaderText="Priority" meta:resourcekey="GridBoundColumnResource5" UniqueName="Priority">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Created_Time" FilterControlAltText="Filter Created_Time column" HeaderText="Created Time" meta:resourcekey="GridBoundColumnResource6" UniqueName="Created_Time" Visible="False">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Updated_Time" FilterControlAltText="Filter Updated_Time column" HeaderText="Closed" meta:resourcekey="GridBoundColumnResource7" UniqueName="Updated_Time" Visible="False">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="createdDays" FilterControlAltText="Filter createdDays column" HeaderText="Created before(Days)" meta:resourcekey="GridBoundColumnResource8" UniqueName="createdDays">
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
                                           <telerik:RadPageView ID="RadPageView3" runat="server" meta:resourcekey="RadPageView3Resource1">
              <br />
                                                 <div class="content table-responsive table-full-width">
                                           <telerik:radgrid id="rgClosedTicket" runat="server" allowfilteringbycolumn="True"  AutoGenerateColumns="False"  OnNeedDataSource="rgClosedTicket_NeedDataSource" Skin="Simple" cellspacing="-1" gridlines="Both" OnItemDataBound="rgClosedTicket_ItemDataBound" meta:resourcekey="rgClosedTicketResource1" >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="False"></GroupingSettings>
                                                    <ExportSettings ExportOnlyData="True" IgnorePaging="True" FileName=" Department Close Tickets Report"> 
                                                        <Excel Format="ExcelML" />
                                               </ExportSettings>
                                               <AlternatingItemStyle BackColor="LightGray" />
                                               <MasterTableView CommandItemDisplay="Top">
                                                   <CommandItemSettings ShowAddNewRecordButton="False" ShowExportToExcelButton="True" ShowRefreshButton="False" />
                                                   <Columns>
                                                       <telerik:GridBoundColumn DataField="Ticket_Id" FilterControlAltText="Filter Ticket_Id column" HeaderText="Id" meta:resourcekey="GridBoundColumnResource9" UniqueName="Ticket_Id">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                           <ItemStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" meta:resourcekey="GridBoundColumnResource10" UniqueName="Status">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="userName" FilterControlAltText="Filter userName column" HeaderText="User" meta:resourcekey="GridBoundColumnResource11" UniqueName="userName">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Type_Name" FilterControlAltText="Filter Type_Name column" HeaderText="Type" meta:resourcekey="GridBoundColumnResource12" UniqueName="Type_Name">
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Application_Name" FilterControlAltText="Filter Application_Name column" HeaderText="Application" meta:resourcekey="GridBoundColumnResource13" UniqueName="Application_Name">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Priority" FilterControlAltText="Filter Priority column" HeaderText="Priority" meta:resourcekey="GridBoundColumnResource14" UniqueName="Priority">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridDateTimeColumn DataField="Created_Time" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" EnableTimeIndependentFiltering="True" FilterControlAltText="Filter Created_Time column" FilterControlWidth="100px" HeaderText="Created Time" meta:resourcekey="GridDateTimeColumnResource1" SortExpression="Created_Time" UniqueName="Created_Time">
                                                       </telerik:GridDateTimeColumn>
                                                       <telerik:GridDateTimeColumn DataField="Updated_Time" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" EnableTimeIndependentFiltering="True" FilterControlAltText="Filter Updated_Time column" FilterControlWidth="100px" HeaderText="Closed At" meta:resourcekey="GridDateTimeColumnResource2" SortExpression="Updated_Time" UniqueName="Updated_Time">
                                                       </telerik:GridDateTimeColumn>
                                                       <telerik:GridBoundColumn DataField="closedDays" FilterControlAltText="Filter closedDays column" HeaderText="Closed in(Days)" meta:resourcekey="GridBoundColumnResource15" UniqueName="closedDays">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                           <ItemStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="hours" FilterControlAltText="Filter hours column" HeaderText="Time Spent(Hours.Min)" meta:resourcekey="GridBoundColumnResource16" UniqueName="hours">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                           <ItemStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="isValid" FilterControlAltText="Filter isValid column" HeaderText="Is Valid?" meta:resourcekey="GridBoundColumnResource17" UniqueName="isValid">
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

              
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">


    

 
</asp:Content>

