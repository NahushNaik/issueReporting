<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="Form_Issue_Master_Demo.aspx.cs" Inherits="pages_Form_Issue_Master_Demo" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>





<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="qsf" %>


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
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body1" runat="Server">
    <a class="navbar-brand" href="#">
    <asp:Label ID="Label2" runat="server" Text="Issue Master"></asp:Label>
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
                                            <asp:Label ID="Label1" runat="server" Text="Issue Master"></asp:Label>
                                        </h4>
                                        <p class="category"></p>
                                    </div>

                              
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">
            function RowDblClick(sender, eventArgs) {
                sender.get_masterTableView().editItem(eventArgs.get_itemIndexHierarchical());
            }

            function onPopUpShowing(sender, args) {
                args.get_popUp().className += " popUpEditForm";
            }
        </script>
    </telerik:RadCodeBlock>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="ConfiguratorPanel">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="RadAjaxLoadingPanel1"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server">
    </telerik:RadAjaxLoadingPanel>
    <telerik:RadFormDecorator RenderMode="Lightweight" ID="RadFormDecorator1" runat="server" DecorationZoneID="demo" DecoratedControls="All" EnableRoundedCorners="false" />

                                    <div class="content table-responsive table-full-width">
                                    <telerik:RadGrid RenderMode="Lightweight" ID="RadGrid1" runat="server" AllowPaging="True" ShowFooter="true"
            AllowSorting="True" AutoGenerateColumns="False" ShowStatusBar="true" 
            OnPreRender="RadGrid1_PreRender" OnNeedDataSource="RadGrid1_NeedDataSource" OnUpdateCommand="RadGrid1_UpdateCommand"
            OnInsertCommand="RadGrid1_InsertCommand" OnDeleteCommand="RadGrid1_DeleteCommand">
            <MasterTableView Width="100%" CommandItemDisplay="Top" DataKeyNames="Issue_Id" EditFormSettings-PopUpSettings-KeepInScreenBounds="true">
                <Columns>
                    <telerik:GridEditCommandColumn UniqueName="EditCommandColumn">
                    </telerik:GridEditCommandColumn>
                    <telerik:GridBoundColumn UniqueName="Issue_Id" HeaderText="ID" DataField="Issue_Id">
                        <HeaderStyle Width="60px"></HeaderStyle>
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Issue_Name" HeaderText="Issue Name" DataField="Issue_Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Type_Name" HeaderText="Type Name" DataField="Type_Name">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn UniqueName="Application_Name" HeaderText="Application" DataField="Application_Name"
                       >
                    </telerik:GridBoundColumn>
                   
                    <telerik:GridButtonColumn UniqueName="DeleteColumn" Text="Delete" CommandName="Delete">
                    </telerik:GridButtonColumn>
                </Columns>
                <EditFormSettings UserControlName="IssueDetailsCS.ascx" EditFormType="WebUserControl">
                    <EditColumn UniqueName="EditCommandColumn1">
                    </EditColumn>
                </EditFormSettings>
            </MasterTableView>
            <ClientSettings>
                <ClientEvents OnRowDblClick="RowDblClick" OnPopUpShowing="onPopUpShowing" />
            </ClientSettings>
        </telerik:RadGrid>
                                    </div>

<%--                                    <telerik:RadAjaxPanel runat="server" ID="RadAjaxPanel1">
                                          <qsf:ConfiguratorPanel runat="server" ID="ConfiguratorPanel">
        <Views>
            <qsf:View>
                <qsf:ConfiguratorColumn runat="server" Title="EditForm type">
                    <qsf:RadioButtonList runat="server" ID="RadioButtonList1" AutoPostBack="true" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                        <asp:ListItem Text="EditForms" Value="EditForms" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="PopUp" Value="PopUp"></asp:ListItem>
                    </qsf:RadioButtonList>
                </qsf:ConfiguratorColumn>
            </qsf:View>
        </Views>
    </qsf:ConfiguratorPanel>
                                        </telerik:RadAjaxPanel>--%>
                                    
                                  
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
      
              
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">


    

  
</asp:Content>

