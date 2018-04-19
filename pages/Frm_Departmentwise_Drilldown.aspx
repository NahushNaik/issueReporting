<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/pages/UserMaster.master" CodeFile="Frm_Departmentwise_Drilldown.aspx.cs" Inherits="pages_Frm_Departmentwise_Drilldown" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>


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
    <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource2" Text="Department Wise Reports"></asp:Label>
    </a>
&nbsp;
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card" >
                                 
                                    <asp:Label ID="lblDapartment" Font-Bold="True" Font-Size="30px" runat="server" Text="0" meta:resourcekey="lblDapartmentResource2"></asp:Label>
                                    <br />
                                    <telerik:RadTabStrip SelectedIndex="1" ID="tabStrip" MultiPageID="RadMultiPage1" runat="server"  Skin="Silk" meta:resourcekey="tabStripResource2">
                                        <Tabs>
                <telerik:RadTab Text="Summary" Width="200px" meta:resourcekey="RadTabResource4"></telerik:RadTab>
               <telerik:RadTab Text="Open Tickets" Width="200px" meta:resourcekey="RadTabResource5" Selected="True"></telerik:RadTab>
                <telerik:RadTab Text="Close Tickets" Width="200px" meta:resourcekey="RadTabResource6"></telerik:RadTab>

            </Tabs>
                                    </telerik:RadTabStrip>
                                    <telerik:RadMultiPage ID="RadMultiPage1"  SelectedIndex="1" runat="server" meta:resourcekey="RadMultiPage1Resource2">
                                        <telerik:RadPageView ID="RadPageView1" runat="server" meta:resourceKey="RadPageView1Resource2">
                                            <br />
                                              <table id="operator"  style=" color:black; font-size:15px;height:100px;" >
                 
   <tr>
       <td>
           <asp:Label ID="Label2" runat="server" meta:resourceKey="Label2Resource2" Text="Total Tickets"></asp:Label>
       </td>
       <td style="font-size:30px;font-weight:bold">
           <asp:Label ID="lblTotalTickets" runat="server" Text="0" meta:resourceKey="lblTotalTicketsResource2"></asp:Label></td>

   </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label3" runat="server" meta:resourceKey="Label3Resource2" Text="Open"></asp:Label>
                         </td>
                         <td style="font-size:30px;font-weight:bold"><asp:Label ID="lblOpenTickets" runat="server" Text="0" meta:resourceKey="lblOpenTicketsResource2"></asp:Label></td>
                     </tr>
                      <tr>
                         <td>
                             <asp:Label ID="Label4" runat="server" meta:resourceKey="Label4Resource2" Text="Closed"></asp:Label>
                          </td>
                         <td style="font-size:30px;font-weight:bold"><asp:Label ID="lblCloseTickets" runat="server" Text="0" meta:resourceKey="lblCloseTicketsResource2"></asp:Label></td>
                     </tr>
                                                   <tr>
       <td>
           <asp:Label ID="Label5" runat="server" meta:resourceKey="Label5Resource2" Text="Average Closed Time"></asp:Label>
                                                       </td>
       <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblAverageClosedTime" runat="server" Text="0" meta:resourceKey="lblAverageClosedTimeResource2"></asp:Label></td>

   </tr>
                     <tr>
                         <td>
                             <asp:Label ID="Label6" runat="server" meta:resourceKey="Label6Resource2" Text="Fastest Closed Time"></asp:Label>
                         </td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblFastestClosedTime" runat="server" Text="0" meta:resourceKey="lblFastestClosedTimeResource2"></asp:Label></td>
                     </tr>
                      <tr>
                         <td>
                             <asp:Label ID="Label7" runat="server" meta:resourceKey="Label7Resource2" Text="Slowest Closed Time"></asp:Label>
                          </td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblSlowestClosedTime" runat="server" Text="0" meta:resourceKey="lblSlowestClosedTimeResource2"></asp:Label></td>
                     </tr>
 <tr>
                         <td>
                             <asp:Label ID="Label8" runat="server" meta:resourceKey="Label8Resource2" Text="Total Support Duration "></asp:Label>
                         </td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblTotalSpentTime" runat="server" Text="0" meta:resourceKey="lblTotalSpentTimeResource2"></asp:Label></td>
                     </tr>

