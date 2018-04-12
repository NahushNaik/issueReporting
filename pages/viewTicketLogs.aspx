<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="viewTicketLogs.aspx.cs" Inherits="pages_viewTicketLogs" %>

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
     <telerik:RadWindowManager ID="rmw1" runat="server">
    </telerik:RadWindowManager>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body1" runat="Server">
    <a class="navbar-brand" href="#">Ticket Logs</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Ticket Logs</h4>
                                        <p class="category"></p>
                                    </div>

                                 

                                    <div class="content table-responsive table-full-width" style="overflow:scroll">
                                     <telerik:radgrid id="rgTicketLogs" runat="server" allowfilteringbycolumn="true" AutoGenerateColumns="false"  OnNeedDataSource="rgTicketLogs_NeedDataSource" Skin="Simple"  ActiveItemStyle-Wrap="true"  cellspacing="-1" gridlines="Both" ItemStyle-BackColor="LightGray" AlternatingItemStyle-BackColor="LightGray" FilterItemStyle-CssClass="text-center"   GroupingSettings-CaseSensitive="false" GroupingEnabled="true"  ShowGroupPanel="True"  AllowDragToGroup="True"  ClientSettings-AllowDragToGroup="true" AllowPaging="true" MasterTableView-PageSize="50" >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                                <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName="Update Ticket Log Report" > </ExportSettings>
                                            <MasterTableView CommandItemDisplay="Top">
                                                <CommandItemSettings ShowAddNewRecordButton="false" ShowExportToExcelButton="true" ShowRefreshButton="false"/>
                                                <Columns>
                                             
                                                         <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Ticket_Id" HeaderText="Ticket Id" ItemStyle-HorizontalAlign="Center" DataType="System.String"  ></telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="AuditAction" HeaderText="Action" ItemStyle-HorizontalAlign="Center" DataType="System.String" FilterControlWidth="100px"  ></telerik:GridBoundColumn>
                                                      <telerik:GridDateTimeColumn DataField="AuditDate" AllowFiltering="true" HeaderText="Action Time"
                                                    SortExpression="AuditDate" EnableTimeIndependentFiltering="true"  PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"  FilterControlWidth="100px">
                                                </telerik:GridDateTimeColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Type_Name" HeaderText="Type" ItemStyle-HorizontalAlign="Center" DataType="System.String"  ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Application_Name" HeaderText="Application" DataType="System.String"  ></telerik:GridBoundColumn>
                                               <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Issue_Name" HeaderText="Issue Name"  DataType="System.String"  ></telerik:GridBoundColumn>
                                                      <telerik:GridDateTimeColumn DataField="Created_Time" AllowFiltering="true" HeaderText="Created Time"
                                                    SortExpression="Date_of_PITCH_Validation" EnableTimeIndependentFiltering="true"  PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"  FilterControlWidth="100px">
                                                </telerik:GridDateTimeColumn>
                                                     <telerik:GridDateTimeColumn DataField="Updated_Time" AllowFiltering="true" HeaderText="Updated Time"
                                                    SortExpression="Updated_Time" EnableTimeIndependentFiltering="true"  PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}"  FilterControlWidth="100px">
                                                </telerik:GridDateTimeColumn>

                                                      <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="User_Email" Visible="true" HeaderText="Ticket Owner"  DataType="System.String" ></telerik:GridBoundColumn>
                                                     
                                              
                                
                              
                               
                                                    
                                                </Columns>
                                           <GroupByExpressions>
                    <telerik:GridGroupByExpression>
                        <GroupByFields>
                            <telerik:GridGroupByField FieldName="Ticket_Id"></telerik:GridGroupByField>
                        </GroupByFields>
                        <SelectFields>
                            <telerik:GridGroupByField FieldName="Ticket_Id" HeaderText="Ticket Id"></telerik:GridGroupByField>
                        </SelectFields>
                    </telerik:GridGroupByExpression>
                </GroupByExpressions>

                                            </MasterTableView>
                                            <ClientSettings>
                                                <Resizing AllowColumnResize="false" ResizeGridOnColumnResize="false" AllowResizeToFit="false" />
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


    

  
</asp:Content>


