<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="Form_Master_To.aspx.cs" Inherits="pages_Form_Master_To" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>



<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title> Master Mail</title>
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
    <a class="navbar-brand" href="#">Master To</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">Master To</h4>
                                        <p class="category"></p>
                                    </div>

                          

                                    <div class="content table-responsive table-full-width">
                             <telerik:RadGrid RenderMode="Lightweight" ID="rgTo" runat="server" AllowPaging="true" AllowSorting="true" AllowFilteringByColumn="true" AutoGenerateColumns="false" OnNeedDataSource="rgTo_NeedDataSource" OnItemCreated="rgTo_ItemCreated" GroupingSettings-CaseSensitive="false" AllowAutomaticUpdates="false" AllowAutomaticInserts="false" OnItemCommand="rgTo_ItemCommand" OnInsertCommand="rgTo_InsertCommand" OnUpdateCommand="rgTo_UpdateCommand"    Skin="MetroTouch">
                
                <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName="Application_Master">
                </ExportSettings>
                
                <MasterTableView ClientDataKeyNames="To_Id" InsertItemPageIndexAction="ShowItemOnFirstPage" EditMode="InPlace" CommandItemDisplay="Top" DataKeyNames="To_Id"  >

                    <CommandItemSettings ShowExportToCsvButton="false" ShowExportToExcelButton="true" />

                    <Columns >
                        <telerik:GridTemplateColumn DataField="To_Id" HeaderText="Id" UniqueName="To_Id" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left"  Visible="false" DataType="System.String" >
                            <ItemTemplate>
                                <%# Eval("To_Id") %>
                            </ItemTemplate>
                         

                        </telerik:GridTemplateColumn>


                        <telerik:GridTemplateColumn DataField="To_Email_Id" HeaderText="To Email Id" UniqueName="To_Email_Id" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left" DataType="System.String" >

                            <ItemTemplate>

                                <%# Eval("To_Email_Id") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                              
                                <telerik:RadTextBox RenderMode="Lightweight"  runat="server" ID="txtEmail" Text='<%#Eval("To_Email_Id") %>' >
                                    <ClientEvents  />
                                </telerik:RadTextBox>
                                  <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*"></asp:Label>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage=" Email required" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                <%--  <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  
ControlToValidate="txtEmail" ErrorMessage="Invalid Email Id"  ForeColor="Red"
ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>--%>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  
ControlToValidate="txtEmail" ErrorMessage="Invalid Email Id"  ForeColor="Red"
ValidationExpression="\w+([-+.']\w+)*@\w*sanjeevgroup\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </EditItemTemplate>

                        </telerik:GridTemplateColumn>



                        
                        <telerik:GridTemplateColumn HeaderText="Type Name" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left" UniqueName="Type_Name" DataField="Type_Name"    DataType="System.String">
                            <ItemTemplate>
                                <%# Eval("Type_Name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                               
                                <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="ddlType" DataValueField="Type_Id"
                                    DataTextField="Type_Name" DataSourceID="SqlDataSource1"  SelectedValue='<%#Bind("Type_Id") %>' >
                                </telerik:RadDropDownList>
                                 <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="ddlType" ForeColor="Red" ErrorMessage="Type Name required" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                            </EditItemTemplate>

                        </telerik:GridTemplateColumn>

                       




                        <telerik:GridEditCommandColumn ItemStyle-Width="70px" ItemStyle-Height="20px" HeaderStyle-HorizontalAlign="left" HeaderStyle-Width="70px" ButtonType="ImageButton" UniqueName="EditCommandColumn" HeaderText="Edit">
                        </telerik:GridEditCommandColumn>

                        <telerik:GridButtonColumn CommandName="Delete" HeaderText="Delete" 
                            UniqueName="column"  ButtonType="ImageButton" ConfirmText="Are you sure to delete?" ItemStyle-Width="70px" ItemStyle-Height="20px" HeaderStyle-Width="70px">
                        </telerik:GridButtonColumn>
                    </Columns>
                </MasterTableView>

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

