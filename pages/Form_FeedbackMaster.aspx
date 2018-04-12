<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="Form_FeedbackMaster.aspx.cs" Inherits="pages_Form_FeedbackMaster" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>


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
    <a class="navbar-brand" href="#">User Feedback</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">User Feedbacks</h4>
                                      
                                    </div>

                                 

                                    <div class="content table-responsive table-full-width">
                                          <telerik:radgrid id="rgUserFeedback" runat="server" allowfilteringbycolumn="true" AutoGenerateColumns="false"  OnNeedDataSource="rgUserFeedback_NeedDataSource" Skin="Simple"  ActiveItemStyle-Wrap="true"  cellspacing="-1" gridlines="Both" ItemStyle-BackColor="LightGray" AlternatingItemStyle-BackColor="LightGray" FilterItemStyle-CssClass="text-center"  GroupingEnabled="true"  ShowGroupPanel="True"  AllowDragToGroup="True"  ClientSettings-AllowDragToGroup="true" GroupingSettings-CaseSensitive="false"  >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                                <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName="User Feedback Report" > </ExportSettings>
                                            <MasterTableView CommandItemDisplay="Top">
                                                <CommandItemSettings ShowExportToExcelButton="true" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                                                <Columns>
                                             

                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Type_Name" HeaderText="Type" ItemStyle-HorizontalAlign="Center" DataType="System.String"  ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Ticket_Id" HeaderText="Ticket Id" ItemStyle-HorizontalAlign="Center" DataType="System.String"  ></telerik:GridBoundColumn>
                                                     <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Feedback" HeaderText="Feedback" DataType="System.String"  ></telerik:GridBoundColumn>
                                               <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="Created_Time" HeaderText="Feedback Time"  DataType="System.String" Visible="false" ></telerik:GridBoundColumn>

                                                     <telerik:GridDateTimeColumn DataField="Created_Time" AllowFiltering="true" HeaderText="Feedback Time"
                                                    SortExpression="Date_of_PITCH_Validation" EnableTimeIndependentFiltering="true"  PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy HH:mm:ss }">
                                                </telerik:GridDateTimeColumn>

                                                      <telerik:GridBoundColumn HeaderStyle-HorizontalAlign="Center" DataField="userName" HeaderText="Ticket Owner"  DataType="System.String" ></telerik:GridBoundColumn>
                                
                              
                               
                                                    
                                                </Columns>
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


    

    <script type="text/javascript">
        $(document).ready(function () {

            demo.initChartist();
        });



	</script>

    
</asp:Content>

