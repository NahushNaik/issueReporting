<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/pages/UserMaster.master"  CodeFile="form_AdminDashboard.aspx.cs" Inherits="pages_form_AdminDashboard" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>



<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Dashboard</title>
    <style>
      

        #operator,#tableSummary  {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#operator td, #operator th,#tableSummary td,#tableSummary th {
    border: 1px solid #000000;
    padding: 5px;
}

            #operator td {
                font-size:30px;
                background:white;
            }




#operator th,#tableSummary th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: white;
   
}

    </style>
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
    <a class="navbar-brand" href="#">Dashboard</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">
    
     <div class="row">
    <div class="col-md-4">
      <div>
          <table id="operator"  style=" color:black; font-size:15px;height:100px;" >
    <tr >
        <th></th>
        <th scope="col">Today</th>
        
       
        <th scope="col">Within 3 Days
        </th>
        <th scope="col">Older than 3 days</th>
        
    </tr>
    <tr >
        <th scope="row">Created</th>
        <td align="center"><asp:HyperLink ID="lbl_RecentOpen" ToolTip="Created Today"    runat="server"  Text="Home"  NavigateUrl="form_TicketDuration.aspx?type=recent&status=open" meta:resourcekey="lbl_RecentOpenResource1"></asp:HyperLink>
           </td>
        <td align="center"><asp:HyperLink ID="lbl_WeekOpen" ToolTip="Created in last 3 days"   runat="server"  Text="Home"  NavigateUrl="form_TicketDuration.aspx?type=withinWeek&status=open" meta:resourcekey="lbl_WeekOpenResource1"></asp:HyperLink>
            </td>
        <td align="center"><asp:HyperLink ID="lbl_MoreThanWeekOpen"  ToolTip="Created before last 3 days"   runat="server"  Text="Home"  NavigateUrl="form_TicketDuration.aspx?type=MoreThanWeekOpen&status=open" meta:resourcekey="lbl_MoreThanWeekOpenResource1"></asp:HyperLink>
           </td>
    </tr>
    <tr  >
        <th scope="row">Close</th>
         <td align="center">
             <asp:HyperLink ID="lbl_RecentClose" ToolTip="Closed Today"    runat="server"  Text="Home"  NavigateUrl="form_TicketDuration.aspx?type=recent&status=close" meta:resourcekey="lbl_RecentCloseResource1"></asp:HyperLink>
            </td>
        <td align="center"><asp:HyperLink ID="lbl_WeekClose"  ToolTip="Closed in last 3 days"    runat="server"  Text="Home"  NavigateUrl="form_TicketDuration.aspx?type=withinWeek&status=close" meta:resourcekey="lbl_WeekCloseResource1"></asp:HyperLink>
           </td>
        <td align="center"><asp:HyperLink ID="lbl_MoreThanWeekClose"  ToolTip="Closed before last 3 days"       runat="server"  Text="Home"  NavigateUrl="form_TicketDuration.aspx?type=MoreThanWeekOpen&status=close" meta:resourcekey="lbl_MoreThanWeekCloseResource1"></asp:HyperLink>
            </td>
    </tr>
   
</table>
         
        
      </div>
   
        <div>
            <br />
            <asp:GridView ID="rgvTypeWise"   runat="server" Width="100%" Style="font:15px;background-color:white" HorizontalAlign="Right"  ForeColor="Black" AutoGenerateColumns="False"  AlternatingRowStyle-BackColor="#cccccc" meta:resourcekey="rgvTypeWiseResource1"  >
<AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
                                                <Columns>
                                                  
                                                    <asp:HyperLinkField HeaderText="Type" Target="_blank" DataNavigateUrlFields="Type_Id"  DataTextField="Type"  DataNavigateUrlFormatString="form_TypeWise_DrillDown.aspx?id={0}" ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-BackColor="cadetblue" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="text-center" meta:resourcekey="HyperLinkFieldResource1"    >
                                                    
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="CadetBlue" CssClass="text-center" Font-Bold="True" ForeColor="White"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" Font-Bold="True"></ItemStyle>
                                                    </asp:HyperLinkField>
                                                    
                                                     <asp:BoundField HeaderText="Total" DataField="Total"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-BackColor="cadetblue" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true" meta:resourcekey="BoundFieldResource1"   >
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="CadetBlue" Font-Bold="True" ForeColor="White"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" Font-Bold="True"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="This Month" DataField="This_Month"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-BackColor="cadetblue" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true" meta:resourcekey="BoundFieldResource2"  >
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="CadetBlue" Font-Bold="True" ForeColor="White"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" Font-Bold="True"></ItemStyle>
                                                    </asp:BoundField>
                                              <asp:BoundField HeaderText="Open" DataField="Open"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-BackColor="cadetblue" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="text-center" meta:resourcekey="BoundFieldResource3" >      
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="CadetBlue" CssClass="text-center" Font-Bold="True" ForeColor="White"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" Font-Bold="True"></ItemStyle>
                                                    </asp:BoundField>
                                                </Columns>
                                              <HeaderStyle HorizontalAlign="Center" />
                                                  
                                            </asp:GridView>

        </div>

         <div >
         
            <asp:GridView ID="rgvUserDeptwise"   runat="server"    Width="100%" Style="font:15px;background-color:white" HorizontalAlign="Right"   ForeColor="Black" AutoGenerateColumns="False"  AlternatingRowStyle-BackColor="#cccccc" meta:resourcekey="rgvUserDeptwiseResource1" >
