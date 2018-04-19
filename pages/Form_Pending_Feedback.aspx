﻿<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="Form_Pending_Feedback.aspx.cs" Inherits="pages_Form_Pending_Feedback" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>


<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Pending Feedback</title>
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
    <asp:Label ID="Label2" runat="server" meta:resourcekey="Label2Resource1" Text="Pending Feedback"></asp:Label>
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
                                            <asp:Label ID="Label1" runat="server" meta:resourcekey="Label1Resource1" Text="Please Select Appropriate Feedback"></asp:Label>
                                        </h4>
                                      
                                    </div>

                                 

                                    <div class="content table-responsive table-full-width">
                                          <telerik:radgrid id="rgUserFeedback" runat="server" AutoGenerateColumns="False"  OnNeedDataSource="rgUserFeedback_NeedDataSource" Skin="Simple"  ActiveItemStyle-Wrap="true"  cellspacing="-1" gridlines="Both" ItemStyle-BackColor="White" AlternatingItemStyle-BackColor="White" FilterItemStyle-CssClass="text-center"  HeaderStyle-Font-Size="Medium"  HeaderStyle-CssClass="text-center" meta:resourcekey="rgUserFeedbackResource1" >
                                            <GroupingSettings CollapseAllTooltip="Collapse all groups" CaseSensitive="false"></GroupingSettings>
                                               
<AlternatingItemStyle BackColor="White"></AlternatingItemStyle>

                                            <MasterTableView CommandItemDisplay="Top">
                                                <CommandItemSettings ShowExportToExcelButton="false" ShowAddNewRecordButton="false" ShowRefreshButton="false" />
                                                <Columns>
                                             

                                                   
                                                    
                                                  <%-- <telerik:GridHyperLinkColumn   DataNavigateUrlFields="Ticket_Id" DataType="System.String" 
                                   DataNavigateUrlFormatString="userDetails_FeedbackForm.aspx?Ticket_Id={0}&Status=Good" HeaderText="Good Feedback" AutoPostBackOnFilter="false"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"  ItemStyle-ForeColor="CadetBlue" ItemStyle-Font-Size="Larger"  DataTextField="Good" ItemStyle-Font-Underline="true" Target="_Blank" HeaderStyle-BackColor="#3ec63e" >
</telerik:GridHyperLinkColumn>
                                                        
                                                             <telerik:GridHyperLinkColumn   DataNavigateUrlFields="Ticket_Id" DataType="System.String" 
DataNavigateUrlFormatString="userDetails_FeedbackForm.aspx?Ticket_Id={0}&Status=Moderate" HeaderText="Moderate Feedback" AutoPostBackOnFilter="false"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"  ItemStyle-ForeColor="CadetBlue" ItemStyle-Font-Size="Larger"  DataTextField="Moderate" ItemStyle-Font-Underline="true" Target="_Blank"  HeaderStyle-BackColor="#f3f346"   >
                                                                 </telerik:GridHyperLinkColumn>

                                                    <telerik:GridHyperLinkColumn   DataNavigateUrlFields="Ticket_Id" DataType="System.String" 
 DataNavigateUrlFormatString="userDetails_FeedbackForm.aspx?Ticket_Id={0}&Status=Bad" HeaderText="Bad Feedback" AutoPostBackOnFilter="false"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle"  ItemStyle-ForeColor="CadetBlue" ItemStyle-Font-Size="Larger"  DataTextField="Bad" ItemStyle-Font-Underline="true" Target="_Blank" HeaderStyle-BackColor="#e74747">
</telerik:GridHyperLinkColumn>--%>

                                                   
                                                       

                                                 <telerik:GridHyperLinkColumn AllowSorting="False"  FilterControlAltText="Filter view column" ImageUrl="../Images/h.png"  Text="Good" DataNavigateUrlFields="Ticket_Id" DataNavigateUrlFormatString="userDetails_FeedbackForm.aspx?Ticket_Id={0}&Status=Good" HeaderStyle-BackColor="#3ec63e"  HeaderText="Good Feedback"  UniqueName="Good" AllowFiltering="false" ItemStyle-CssClass="text-center"  HeaderStyle-HorizontalAlign="Center" Target="_blank" meta:resourcekey="GridHyperLinkColumnResource1"  >
<HeaderStyle HorizontalAlign="Center" BackColor="#3EC63E"></HeaderStyle>

<ItemStyle CssClass="text-center"></ItemStyle>
                                                    </telerik:GridHyperLinkColumn>
                                                     <telerik:GridHyperLinkColumn AllowSorting="False"  FilterControlAltText="Filter view column" ImageUrl="../Images/m.png"  Text="Moderate" DataNavigateUrlFields="Ticket_Id" DataNavigateUrlFormatString="userDetails_FeedbackForm.aspx?Ticket_Id={0}&Status=Moderate" HeaderStyle-BackColor="#f3f346"   HeaderText="Moderate Feedback"   UniqueName="Moderate" AllowFiltering="false" ItemStyle-CssClass="text-center"  HeaderStyle-HorizontalAlign="Center" Target="_blank" meta:resourcekey="GridHyperLinkColumnResource2" >
<HeaderStyle HorizontalAlign="Center" BackColor="#F3F346"></HeaderStyle>

<ItemStyle CssClass="text-center"></ItemStyle>
                                                    </telerik:GridHyperLinkColumn>
                                                     <telerik:GridHyperLinkColumn AllowSorting="False"  FilterControlAltText="Filter view column" ImageUrl="../Images/s.png"  Text="Bad" DataNavigateUrlFields="Ticket_Id" DataNavigateUrlFormatString="userDetails_FeedbackForm.aspx?Ticket_Id={0}&Status=Bad"  HeaderText="Bad Feedback"   UniqueName="Bad" AllowFiltering="false" HeaderStyle-BackColor="#e74747" ItemStyle-CssClass="text-center"   HeaderStyle-HorizontalAlign="Center" Target="_blank" meta:resourcekey="GridHyperLinkColumnResource3"  >
<HeaderStyle HorizontalAlign="Center" BackColor="#E74747"></HeaderStyle>

<ItemStyle CssClass="text-center"></ItemStyle>
                                                    </telerik:GridHyperLinkColumn>
                                                  

                                                      <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Ticket_Id" HeaderText="Ticket Id" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource1"    >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </telerik:GridBoundColumn>

                                                      <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Type Name" HeaderText="Type Name" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource2"   >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Application Name" HeaderText="Application Name" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource3"   >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Issue Details" HeaderText="Issue Details" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource4"   >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                      <telerik:GridBoundColumn Visible="true" HeaderStyle-HorizontalAlign="Center"  DataField="Issue Name" HeaderText="Issue Name" ItemStyle-HorizontalAlign="Center" DataType="System.String" meta:resourcekey="GridBoundColumnResource5"   >
<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                                                    </telerik:GridBoundColumn>
                                                </Columns>
                                            </MasterTableView>
                                            <ClientSettings>
                                                <Resizing AllowColumnResize="false" ResizeGridOnColumnResize="false" AllowResizeToFit="false" />
                                            </ClientSettings>

<HeaderStyle CssClass="text-center" Font-Size="Medium"></HeaderStyle>

<FilterItemStyle CssClass="text-center"></FilterItemStyle>

<ActiveItemStyle Wrap="True"></ActiveItemStyle>

<ItemStyle BackColor="White"></ItemStyle>
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

