<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="Form_Application_Master.aspx.cs" Inherits="pages_Form_Application_Master" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>



<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Application Master</title>
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
    <asp:Label ID="Label9" runat="server" meta:resourcekey="Label9Resource1" Text="Application Master"></asp:Label>
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
                                            <asp:Label ID="Label8" runat="server" meta:resourcekey="Label8Resource1" Text="Application Master"></asp:Label>
                                        </h4>
                                        <p class="category"></p>
                                    </div>

                                 

                                    <div class="content table-responsive table-full-width">
                                     <telerik:RadGrid RenderMode="Lightweight" ID="rgApplicationMaster" runat="server" AllowPaging="True" AllowSorting="True" AllowFilteringByColumn="True" AutoGenerateColumns="False" OnNeedDataSource="rgApplicationMaster_NeedDataSource" OnItemCreated="rgApplicationMaster_ItemCreated" GroupingSettings-CaseSensitive="false" OnItemCommand="rgApplicationMaster_ItemCommand" OnInsertCommand="rgApplicationMaster_InsertCommand" OnUpdateCommand="rgApplicationMaster_UpdateCommand"    Skin="MetroTouch" meta:resourcekey="rgApplicationMasterResource1">
                
<GroupingSettings CaseSensitive="False" CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName="Application_Master">
<Excel Format="ExcelML"></Excel>
                </ExportSettings>
                
                <MasterTableView ClientDataKeyNames="Application_Id" InsertItemPageIndexAction="ShowItemOnFirstPage" EditMode="InPlace" CommandItemDisplay="Top" DataKeyNames="Application_Id"  >

                    <CommandItemSettings ShowExportToCsvButton="false" ShowExportToExcelButton="true" />

                    <Columns >
                        <telerik:GridTemplateColumn DataField="Application_Id" HeaderText="Application Id" UniqueName="Application_Id" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left"  DataType="System.String" meta:resourcekey="GridTemplateColumnResource1" >
                            <ItemTemplate>
                                <%# Eval("Application_Id") %>
                            </ItemTemplate>
                         

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle"></HeaderStyle>
                         

                        </telerik:GridTemplateColumn>


                        <telerik:GridTemplateColumn DataField="Application_Name" HeaderText="Application Name" UniqueName="Application_Name" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left" DataType="System.String" meta:resourcekey="GridTemplateColumnResource2" >

                            <ItemTemplate>

                                <%# Eval("Application_Name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                              
                                <telerik:RadTextBox RenderMode="Lightweight"  runat="server" ID="txtApplicationName" Text='<%# Eval("Application_Name") %>' LabelCssClass="" LabelWidth="64px" meta:resourcekey="txtApplicationNameResource1" Resize="None" >
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadTextBox>
                                  <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label7Resource1"></asp:Label>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtApplicationName" ForeColor="Red" ErrorMessage="Application Name required" Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                
                            </EditItemTemplate>

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle"></HeaderStyle>

                        </telerik:GridTemplateColumn>



                        
                        <telerik:GridTemplateColumn HeaderText="Type Name" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left" UniqueName="Type_Name" DataField="Type_Name"  FilterControlWidth="100px" HeaderStyle-Width="200px"  DataType="System.String" meta:resourcekey="GridTemplateColumnResource3">
                            <ItemTemplate>
                                <%# Eval("Type_Name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                               
                                <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="ddlType" DataValueField="Type_Id"
                                    DataTextField="Type_Name" DataSourceID="SqlDataSource1"  SelectedValue='<%# Bind("Type_Id") %>' Width="128px" meta:resourcekey="ddlTypeResource1">
                                </telerik:RadDropDownList>
                                 <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label5Resource1"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlType" ForeColor="Red" ErrorMessage="Type Name required" Display="Dynamic" meta:resourcekey="RequiredFieldValidator11Resource1"></asp:RequiredFieldValidator>
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
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionWeb %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Type_Id],[Type_Name]  FROM[tbl_Type_Master]"></asp:SqlDataSource>
              
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">


    

  
</asp:Content>

