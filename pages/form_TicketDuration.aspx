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
    <a class="navbar-brand" href="#">
    <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="View Tickets"></asp:Label>
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
                                            <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="Tickets"></asp:Label>
                                         </h4>
                                        <p class="category">
                                            <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="Select Appropriate Filter"></asp:Label>
                                         </p>
                                    </div>
                                    
                                    <div  style="margin: 10px 0px 0px 20px;" class="title">
                                        <asp:DropDownList ID="ddlStatus" runat="server" Visible="False"  AutoPostBack="True" meta:resourcekey="ddlStatusResource1">
                                               <asp:ListItem meta:resourcekey="ListItemResource1"  >All</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource2">Open</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource3" >Closed</asp:ListItem>
                                        </asp:DropDownList>

                                        
                                          <asp:DropDownList ID="ddlMenu" runat="server" meta:resourcekey="ddlMenuResource1" >
                                            <asp:ListItem meta:resourcekey="ListItemResource4">Created Time</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource5">Ticket No</asp:ListItem>
                                            <asp:ListItem meta:resourcekey="ListItemResource6">Priority</asp:ListItem>
                                        </asp:DropDownList>
                                             <asp:DropDownList ID="ddlOrder" runat="server" meta:resourcekey="ddlOrderResource1" >
                                            <asp:ListItem Value="desc" meta:resourcekey="ListItemResource7">Descending </asp:ListItem>
                                            <asp:ListItem Value="asc" meta:resourcekey="ListItemResource8">Ascending</asp:ListItem>
                                            
                                        </asp:DropDownList>


                      
                                        <asp:Label Visible="False" ID="Label1" runat="server" Text="From Date:" meta:resourcekey="Label1Resource1"></asp:Label>&nbsp;<telerik:RadDateTimePicker Visible="False" ID="dtpFromDate"  width="120px"  AutoPostBackControl="Calendar" runat="server" AutoPostBack="True" Culture="en-US" meta:resourcekey="dtpFromDateResource1">  
<TimeView CellSpacing="-1" Culture="en-IN">
    <HeaderTemplate>
        Time Picker
    </HeaderTemplate>
    <TimeTemplate>
        <a runat="server" href="#"></a>
    </TimeTemplate>
                                            </TimeView>

                                            <TimePopupButton Visible="false" />

<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="dd-MM-yyyy" DateFormat="dd-MM-yyyy" AutoPostBack="True" LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                                        </telerik:RadDateTimePicker>
                                         <asp:Label Visible="False" ID="Label2" runat="server" Text="To Date:" meta:resourcekey="Label2Resource1"></asp:Label>&nbsp;<telerik:RadDateTimePicker ID="dtpToDate" Visible="False" width="122px" AutoPostBackControl="Calendar"  runat="server" AutoPostBack="True" Culture="en-US" meta:resourcekey="dtpToDateResource1">  
<TimeView CellSpacing="-1" Culture="en-IN">
    <HeaderTemplate>
        Time Picker
    </HeaderTemplate>
    <TimeTemplate>
        <a runat="server" href="#"></a>
    </TimeTemplate>
                                            </TimeView>

                                            <TimePopupButton Visible="false" />

<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;"></Calendar>

<DateInput DisplayDateFormat="dd-MM-yyyy" DateFormat="dd-MM-yyyy" AutoPostBack="True" LabelWidth="64px" Width="">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl="" CssClass=""></DatePopupButton>
                                        </telerik:RadDateTimePicker>
                                            <asp:Button ID="btnFilterApply" runat="server" OnClick="btnApply_Click"  Text="Apply" meta:resourcekey="btnFilterApplyResource1" />
                                    </div>

                                    <div class="content table-responsive table-full-width" >
                                        <telerik:radgrid id="rgTickets" runat="server"  onitemdatabound="rgTickets_ItemDataBound" AutoGenerateColumns="False" MasterTableView-AllowFilteringByColumn="true" ActiveItemStyle-Wrap="true" skin="Simple" cellspacing="-1" gridlines="Both" meta:resourcekey="rgTicketsResource1"  >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                      

                                                  <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName=" View Tickets Report"> 
