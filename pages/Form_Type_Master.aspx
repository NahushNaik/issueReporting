<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="Form_Type_Master.aspx.cs" Inherits="pages_Form_Type_Master" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>



<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Type Master</title>
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
        <asp:Label ID="Label1" runat="server" Text="Type  Master" meta:resourcekey="Label1Resource1"></asp:Label></a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">
                                            <asp:Label ID="Label2" runat="server" Text="Type Master" meta:resourcekey="Label2Resource1"></asp:Label></h4>
                                        <p class="category"></p>
                                    </div>

                                 

                                    <div class="content table-responsive table-full-width">
                                     <telerik:RadGrid RenderMode="Lightweight" ID="rgTypeMaster" runat="server" AllowPaging="True" AllowSorting="True" AllowFilteringByColumn="True" AutoGenerateColumns="False" OnNeedDataSource="rgTypeMaster_NeedDataSource" OnItemCreated="rgTypeMaster_ItemCreated" GroupingSettings-CaseSensitive="false" OnItemCommand="rgTypeMaster_ItemCommand" OnInsertCommand="rgTypeMaster_InsertCommand" OnUpdateCommand="rgTypeMaster_UpdateCommand"    Skin="MetroTouch" CellSpacing="-1" GridLines="Both" meta:resourcekey="rgTypeMasterResource1">
                
<GroupingSettings CaseSensitive="False" CollapseAllTooltip="Collapse all groups"></GroupingSettings>

                <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName="type_Master">
<Excel Format="ExcelML"></Excel>
                </ExportSettings>
                
                <MasterTableView ClientDataKeyNames="Type_Id" InsertItemPageIndexAction="ShowItemOnFirstPage" EditMode="InPlace" CommandItemDisplay="Top" DataKeyNames="Type_Id"  >

                    <CommandItemSettings ShowExportToCsvButton="false" ShowExportToExcelButton="true" />

                    <Columns >
                        <telerik:GridTemplateColumn DataField="Type_Id" HeaderText="Type Id" UniqueName="Type_Id" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left"  DataType="System.String" meta:resourcekey="GridTemplateColumnResource1" >
                            <ItemTemplate>
                                <%# Eval("Type_Id") %>
                            </ItemTemplate>
                         

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle"></HeaderStyle>
                         

                        </telerik:GridTemplateColumn>


                        <telerik:GridTemplateColumn DataField="Type_Name" HeaderText="Type Name" UniqueName="Type_Name" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left" DataType="System.String" meta:resourcekey="GridTemplateColumnResource2" >

                            <ItemTemplate>

                                <%# Eval("Type_Name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                              
                                <telerik:RadTextBox RenderMode="Lightweight"   runat="server" ID="txtTypeName" Text='<%# Eval("Type_Name") %>' LabelCssClass="" LabelWidth="64px" meta:resourcekey="txtTypeNameResource1" Resize="None" >
                                    <EmptyMessageStyle Resize="None" />
                                    <ReadOnlyStyle Resize="None" />
                                    <FocusedStyle Resize="None" />
                                    <DisabledStyle Resize="None" />
                                    <InvalidStyle Resize="None" />
                                    <HoveredStyle Resize="None" />
                                    <EnabledStyle Resize="None" />
                                </telerik:RadTextBox>
                                  <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label7Resource1"></asp:Label>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTypeName" ForeColor="Red" ErrorMessage="Type Name required" Display="Dynamic" meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
                                
                            </EditItemTemplate>

<HeaderStyle HorizontalAlign="Left" VerticalAlign="Middle"></HeaderStyle>

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

              
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">


    

  
</asp:Content>