</table>
                                            

                                        </telerik:RadPageView>
                                          <telerik:RadPageView ID="RadPageView2" runat="server" meta:resourceKey="RadPageView2Resource2" Selected="True">
              <br />
                                               <div >
                                           <telerik:radgrid id="rgvDetails" runat="server" allowfilteringbycolumn="True"  AutoGenerateColumns="False"  OnNeedDataSource="rgvDetails_NeedDataSource" Skin="Simple" cellspacing="-1" gridlines="Both" OnItemDataBound="rgvDetails_ItemDataBound" CssClass="text-center" meta:resourceKey="rgvDetailsResource2" >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="False"></GroupingSettings>
                                                  <ExportSettings ExportOnlyData="True" IgnorePaging="True" FileName=" Department Open Tickets Report">
                                                      <Excel Format="ExcelML" />
                                </ExportSettings>
                                           <ClientSettings>
                                                 <Scrolling AllowScroll="True" UseStaticHeaders="True"></Scrolling>
                                            </ClientSettings>
                                               <AlternatingItemStyle BackColor="LightGray" />
                                               <MasterTableView CommandItemDisplay="Top">
                                                   <CommandItemSettings ShowAddNewRecordButton="False" ShowExportToExcelButton="True" ShowRefreshButton="False" />
                                                   <Columns>
                                                       <telerik:GridHyperLinkColumn AllowSorting="False" AutoPostBackOnFilter="True" DataNavigateUrlFields="Ticket_Id" DataNavigateUrlFormatString="ManageTicket.aspx?id={0}" DataTextField="Ticket_Id" FilterCheckListEnableLoadOnDemand="True" FilterControlAltText="Filter Ticket_Id column" HeaderText="Id" meta:resourceKey="GridHyperLinkColumnResource2" UniqueName="Ticket_Id">
                                                           <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                           <ItemStyle Font-Bold="True" Font-Size="Larger" Font-Underline="True" ForeColor="CadetBlue" HorizontalAlign="Center" />
                                                       </telerik:GridHyperLinkColumn>
                                                       <telerik:GridBoundColumn DataField="userName" FilterControlAltText="Filter userName column" HeaderText="User" meta:resourceKey="GridBoundColumnResource18" UniqueName="userName">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" meta:resourceKey="GridBoundColumnResource19" UniqueName="Status">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Priority" FilterControlAltText="Filter Priority column" HeaderText="Priority" meta:resourceKey="GridBoundColumnResource20" UniqueName="Priority">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Type_Name" FilterControlAltText="Filter Type_Name column" HeaderText="Type" meta:resourceKey="GridBoundColumnResource21" UniqueName="Type_Name">
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Application_Name" FilterControlAltText="Filter Application_Name column" HeaderText="Application" meta:resourceKey="GridBoundColumnResource22" UniqueName="Application_Name">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Issue_Details" FilterControlAltText="Filter Issue_Details column" FilterControlWidth="100px" HeaderText="Issue Details" meta:resourceKey="GridBoundColumnResource23" UniqueName="Issue_Details">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Created_Time" FilterControlAltText="Filter Created_Time column" HeaderText="Created Time" meta:resourceKey="GridBoundColumnResource24" UniqueName="Created_Time" Visible="False">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Updated_Time" FilterControlAltText="Filter Updated_Time column" HeaderText="Closed" meta:resourceKey="GridBoundColumnResource25" UniqueName="Updated_Time" Visible="False">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="createdDays" FilterControlAltText="Filter createdDays column" HeaderText="Created before(Days)" meta:resourceKey="GridBoundColumnResource26" UniqueName="createdDays">
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
                                           <telerik:RadPageView ID="RadPageView3" runat="server" meta:resourceKey="RadPageView3Resource2">
              <br />
                                                 <div class="content table-responsive table-full-width">
                                           <telerik:radgrid id="rgClosedTicket" runat="server" allowfilteringbycolumn="True"  AutoGenerateColumns="False"  OnNeedDataSource="rgClosedTicket_NeedDataSource" Skin="Simple" cellspacing="-1" gridlines="Both" OnItemDataBound="rgClosedTicket_ItemDataBound" CssClass="text-center" meta:resourceKey="rgClosedTicketResource2" >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="False"></GroupingSettings>
                                                    <ExportSettings ExportOnlyData="True" IgnorePaging="True" FileName=" Department Close Tickets Report"> 
                                                        <Excel Format="ExcelML" />
                                               </ExportSettings>
                                            <ClientSettings>
                                                 <Scrolling AllowScroll="True" UseStaticHeaders="True"></Scrolling>
                                            </ClientSettings>
                                               <AlternatingItemStyle BackColor="LightGray" />
                                               <MasterTableView CommandItemDisplay="Top">
                                                   <CommandItemSettings ShowAddNewRecordButton="False" ShowExportToExcelButton="True" ShowRefreshButton="False" />
                                                   <Columns>
                                                       <telerik:GridHyperLinkColumn AllowSorting="False" AutoPostBackOnFilter="True" DataNavigateUrlFields="Ticket_Id" DataNavigateUrlFormatString="ManageTicket.aspx?id={0}" DataTextField="Ticket_Id" FilterCheckListEnableLoadOnDemand="True" FilterControlAltText="Filter Ticket_Id column" HeaderText="Id" meta:resourceKey="GridHyperLinkColumnResource3" UniqueName="Ticket_Id">
                                                           <HeaderStyle Font-Bold="True" HorizontalAlign="Center" VerticalAlign="Middle" />
                                                           <ItemStyle Font-Bold="True" Font-Size="Larger" Font-Underline="True" ForeColor="CadetBlue" HorizontalAlign="Center" />
                                                       </telerik:GridHyperLinkColumn>
                                                       <telerik:GridBoundColumn DataField="Ticket_Id" FilterControlAltText="Filter Ticket_Id1 column" HeaderText="Id" meta:resourceKey="GridBoundColumnResource27" UniqueName="Ticket_Id1">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                           <ItemStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="userName" FilterControlAltText="Filter userName column" HeaderText="User" meta:resourceKey="GridBoundColumnResource28" UniqueName="userName">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Status" FilterControlAltText="Filter Status column" HeaderText="Status" meta:resourceKey="GridBoundColumnResource29" UniqueName="Status">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Priority" FilterControlAltText="Filter Priority column" HeaderText="Priority" meta:resourceKey="GridBoundColumnResource30" UniqueName="Priority">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Type_Name" FilterControlAltText="Filter Type_Name column" HeaderText="Type" meta:resourceKey="GridBoundColumnResource31" UniqueName="Type_Name">
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Application_Name" FilterControlAltText="Filter Application_Name column" HeaderText="Application" meta:resourceKey="GridBoundColumnResource32" UniqueName="Application_Name">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="Issue_Details" FilterControlAltText="Filter Issue_Details column" FilterControlWidth="100px" HeaderText="Issue Details" meta:resourceKey="GridBoundColumnResource33" UniqueName="Issue_Details">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridDateTimeColumn DataField="Created_Time" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" EnableTimeIndependentFiltering="True" FilterControlAltText="Filter Created_Time column" FilterControlWidth="100px" HeaderText="Created Time" meta:resourceKey="GridDateTimeColumnResource3" SortExpression="Created_Time" UniqueName="Created_Time">
                                                       </telerik:GridDateTimeColumn>
                                                       <telerik:GridDateTimeColumn DataField="Updated_Time" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" EnableTimeIndependentFiltering="True" FilterControlAltText="Filter Updated_Time column" FilterControlWidth="100px" HeaderText="Closed At" meta:resourceKey="GridDateTimeColumnResource4" SortExpression="Updated_Time" UniqueName="Updated_Time">
                                                       </telerik:GridDateTimeColumn>
                                                       <telerik:GridBoundColumn DataField="closedDays" FilterControlAltText="Filter closedDays column" HeaderText="Closed in(Days)" meta:resourceKey="GridBoundColumnResource34" UniqueName="closedDays">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                           <ItemStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="hours" FilterControlAltText="Filter hours column" HeaderText="Time Spent(Hours.Min)" meta:resourceKey="GridBoundColumnResource35" UniqueName="hours">
                                                           <HeaderStyle HorizontalAlign="Center" />
                                                           <ItemStyle HorizontalAlign="Center" />
                                                       </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="isValid" FilterControlAltText="Filter isValid column" HeaderText="Is Valid?" meta:resourceKey="GridBoundColumnResource36" UniqueName="isValid">
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

