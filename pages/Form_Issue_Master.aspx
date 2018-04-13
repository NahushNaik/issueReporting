<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="Form_Issue_Master.aspx.cs" Inherits="pages_Form_Issue_Master" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>




<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Issue Master</title>
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
    <asp:Label ID="Label12" runat="server" Text="Issue Master"></asp:Label>
    </a>&nbsp;
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">
                                            <asp:Label ID="Label11" runat="server" Text="Issue Master"></asp:Label>
                                        </h4>
                                        <p class="category"></p>
                                    </div>

                                 

                                    <div class="content table-responsive table-full-width">
                                     <telerik:RadGrid RenderMode="Lightweight" ID="rgIssueMaster" runat="server" AllowPaging="True" AllowSorting="True" AllowFilteringByColumn="True" AutoGenerateColumns="False" OnNeedDataSource="rgIssueMaster_NeedDataSource"  GroupingSettings-CaseSensitive="false" OnItemCommand="rgIssueMaster_ItemCommand" OnInsertCommand="rgIssueMaster_InsertCommand" OnUpdateCommand="rgIssueMaster_UpdateCommand"  OnItemDataBound="rgIssueMaster_ItemDataBound"   Skin="MetroTouch" CellSpacing="-1" GridLines="Both" meta:resourcekey="rgIssueMasterResource1">
                
<GroupingSettings CaseSensitive="False" CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName="Issue_Master">
<Excel Format="ExcelML"></Excel>
                </ExportSettings>
                
                <MasterTableView ClientDataKeyNames="Issue_Id" InsertItemPageIndexAction="ShowItemOnFirstPage" EditMode="InPlace" CommandItemDisplay="Top" DataKeyNames="Issue_Id"  >

                    <CommandItemSettings ShowExportToCsvButton="false" ShowExportToExcelButton="true" />

                    <Columns >
                        <telerik:GridTemplateColumn DataField="Issue_Id" HeaderText="Issue Id" UniqueName="Issue_Id" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left"  DataType="System.String" meta:resourcekey="GridTemplateColumnResource1" >
                            <ItemTemplate>
                                <%# Eval("Issue_Id") %>
                            </ItemTemplate>
                         

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle"></HeaderStyle>
                         

                        </telerik:GridTemplateColumn>


                        <telerik:GridTemplateColumn DataField="Issue_Name" HeaderText="Issue Name" UniqueName="Issue_Name" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left" DataType="System.String" meta:resourcekey="GridTemplateColumnResource2" >

                            <ItemTemplate>

                                <%# Eval("Issue_Name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                              
                                <telerik:RadTextBox RenderMode="Lightweight"   runat="server" ID="txtIssueName" Text='<%# Eval("Issue_Name") %>' LabelCssClass="" LabelWidth="64px" meta:resourcekey="txtIssueNameResource1" Resize="None" >
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadTextBox>
                                  <asp:Label ID="Label10" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label10Resource1"></asp:Label>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtIssueName" ForeColor="Red" ErrorMessage="Issue Name required" Display="Dynamic" meta:resourcekey="RequiredFieldValidator13Resource1"></asp:RequiredFieldValidator>
                                
                            </EditItemTemplate>

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle"></HeaderStyle>

                        </telerik:GridTemplateColumn>



                        
                        <telerik:GridTemplateColumn HeaderText="Type Name" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left" UniqueName="Type_Name" DataField="Type_Name"  FilterControlWidth="100px" HeaderStyle-Width="200px"  DataType="System.String" meta:resourcekey="GridTemplateColumnResource3">
                            <ItemTemplate>
                                <%# Eval("Type_Name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                               
                                 <telerik:RadComboBox RenderMode="Lightweight"  runat="server" ID="ddlType" DataValueField="Type_Id" 
                                    DataTextField="Type_Name" AutoPostBack="True"  EnableLoadOnDemand="True" OnSelectedIndexChanged="ddlType_SelectedIndexChanged1" EmptyMessage="Select Type" CausesValidation="False"     Width="128px" meta:resourcekey="ddlTypeResource1"  >
                                </telerik:RadComboBox>

                                 
                                 <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label6Resource1"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="ddlType" ForeColor="Red" ErrorMessage="Type Name required" Display="Dynamic" meta:resourcekey="RequiredFieldValidator14Resource1"></asp:RequiredFieldValidator>
                            </EditItemTemplate>

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="200px"></HeaderStyle>

                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Application Name" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left" UniqueName="Application_Name" DataField="Application_Name"  FilterControlWidth="100px" HeaderStyle-Width="200px"  DataType="System.String" meta:resourcekey="GridTemplateColumnResource4">
                            <ItemTemplate>
                                <%# Eval("Application_Name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                               

                                 <telerik:RadComboBox RenderMode="Lightweight" EmptyMessage="Select Application" runat="server" ID="ddlApplication" DataValueField="Application_Id"
                                    DataTextField="Application_Name"  EnableLoadOnDemand="True"    Width="128px" meta:resourcekey="ddlApplicationResource1"    >
                                </telerik:RadComboBox>


                                 <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label7Resource1"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="ddlApplication" ForeColor="Red" ErrorMessage="Application required" Display="Dynamic" meta:resourcekey="RequiredFieldValidator12Resource1"></asp:RequiredFieldValidator>
                            </EditItemTemplate>

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="200px"></HeaderStyle>

                        </telerik:GridTemplateColumn>

                       




                        <telerik:GridEditCommandColumn ItemStyle-Width="70px" ItemStyle-Height="20px" HeaderStyle-HorizontalAlign="left" HeaderStyle-Width="70px" ButtonType="ImageButton" UniqueName="EditCommandColumn" HeaderText="Edit" meta:resourcekey="GridEditCommandColumnResource1">
<HeaderStyle HorizontalAlign="Left" Width="70px"></HeaderStyle>

<ItemStyle Height="20px" Width="70px"></ItemStyle>
                        </telerik:GridEditCommandColumn>

                        <telerik:GridButtonColumn CommandName="Delete" HeaderText="Delete" 
                            UniqueName="column"  ButtonType="ImageButton" ConfirmText="Are you sure to delete?" ItemStyle-Width="70px" ItemStyle-Height="20px" HeaderStyle-Width="70px" Visible="false" meta:resourcekey="GridButtonColumnResource1">
<HeaderStyle Width="70px"></HeaderStyle>

<ItemStyle Height="20px" Width="70px"></ItemStyle>
                        </telerik:GridButtonColumn>
                    </Columns>

<EditFormSettings>
<EditColumn UniqueName="EditCommandColumn1" FilterControlAltText="Filter EditCommandColumn1 column"></EditColumn>
</EditFormSettings>
                </MasterTableView>

<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>

            </telerik:RadGrid>
                                    </div>
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
     <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionWeb %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Type_Id],[Type_Name]  FROM[tbl_Type_Master]"></asp:SqlDataSource>--%>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionWeb %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Application_Id],[Application_Name]  FROM  [tbl_Application_Master] "></asp:SqlDataSource>
              
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">


    

  
</asp:Content>

