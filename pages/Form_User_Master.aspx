<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="Form_User_Master.aspx.cs" Inherits="pages_Form_User_Master" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>




<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>User Master</title>
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
    <a class="navbar-brand" href="#">User  Master</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    <div class="content">
                    <div class="container-fluid">
                        <div class="row" style="margin-top: 0px !important;">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="header">
                                        <h4 class="title">User Master</h4>
                                        <p class="category"></p>
                                    </div>

                                 

                                    <div class="content table-responsive table-full-width" style="overflow:scroll">
                                     <telerik:RadGrid RenderMode="Lightweight" ID="rgUserMaster" runat="server" AllowPaging="true" AllowSorting="true" AllowFilteringByColumn="true" AutoGenerateColumns="false" OnNeedDataSource="rgUserMaster_NeedDataSource" OnItemCreated="rgUserMaster_ItemCreated" GroupingSettings-CaseSensitive="false" AllowAutomaticUpdates="false" AllowAutomaticInserts="false" OnItemCommand="rgUserMaster_ItemCommand" OnInsertCommand="rgUserMaster_InsertCommand" OnUpdateCommand="rgUserMaster_UpdateCommand"     Skin="MetroTouch">
                
                <ExportSettings Excel-Format="ExcelML" ExportOnlyData="true" IgnorePaging="true" FileName="User_Master">
                </ExportSettings>
                
                <MasterTableView ClientDataKeyNames="User_Id" InsertItemPageIndexAction="ShowItemOnFirstPage" EditMode="InPlace" CommandItemDisplay="Top" DataKeyNames="User_Id"  >

                    <CommandItemSettings ShowExportToCsvButton="false" ShowExportToExcelButton="true" />

                    <Columns >
                        <telerik:GridTemplateColumn DataField="User_Id" HeaderText="User Id" UniqueName="User_Id" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left"  DataType="System.String" >
                            <ItemTemplate>
                                <%# Eval("User_Id") %>
                            </ItemTemplate>
                         

                        </telerik:GridTemplateColumn>


                        <telerik:GridTemplateColumn DataField="User_Email" HeaderText="Email" UniqueName="User_Email" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left" DataType="System.String" >

                            <ItemTemplate>

                                <%# Eval("User_Email") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                              
                                <telerik:RadTextBox RenderMode="Lightweight"  runat="server" ID="txtEmail" Text='<%#Eval("User_Email") %>' >
                                    <ClientEvents  />
                                </telerik:RadTextBox>
                                <br />
                                  <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="*"></asp:Label>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ForeColor="Red" ErrorMessage="Email required" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"   Display="Dynamic"
ControlToValidate="txtEmail" ErrorMessage="Invalid Email Id"  ForeColor="Red"
ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                
                            </EditItemTemplate>

                        </telerik:GridTemplateColumn>

                          <telerik:GridTemplateColumn DataField="User_First_Name" HeaderText="First Name" UniqueName="User_First_Name" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left" DataType="System.String" >

                            <ItemTemplate>

                                <%# Eval("User_First_Name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                              
                                <telerik:RadTextBox RenderMode="Lightweight"  MaxLength="10"  runat="server" ID="txtFirstName" Text='<%#Eval("User_First_Name") %>' >
                                    <ClientEvents  />
                                </telerik:RadTextBox>
                                  <asp:Label ID="Label9" runat="server" ForeColor="Red" Text="*"></asp:Label>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtFirstName" ForeColor="Red" ErrorMessage="First Name required" Display="Dynamic">
                                </asp:RequiredFieldValidator>


                                
                            </EditItemTemplate>

                        </telerik:GridTemplateColumn>
                          <telerik:GridTemplateColumn DataField="User_Last_Name" HeaderText="Last Name" UniqueName="User_Last_Name" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left" DataType="System.String" >

                            <ItemTemplate>

                                <%# Eval("User_Last_Name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                              
                                <telerik:RadTextBox RenderMode="Lightweight"  MaxLength="10"  runat="server" ID="txtLastName" Text='<%#Eval("User_Last_Name") %>' >
                                    <ClientEvents  />
                                </telerik:RadTextBox>
                                  <asp:Label ID="Label8" runat="server" ForeColor="Red" Text="*"></asp:Label>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ForeColor="Red" ErrorMessage="Last name required" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                
                            </EditItemTemplate>

                        </telerik:GridTemplateColumn>


                          <telerik:GridTemplateColumn DataField="Contact_No" HeaderText="Contact" UniqueName="Contact_No" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left" DataType="System.String" >

                            <ItemTemplate>

                                <%# Eval("Contact_No") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                              
                                <telerik:RadTextBox RenderMode="Lightweight"  MaxLength="10"  runat="server" ID="txtContact" Text='<%#Eval("Contact_No") %>' >
                                    <ClientEvents  />
                                </telerik:RadTextBox>
                                  <asp:Label ID="Label89" runat="server" ForeColor="Red" Text="*"></asp:Label>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtContact" ForeColor="Red" ErrorMessage="Number required" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                  
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"  Display="Dynamic"
ControlToValidate="txtContact" ErrorMessage="Invalid Contact Number"  foreColor="Red"
ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                                
                            </EditItemTemplate>

                        </telerik:GridTemplateColumn>

                          <telerik:GridTemplateColumn DataField="Plant_Name" HeaderText="Plant" UniqueName="Plant_Name" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left" DataType="System.String" >

                            <ItemTemplate>

                                <%# Eval("Plant_Name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                              
                                   
                                <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="ddlPlant" DataValueField="Plant_Id"
                                    DataTextField="Plant_Name" DataSourceID="SqlDataSource1"  SelectedValue='<%#Bind("Plant_Id") %>'>
                                </telerik:RadDropDownList>
                                  <asp:Label ID="Label819" runat="server" ForeColor="Red" Text="*"></asp:Label>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator111" runat="server" ControlToValidate="ddlPlant" ForeColor="Red" ErrorMessage="Plant required" Display="Dynamic">
                                </asp:RequiredFieldValidator>
                                
                            </EditItemTemplate>

                        </telerik:GridTemplateColumn>


                         <telerik:GridTemplateColumn DataField="Department_Name" HeaderText="Department" UniqueName="Department_Name" HeaderStyle-VerticalAlign="Middle" HeaderStyle-HorizontalAlign="left" DataType="System.String" >

                            <ItemTemplate>

                                <%# Eval("Department_Name") %>
                            </ItemTemplate>
                            <EditItemTemplate>
                              
                                   
                                <telerik:RadDropDownList RenderMode="Lightweight" runat="server" ID="ddlDepartment" DataValueField="Department_Id"
                                    DataTextField="Department_Name" DataSourceID="SqlDataSource2"  SelectedValue='<%#Bind("Department_Id") %>'>
                                </telerik:RadDropDownList>
                                  <asp:Label ID="Label8119" runat="server" ForeColor="Red" Text="*"></asp:Label>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator211" runat="server" ControlToValidate="ddlDepartment" ForeColor="Red" ErrorMessage="Department required" Display="Dynamic">
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
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT *  FROM [tbl_Plant_Master]"></asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionWeb %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Department_Id],[Department_Name] FROM [tbl_Department_Master]"></asp:SqlDataSource>
              
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">


    

  
</asp:Content>

