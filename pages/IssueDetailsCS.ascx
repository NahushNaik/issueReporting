<%@ Control Language="C#" AutoEventWireup="true" CodeFile="IssueDetailsCS.ascx.cs" Inherits="pages_IssueDetailsCS" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<table id="Table2" cellspacing="2" cellpadding="1" width="100%" border="0" rules="none"
    style="border-collapse: collapse;">
    <tr class="EditFormHeader">
        <td colspan="2">
            <b>Issue Details</b>
        </td>
    </tr>
    <tr>
        <td>
            <table id="Table3" width="450px" border="0" class="module">
               
                 <tr>
                    <td>Issue Details:
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" Text='<%# Bind( "Issue_Name") %>' runat="server" TabIndex="8">
                        </asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Type
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlType" runat="server" SelectedValue='<%# DataBinder.Eval(Container, "DataItem.Type_Name") %>'
                           
                            AppendDataBoundItems="True">
                            <asp:ListItem Selected="True" Text="Select" Value="">
                            </asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
               <tr>
                    <td>Application
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
                runat="server" CommandName='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:Button>&nbsp;
                                    <asp:Button ID="btnCancel" Text="Cancel" runat="server" CausesValidation="False"
                                        CommandName="Cancel"></asp:Button>
        </td>
    </tr>
</table>