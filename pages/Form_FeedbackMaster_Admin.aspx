<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="Form_FeedbackMaster_Admin.aspx.cs" Inherits="pages_Form_FeedbackMaster_Admin" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>




<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>User Feedback</title>
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
    <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="User Feedbacks"></asp:Label>
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
                                            <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="User Feedbacks"></asp:Label>
                                        </h4>
                                      
                                    </div>

                                 

                                    <div class="content table-responsive table-full-width">
                                          <telerik:radgrid id="rgUserFeedback" runat="server" allowfilteringbycolumn="True" AutoGenerateColumns="False"  OnNeedDataSource="rgUserFeedback_NeedDataSource" Skin="Simple"  ActiveItemStyle-Wrap="true"  cellspacing="-1" gridlines="Both" ItemStyle-BackColor="LightGray" AlternatingItemStyle-BackColor="LightGray" FilterItemStyle-CssClass="text-center"  ShowGroupPanel="True"  AllowDragToGroup="True"  ClientSettings-AllowDragToGroup="true" GroupingSettings-CaseSensitive="false" meta:resourcekey="rgUserFeedbackResource1" >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                                <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName="Admin Feedback Report" > 
<Excel Format="ExcelML"></Excel>
                                              </ExportSettings>

<AlternatingItemStyle BackColor="LightGray"></AlternatingItemStyle>

                                            <MasterTableView CommandItemDisplay="Top">
                                                <CommandItemSettings ShowAddNewRecordButton="false" ShowExportToExcelButton="true" ShowRefreshButton="false"/>
                                                <Columns>
                                             
                                                         <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Type_Name" HeaderText="Type" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource1"  >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                         </telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Ticket_Id" HeaderText="Ticket Id" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource2"  >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                         </telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Feedback" HeaderText="Feedback" DataType="System.String" meta:resourcekey="GridBoundColumnResource3"  >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                         </telerik:GridBoundColumn>
                                               <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Created_Time" HeaderText="Feedback Time"  DataType="System.String" Visible="false" meta:resourcekey="GridBoundColumnResource4" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                         </telerik:GridBoundColumn>
                                                      <telerik:GridDateTimeColumn DataField="Created_Time" AllowFiltering="true" HeaderText="Feedback Time"
                                                    SortExpression="Date_of_PITCH_Validation" EnableTimeIndependentFiltering="true"  PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss}" meta:resourcekey="GridDateTimeColumnResource1">
                                                </telerik:GridDateTimeColumn>

                                                      <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="userName" HeaderText="Ticket Owner"  DataType="System.String" meta:resourcekey="GridBoundColumnResource5" >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                         </telerik:GridBoundColumn>
                                                     
                                              
                                
                              
                               
                                                    
                                                </Columns>
                                                 <GroupByExpressions>
                    <telerik:GridGroupByExpression>
                        <GroupByFields>
                            <telerik:GridGroupByField FieldName="Type_Name" meta:resourcekey="GridGroupByFieldResource2"></telerik:GridGroupByField>
                        </GroupByFields>
                        <SelectFields>
                            <telerik:GridGroupByField FieldName="Type_Name" HeaderText="Type Name" meta:resourcekey="GridGroupByFieldResource1"></telerik:GridGroupByField>
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


    

    <script type="text/javascript">
        $(document).ready(function () {

            demo.initChartist();
        });



	</script>

    
</asp:Content>

