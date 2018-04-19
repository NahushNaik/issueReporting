<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="Form_Wrong_Ticket.aspx.cs" Inherits="pages_Form_Wrong_Ticket" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Ticket logs</title>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BodyStart" runat="Server">
     <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
        <Scripts>
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
            <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
        </Scripts>
    </telerik:RadScriptManager>
     <telerik:RadWindowManager ID="rmw1" runat="server" meta:resourcekey="rmw1Resource1">
    </telerik:RadWindowManager>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body1" runat="Server">
    <a class="navbar-brand" href="#">
    <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="Ticket Logs"></asp:Label>
    </a>
&nbsp;
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">
                                            <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="Ticket Logs"></asp:Label>
                                        </h4>
                                          <p class="category">
                                              <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="Wrongly raised ticket Logs From ticket Creation to ticket Closed "></asp:Label>
                                        </p>
                                        <p class="category"></p>
                                    </div>

                                 

                                    <div class="content table-responsive table-full-width" style="overflow:scroll">
                                     <telerik:radgrid id="rgTicketLogs" runat="server" allowfilteringbycolumn="True" AutoGenerateColumns="False"  OnNeedDataSource="rgTicketLogs_NeedDataSource" Skin="Simple"  ActiveItemStyle-Wrap="true"  cellspacing="-1" gridlines="Both" ItemStyle-BackColor="LightGray" AlternatingItemStyle-BackColor="LightGray" FilterItemStyle-CssClass="text-center"   GroupingSettings-CaseSensitive="false"  ShowGroupPanel="True"  AllowDragToGroup="True"  ClientSettings-AllowDragToGroup="true" AllowPaging="True" MasterTableView-PageSize="50" meta:resourcekey="rgTicketLogsResource1" >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                                <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName="Update Ticket Log Report" > 
<Excel Format="ExcelML"></Excel>
                                            </ExportSettings>

<AlternatingItemStyle BackColor="LightGray"></AlternatingItemStyle>

                                            <MasterTableView CommandItemDisplay="Top">
                                                <CommandItemSettings ShowAddNewRecordButton="false" ShowExportToExcelButton="true" ShowRefreshButton="false"/>
                                                <Columns>
                                             
                                                         <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Ticket_Id" HeaderText="Ticket Id" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource1"  >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                         </telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="AuditAction" HeaderText="Action" ItemStyle-HorizontalAlign="Center" DataType="System.String" FilterControlWidth="100px" meta:resourcekey="GridBoundColumnResource2"   >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                         </telerik:GridBoundColumn>
                                                      <telerik:GridDateTimeColumn DataField="AuditDate" AllowFiltering="true" HeaderText="Action Time"
                                                    SortExpression="AuditDate" EnableTimeIndependentFiltering="true"  PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"  FilterControlWidth="100px" Visible="false" meta:resourcekey="GridDateTimeColumnResource1">
                                                </telerik:GridDateTimeColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Type_Name" HeaderText="Type" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource3"  >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                         </telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Application_Name" HeaderText="Application" DataType="System.String" meta:resourcekey="GridBoundColumnResource4"  >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                         </telerik:GridBoundColumn>
                                               <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Issue_Name" HeaderText="Issue Name"  DataType="System.String" meta:resourcekey="GridBoundColumnResource5"  >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                         </telerik:GridBoundColumn>

                                                     <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Issue_Details" HeaderText="Issue Details"  DataType="System.String" FilterControlWidth="100px" meta:resourcekey="GridBoundColumnResource6"  >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                         </telerik:GridBoundColumn>
                                                      <telerik:GridDateTimeColumn DataField="Created_Time" AllowFiltering="true" HeaderText="Created Time"
                                                    SortExpression="Date_of_PITCH_Validation" EnableTimeIndependentFiltering="true"  PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"  FilterControlWidth="100px" meta:resourcekey="GridDateTimeColumnResource2">
                                                </telerik:GridDateTimeColumn>
                                                     <telerik:GridDateTimeColumn DataField="Updated_Time" AllowFiltering="true" HeaderText="Closing Time"
                                                    SortExpression="Updated_Time" EnableTimeIndependentFiltering="true"  PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"  FilterControlWidth="100px" meta:resourcekey="GridDateTimeColumnResource3">
                                                </telerik:GridDateTimeColumn>

                                                      <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="ReassignRemark" Visible="false" HeaderText="Reason"  DataType="System.String" meta:resourcekey="GridBoundColumnResource7" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                         </telerik:GridBoundColumn>
                                                     
                                              
                                
                              
                               
                                                    
                                                </Columns>
                                           <GroupByExpressions>
                    <telerik:GridGroupByExpression>
                        <GroupByFields>
                            <telerik:GridGroupByField FieldName="Ticket_Id" meta:resourcekey="GridGroupByFieldResource2"></telerik:GridGroupByField>
                        </GroupByFields>
                        <SelectFields>
                            <telerik:GridGroupByField FieldName="Ticket_Id" HeaderText="Ticket Id" meta:resourcekey="GridGroupByFieldResource1"></telerik:GridGroupByField>
                        </SelectFields>
                    </telerik:GridGroupByExpression>
                </GroupByExpressions>

                                            </MasterTableView>
                                            <ClientSettings>
                                                <Resizing AllowColumnResize="false" ResizeGridOnColumnResize="false" AllowResizeToFit="false" />
                                            </ClientSettings>


<FilterItemStyle CssClass="text-center"></FilterItemStyle>

<ActiveItemStyle Wrap="True"></ActiveItemStyle>

<ItemStyle BackColor="LightGray"></ItemStyle>


                                        </telerik:radgrid>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>

              
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">


    

  
</asp:Content>

