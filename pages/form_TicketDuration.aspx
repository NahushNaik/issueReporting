<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/pages/UserMaster.master"  CodeFile="form_TicketDuration.aspx.cs" Inherits="pages_form_TicketDuration" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>



<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
    <a class="navbar-brand" href="#">View Tickets</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card">
                                    
                                    <div  style="margin: 10px 0px 0px 20px;" class="title">
                                        <asp:DropDownList ID="ddlStatus" runat="server" Visible="False"  AutoPostBack="True" meta:resourcekey="ddlStatusResource1">
                                               <asp:ListItem meta:resourcekey="ListItemResource1"  >All</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource2">Open</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource3" >Closed</asp:ListItem>
                                        </asp:DropDownList>
                     &nbsp; &nbsp; &nbsp;   
                                        <asp:Label Visible="False" ID="Label1" runat="server" Text="From Date:" meta:resourcekey="Label1Resource1"></asp:Label>&nbsp;<telerik:RadDateTimePicker Visible="false" ID="dtpFromDate"  width="120px"  AutoPostBackControl="Calendar" runat="server">  <TimePopupButton Visible="false" /></telerik:RadDateTimePicker>&nbsp;&nbsp;&nbsp;
                                         <asp:Label Visible="False" ID="Label2" runat="server" Text="To Date:" meta:resourcekey="Label2Resource1"></asp:Label>&nbsp;<telerik:RadDateTimePicker ID="dtpToDate" Visible="false" width="122px" AutoPostBackControl="Calendar"  runat="server">  <TimePopupButton Visible="false" /></telerik:RadDateTimePicker>
                                      
                                    </div>

                                    <div class="content table-responsive table-full-width">
                                        <telerik:radgrid id="rgTickets" runat="server"  onitemdatabound="rgTickets_ItemDataBound" AutoGenerateColumns="False" MasterTableView-AllowFilteringByColumn="true" ActiveItemStyle-Wrap="true" skin="Simple" cellspacing="-1" gridlines="Both"  >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                      

                                                  <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName=" View Tickets Report"> </ExportSettings>
                                               <MasterTableView AllowFilteringByColumn="True" CommandItemDisplay="Top" >
                                                  <CommandItemSettings ShowExportToCsvButton="false" ShowRefreshButton="false" ShowAddNewRecordButton="false" ShowExportToExcelButton="true" />

                                                <Columns>
                                                     <telerik:GridHyperLinkColumn  HeaderStyle-Font-Bold="true" DataNavigateUrlFields="Ticket No" DataType="System.String" 
                                   DataNavigateUrlFormatString="ManageTicket.aspx?id={0}" HeaderText="Id" AutoPostBackOnFilter="false"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"  ItemStyle-ForeColor="CadetBlue" ItemStyle-Font-Size="Larger" FilterCheckListEnableLoadOnDemand="true" DataTextField="Ticket No" ItemStyle-Font-Underline="true" >
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="True"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" Font-Bold="True" Font-Size="Larger" Font-Underline="True" ForeColor="CadetBlue"></ItemStyle>
                                                     </telerik:GridHyperLinkColumn>
                                               
                                                     <telerik:GridBoundColumn DataField="Status" HeaderText="Status" DataType="System.String"  AutoPostBackOnFilter="false" ></telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="User_Email" HeaderText="User" DataType="System.String"  AutoPostBackOnFilter="false" ></telerik:GridBoundColumn>
                                                    
                                                
                                                     <telerik:GridBoundColumn DataField="Priority" DataType="System.String"  HeaderText="Priority" AutoPostBackOnFilter="false"  ></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Type Name" DataType="System.String" HeaderText="Type" AutoPostBackOnFilter="false"  ></telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn DataField="Application Name" HeaderText="Application" AutoPostBackOnFilter="false" DataType="System.String"   ></telerik:GridBoundColumn>
  <telerik:GridBoundColumn DataField="Created Time" DataType="System.String"  HeaderText="Created Date" AutoPostBackOnFilter="false"  ></telerik:GridBoundColumn>   


                                                    <telerik:GridDateTimeColumn DataField="Created Time" AllowFiltering="true" HeaderText="Created Time"
                                                   EnableTimeIndependentFiltering="true"  PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy}">
                                                </telerik:GridDateTimeColumn>
                                                     <telerik:GridBoundColumn DataField="Updated_Time" DataType="System.String"  HeaderText="Updated Time" AutoPostBackOnFilter="false"  ></telerik:GridBoundColumn>                                                    
                                                    
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings>
                                                <Resizing AllowColumnResize="false" ResizeGridOnColumnResize="false" AllowResizeToFit="false" />
                                            </ClientSettings>

<ActiveItemStyle Wrap="True"></ActiveItemStyle>
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
           for (var i = 0; i < columns.length - 1; i++) {
               columns[i].resizeToFit();
           }
       }

	</script>
</asp:Content>

