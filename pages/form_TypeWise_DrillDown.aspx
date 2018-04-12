<%@ Page Language="C#" AutoEventWireup="true" CodeFile="form_TypeWise_DrillDown.aspx.cs" Inherits="pages_form_TypeWise_DrillDown"  MasterPageFile="~/pages/UserMaster.master" culture="auto" meta:resourcekey="PageResource1" uiculture="auto"  %>




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
    <a class="navbar-brand" href="#">Type Wise Reports</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card" style="overflow: scroll;">
                                 
                                    <asp:Label ID="lblType" Font-Bold="True" Font-Size="30px" runat="server" Text="0" meta:resourcekey="lblTypeResource1"></asp:Label>
                                    <br />
                                    <telerik:RadTabStrip SelectedIndex="0" ID="tabStrip" MultiPageID="RadMultiPage1" runat="server"  Skin="Silk">
                                        <Tabs>
                <telerik:RadTab Text="Summary" Width="200px"></telerik:RadTab>
               <telerik:RadTab Text="Open Ticket" Width="200px"></telerik:RadTab>
                 <telerik:RadTab Text="Closed Ticket" Width="200px"></telerik:RadTab>

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
                                                <telerik:radgrid id="rgvDetails" runat="server" allowfilteringbycolumn="true" AutoGenerateColumns="false"  OnNeedDataSource="rgvDetails_NeedDataSource" Skin="Simple"  ActiveItemStyle-Wrap="true" OnItemDataBound="rgvDetails_ItemDataBound"  cellspacing="-1" gridlines="Both" ItemStyle-BackColor="LightGray" AlternatingItemStyle-BackColor="LightGray"  >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                                     <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName=" Type Wise Open Tickets Report"> </ExportSettings>
                                               <MasterTableView CommandItemDisplay="Top" >
                                                  <CommandItemSettings ShowExportToCsvButton="false" ShowRefreshButton="false" ShowAddNewRecordButton="false" ShowExportToExcelButton="true" />
                                                <Columns>
                                                 <telerik:GridHyperLinkColumn  HeaderStyle-Font-Bold="true" DataNavigateUrlFields="Ticket_Id"  DataNavigateUrlFormatString="ManageTicket.aspx?id={0}" HeaderText="Id"  AutoPostBackOnFilter="true"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"  ItemStyle-ForeColor="CadetBlue" ItemStyle-Font-Size="Larger" FilterCheckListEnableLoadOnDemand="true" DataTextField="Ticket_Id" ItemStyle-Font-Underline="true" DataType="System.String" ></telerik:GridHyperLinkColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Status" HeaderText="Status"  ></telerik:GridBoundColumn>
                                               <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="userName" HeaderText="User"   ></telerik:GridBoundColumn>
                                                     
                                                    <telerik:GridBoundColumn DataField="Type_Name" HeaderText="Type" visible="false"  ></telerik:GridBoundColumn>
                                
                                 <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="Application_Name" HeaderText="Application" ></telerik:GridBoundColumn>
                                
                                 <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"   DataField="Priority" HeaderText="Priority"  ></telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="Created_Time" HeaderText="Created Time" visible="false" ></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="Updated_Time" HeaderText="Closed" Visible="false"  ></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="createdDays" HeaderText="Created Before(Days)" ItemStyle-HorizontalAlign="Center"  DataType="System.String"  ></telerik:GridBoundColumn>
                                                        
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
                                                <telerik:radgrid id="rgClosedTicket" runat="server" allowfilteringbycolumn="true" AutoGenerateColumns="false"  OnNeedDataSource="rgClosedTicket_NeedDataSource" Skin="Simple"  ActiveItemStyle-Wrap="true" OnItemDataBound="rgClosedTicket_ItemDataBound"  cellspacing="-1" gridlines="Both" ItemStyle-BackColor="LightGray" AlternatingItemStyle-BackColor="LightGray"  >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                          <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName=" Type Wise Close Tickets Report"> </ExportSettings>
                                               <MasterTableView CommandItemDisplay="Top" >
                                                  <CommandItemSettings ShowExportToCsvButton="false" ShowRefreshButton="false" ShowAddNewRecordButton="false" ShowExportToExcelButton="true" />
                                                <Columns>
                                             

                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataType="System.String" DataField="Ticket_Id" HeaderText="Id" ItemStyle-HorizontalAlign="Center" ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Status" HeaderText="Status"  ></telerik:GridBoundColumn>
                                               <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="userName" HeaderText="User"   ></telerik:GridBoundColumn>
                                                     
                                                    <telerik:GridBoundColumn DataField="Type_Name" HeaderText="Type" visible="false"  ></telerik:GridBoundColumn>
                                
                                 <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="Application_Name" HeaderText="Application" ></telerik:GridBoundColumn>
                                
                                 <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"   DataField="Priority" HeaderText="Priority"  ></telerik:GridBoundColumn>
                                                    
                                <%-- <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="Created_Time" HeaderText="Created Time" Visible="true"  ></telerik:GridBoundColumn>--%>

                                                         <telerik:GridDateTimeColumn DataField="Created_Time" AllowFiltering="true" HeaderText="Created Time"  FilterControlWidth="100px"
                                                    SortExpression="Created_Time" EnableTimeIndependentFiltering="true"  UniqueName="Created_Time" PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                                </telerik:GridDateTimeColumn>

                                                    <telerik:GridDateTimeColumn DataField="Updated_Time" AllowFiltering="true" HeaderText="Closed Time" FilterControlWidth="100px"
                                                    SortExpression="Updated_Time" EnableTimeIndependentFiltering="true"  UniqueName="Updated_Time" PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}">
                                                </telerik:GridDateTimeColumn>
                                                  <%--  <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="Updated_Time" HeaderText="Closed Time"  ></telerik:GridBoundColumn>--%>
                                                    <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="closedDays" HeaderText="Closed In(Days)" ItemStyle-HorizontalAlign="Center"  DataType="System.String" ></telerik:GridBoundColumn>
                                 <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="hours" HeaderText="Time Spent(Hours.Min)" ItemStyle-HorizontalAlign="Center"  DataType="System.String" ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center"  DataField="isValid" HeaderText="Is Valid?" ItemStyle-HorizontalAlign="Center"  DataType="System.String" ></telerik:GridBoundColumn>
                                                    
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

              
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">


    

 
</asp:Content>