<AlternatingRowStyle BackColor="#CCCCCC"></AlternatingRowStyle>
                                                <Columns>
                                                    <asp:HyperLinkField HeaderText="Department" Target="_blank" DataNavigateUrlFields="Department"  DataTextField="Department"  DataNavigateUrlFormatString="Frm_Departmentwise_Drilldown.aspx?Dept={0}" ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-BackColor="cadetblue" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="text-center"  ItemStyle-Width="47%" meta:resourcekey="HyperLinkFieldResource2"   >
                                                    
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="CadetBlue" CssClass="text-center" Font-Bold="True" ForeColor="White"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" Font-Bold="True"></ItemStyle>
                                                    </asp:HyperLinkField>
                                                    
                                                     <asp:BoundField HeaderText="Total" DataField="Total"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-BackColor="cadetblue" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="text-center" meta:resourcekey="BoundFieldResource4"  >
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="CadetBlue" CssClass="text-center" Font-Bold="True" ForeColor="White"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" Font-Bold="True"></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="This Month" DataField="This_Month"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-BackColor="cadetblue" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="text-center" meta:resourcekey="BoundFieldResource5" >
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="CadetBlue" CssClass="text-center" Font-Bold="True" ForeColor="White"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" Font-Bold="True"></ItemStyle>
                                                    </asp:BoundField>
                                                     <asp:BoundField HeaderText="Open" DataField="Open"  ItemStyle-Font-Bold="true" ItemStyle-HorizontalAlign="Center"   HeaderStyle-HorizontalAlign="Center" HeaderStyle-VerticalAlign="Middle" HeaderStyle-BackColor="cadetblue" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="true"  HeaderStyle-CssClass="text-center" meta:resourcekey="BoundFieldResource6" >
                                                  
<HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" BackColor="CadetBlue" CssClass="text-center" Font-Bold="True" ForeColor="White"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" Font-Bold="True"></ItemStyle>
                                                    </asp:BoundField>
                                                  
                                                </Columns>
                                              <HeaderStyle HorizontalAlign="Center" />
                                                  
                                            </asp:GridView>
      </div>
       
    </div>
    <div class="col-md-8" >
      
         
        <table id="tableSummary"  style="background:white; color:black; font-size:15px;height:100px;" >
                 
   <tr>
       <td>Total Tickets</td>
       <td style="font-size:30px;font-weight:bold">
           <asp:Label ID="lblTotalTickets" runat="server" Text="0" meta:resourcekey="lblTotalTicketsResource1"></asp:Label></td>

   </tr>
                     <tr>
                         <td>Open</td>
                         <td style="font-size:30px;font-weight:bold"><asp:Label ID="lblOpenTickets" runat="server" Text="0" meta:resourcekey="lblOpenTicketsResource1"></asp:Label></td>
                     </tr>
                      <tr>
                         <td>Closed</td>
                         <td style="font-size:30px;font-weight:bold"><asp:Label ID="lblCloseTickets" runat="server" Text="0" meta:resourcekey="lblCloseTicketsResource1"></asp:Label></td>
                     </tr>
                                                   <tr>
       <td>Average Closed Time</td>
       <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblAverageClosedTime" runat="server" Text="0" meta:resourcekey="lblAverageClosedTimeResource1"></asp:Label></td>

   </tr>
                     <tr>
                         <td>Fastest Closed Time</td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblFastestClosedTime" runat="server" Text="0" meta:resourcekey="lblFastestClosedTimeResource1"></asp:Label></td>
                     </tr>
                      <tr>
                         <td>Slowest Closed Time</td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblSlowestClosedTime" runat="server" Text="0" meta:resourcekey="lblSlowestClosedTimeResource1"></asp:Label></td>
                     </tr>
 <tr>
                         <td>Total Open Duration </td>
                         <td style="font-size:30px;font-weight:bold"> <asp:Label ID="lblTotalSpentTime" runat="server" Text="0" meta:resourcekey="lblTotalSpentTimeResource1"></asp:Label></td>
                     </tr>

</table>


    </div>
  </div>
              
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">


    

 
</asp:Content>

