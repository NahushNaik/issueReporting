<%@ Control Language="C#" AutoEventWireup="true" CodeFile="IssueDetailsCS.ascx.cs" Inherits="pages_IssueDetailsCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<table id="Table2" cellspacing="2" cellpadding="1" width="100%" border="0" rules="none"
    style="border-collapse: collapse;">
    <tr class="EditFormHeader">
        <td colspan="2">
            <b>
            <asp:Label ID="Label1" runat="server" Text="Issue Details" meta:resourcekey="Label1Resource1"></asp:Label></b>
        </td>
    </tr>
    <tr>
        <td>
            <table id="Table3" width="450px" border="0" class="module">
               
                 <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Issue Details:" meta:resourcekey="Label2Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" Text='<%# Bind( "Issue_Name") %>' runat="server" TabIndex="8" meta:resourcekey="TextBox2Resource1"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Type" meta:resourcekey="Label3Resource1"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlType" runat="server" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.Type_Name") %>'
                           
                            AppendDataBoundItems="True" meta:resourcekey="ddlTypeResource1">
                            <asp:ListItem Selected="True" Text="Select" Value="" meta:resourcekey="ListItemResource1">
                            </asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
               <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Application" meta:resourcekey="Label4Resource1"></asp:Label>
                    </td>
                  <%--  <td>
                        <asp:DropDownList ID="ddlApplication" runat="server" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.Application_Id") %>'
                            DataSource='<%# (new string[] { "Dr.", "Mr.", "Mrs.", "Ms." }) %>' TabIndex="7"
                            AppendDataBoundItems="True">
                            <asp:ListItem Selected="True" Text="Select" Value="">
                            </asp:ListItem>
                        </asp:DropDownList>
                    </td>--%>
                </tr>
              
            </table>
        </td>
      
    </tr>
   
    <tr>
        <td align="right" colspan="2">
            <asp:Button ID="btnUpdate" Text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>'
                runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>' meta:resourcekey="btnUpdateResource1"></asp:Button>&nbsp;
                                    <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                                        CommandName="Cancel" meta:resourcekey="btnCancelResource1"></asp:Button>
        </td>
    </tr>
</table>