<Excel Format="ExcelML"></Excel>
                                            </ExportSettings>
                                               <MasterTableView AllowFilteringByColumn="True" CommandItemDisplay="Top" >
                                                  <CommandItemSettings ShowExportToCsvButton="false" ShowRefreshButton="false" ShowAddNewRecordButton="false" ShowExportToExcelButton="true" />

                                                <Columns>
                                                     <telerik:GridHyperLinkColumn  HeaderStyle-Font-Bold="true" DataNavigateUrlFields="Ticket No" DataType="System.String" 
                                   DataNavigateUrlFormatString="ManageTicket.aspx?id={0}" HeaderText="Id" AutoPostBackOnFilter="false"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"  ItemStyle-ForeColor="CadetBlue" ItemStyle-Font-Size="Larger" FilterCheckListEnableLoadOnDemand="true" DataTextField="Ticket No" ItemStyle-Font-Underline="true" meta:resourcekey="GridHyperLinkColumnResource1" >
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Bold="True"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" Font-Bold="True" Font-Size="Larger" Font-Underline="True" ForeColor="CadetBlue"></ItemStyle>
                                                     </telerik:GridHyperLinkColumn>
                                               
                                                     <telerik:GridBoundColumn DataField="Status" HeaderText="Status" DataType="System.String"  AutoPostBackOnFilter="false" meta:resourcekey="GridBoundColumnResource1" ></telerik:GridBoundColumn>
                                                       <telerik:GridBoundColumn DataField="User_Email" HeaderText="User" DataType="System.String"  AutoPostBackOnFilter="false" meta:resourcekey="GridBoundColumnResource2" ></telerik:GridBoundColumn>
                                                    
                                                
                                                     <telerik:GridBoundColumn DataField="Priority" DataType="System.String"  HeaderText="Priority" AutoPostBackOnFilter="false" meta:resourcekey="GridBoundColumnResource3"  ></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Type Name" DataType="System.String" HeaderText="Type" AutoPostBackOnFilter="false" meta:resourcekey="GridBoundColumnResource4"  ></telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn DataField="Application Name" HeaderText="Application" AutoPostBackOnFilter="false" DataType="System.String" meta:resourcekey="GridBoundColumnResource5"   ></telerik:GridBoundColumn>
                                                    <telerik:GridBoundColumn DataField="Issue Name" HeaderText="Issue" AutoPostBackOnFilter="false" DataType="System.String" meta:resourcekey="GridBoundColumnResource6"   ></telerik:GridBoundColumn>

                                                     <telerik:GridBoundColumn DataField="Issue Details" HeaderText="Issue Details" AutoPostBackOnFilter="false" DataType="System.String" FilterControlWidth="100px" meta:resourcekey="GridBoundColumnResource7"   ></telerik:GridBoundColumn>
                                                    
  <telerik:GridBoundColumn DataField="Created Time" DataType="System.String"  HeaderText="Created Date" AutoPostBackOnFilter="false" Visible="false" meta:resourcekey="GridBoundColumnResource8"  ></telerik:GridBoundColumn>   


                                                    <telerik:GridDateTimeColumn DataField="Created Time" AllowFiltering="true" HeaderText="Created Time" FilterControlWidth="100px"
                                                   EnableTimeIndependentFiltering="true"  PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy}" meta:resourcekey="GridDateTimeColumnResource1">
                                                </telerik:GridDateTimeColumn>

                                                     
                                                      <telerik:GridDateTimeColumn DataField="Updated_Time" AllowFiltering="true" HeaderText="Updated Time" FilterControlWidth="100px"
                                                   EnableTimeIndependentFiltering="true"  PickerType="DatePicker" DataFormatString="{0:dd/MMM/yyyy}" meta:resourcekey="GridDateTimeColumnResource2">
                                                </telerik:GridDateTimeColumn>

                                                     <telerik:GridBoundColumn DataField="Updated_Time" DataType="System.String"  HeaderText="Updated Time" AutoPostBackOnFilter="false"  Visible="false" meta:resourcekey="GridBoundColumnResource9"></telerik:GridBoundColumn>                                                      <telerik:GridBoundColumn DataField="Hours" DataType="System.String"  HeaderText="Time Spent(Hours.Min)" AutoPostBackOnFilter="false" meta:resourcekey="GridBoundColumnResource10"  ></telerik:GridBoundColumn>  
                                                      <telerik:GridBoundColumn HeaderText="is Valid?" DataType="System.String"  DataField="isValid" AutoPostBackOnFilter="false" meta:resourcekey="GridBoundColumnResource11"  ></telerik:GridBoundColumn> 
                                                    
                                                </Columns>
                                            </MasterTableView>
                                                <ClientSettings>
                                                 <Scrolling AllowScroll="True" UseStaticHeaders="True" SaveScrollPosition="true"></Scrolling>
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

