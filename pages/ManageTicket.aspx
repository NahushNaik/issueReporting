<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/pages/UserMaster.master" CodeFile="ManageTicket.aspx.cs" Inherits="pages_ManageTicket" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>View Ticket</title>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BodyStart" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body1" runat="Server">
    <a class="navbar-brand" href="#">
        <asp:Label ID="Label6" runat="server" Text="View Ticket" meta:resourcekey="Label6Resource1"></asp:Label></a>

   <%--   <script type="text/javascript">
          function DisableButton() {
              document.getElementById("<%=UpdateButton.ClientID %>").disabled = true;
            document.getElementById("<%=btnReassign.ClientID %>").disabled = true;

            $('#loading').show();


        }
        window.onbeforeunload = DisableButton;

    </script>--%>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

    <script type='text/javascript' src="../Scripts/jquery-1.4.1.min.js"></script>
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.maskedinput.js" type="text/javascript"></script>

     <script type="text/javascript">
         $(document).ready(function () {
             $("#<%= UpdateButton.ClientID %>").click(function () {
                 debugger;
                 if (Page_IsValid == true) {

                     $('#loading').show();

                     return true;
                 }
                 else {
                     return false; z
                 }
             });
         });

    </script>
     <script type="text/javascript">
         $(document).ready(function () {
             $("#<%= btnReassign.ClientID %>").click(function () {
                 debugger;
                 if (Page_IsValid == true) {

                     $('#loading').show();

                     return true;
                 }
                 else {
                     return false; z
                 }
             });
         });

    </script>
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
  
    <script type='text/javascript' src="../Scripts/jquery-1.4.1.min.js"></script>
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.maskedinput.js" type="text/javascript"></script>



    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%= btn_UpdateComment.ClientID %>").click(function () {
                 debugger;
                 if (Page_IsValid == true) {

                     $('#loading').show();

                     return true;
                 }
                 else {
                     return false;
                 }
             });
         });


        function ConfirmReassign() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want to REASSIGN ticket?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
       

        function ConfirmUpdate() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Do you want to CLOSE ticket?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }

        
        function onlyNumbersWithDot(e) {
            var charCode;
            if (e.keyCode > 0) {
                charCode = e.which || e.keyCode;
            }
            else if (typeof (e.charCode) != "undefined") {
                charCode = e.which || e.keyCode;
            }
            if (charCode == 46)
                return true
            if (charCode > 31 && (charCode < 48 || charCode > 57))
                return false;
            return true;
        }
    </script>

   

    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%= UpdateButton.ClientID %>").click(function () {
                debugger;
                if (Page_IsValid == true) {

                    $('#loading').show();

                    return true;
                }
                else {
                    return false;
                }
            });
        });

    </script>


    <%--<link href="assets/css/main.css" rel="stylesheet" />
    <link href="style/font-awesome.css" rel="stylesheet" />--%>

    <telerik:RadScriptManager runat="server" ID="rsm"></telerik:RadScriptManager>
    <div class="content">
        <div class="container-fluid">
            <div class="row">

                <div class="col-lg-11 col-md-10">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">
                                <asp:Label ID="Label7" runat="server" Text="View Ticket :" meta:resourcekey="Label7Resource1"></asp:Label>
                                <asp:Label ID="lblStatus" runat="server" Text="Label" meta:resourcekey="lblStatusResource1"></asp:Label><asp:Label ID="lblUser" runat="server" Text="(User)" meta:resourcekey="lblUserResource1"></asp:Label></h4>
                           
                        </div>
                         <%-- <div class="header">
                         
                           <asp:Button ID="btnViewLogs" runat="server" Text="View Logs" Style="background-color: #ffd800;" ForeColor="Black" OnClick="btnViewLogs_Click" CssClass="btn btn-info btn-fill btn-wd" BorderColor="Orange"  />
                        </div>--%>
                         <span>  </span>
                        <div class="content">
                            <form>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">
                                                <asp:Label ID="Label8" runat="server" Text="Ticket ID" meta:resourcekey="Label8Resource1"></asp:Label></label>
                                            <asp:TextBox ID="TicketID" runat="server" CssClass="form-control border-input" ReadOnly="True" ForeColor="Green" meta:resourcekey="TicketIDResource1" ></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Type</label>
                                            <asp:DropDownList ID="drpDownType" runat="server" CssClass="form-control border-input" AutoPostBack="True" OnSelectedIndexChanged="drpDownType_SelectedIndexChanged" meta:resourcekey="drpDownTypeResource1"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>
                                            <asp:Label ID="Label9" runat="server" Text="Application" meta:resourcekey="Label9Resource1"></asp:Label></label>
                                            <asp:DropDownList ID="drpDownApplication" runat="server" CssClass="form-control border-input" AutoPostBack="True" OnSelectedIndexChanged="drpDownApplication_SelectedIndexChanged" meta:resourcekey="drpDownApplicationResource1"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>




                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label10" runat="server" Text="Issue" meta:resourcekey="Label10Resource1"></asp:Label></label>
                                            <asp:DropDownList ID="DrpIssueType" runat="server" CssClass="form-control border-input" meta:resourcekey="DrpIssueTypeResource1">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label11" runat="server" Text="Issue Details" meta:resourcekey="Label11Resource1"></asp:Label></label>
                                            <asp:TextBox ID="IssueDetail" runat="server" CssClass="form-control border-input" TextMode="MultiLine" ReadOnly="True" meta:resourcekey="IssueDetailResource1">Issue Details</asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label12" runat="server" Text="Priority" meta:resourcekey="Label12Resource1"></asp:Label></label>
                                            <asp:DropDownList ID="DrpPriority" runat="server" CssClass="form-control border-input" Enabled="False" meta:resourcekey="DrpPriorityResource1">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>


                                <div class="row" runat="server" visible="false">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Status</label>
                                            <asp:DropDownList ID="drpStatus" runat="server" CssClass="form-control border-input" meta:resourcekey="drpStatusResource1">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label13" runat="server" Text="Document" meta:resourcekey="Label13Resource1"></asp:Label></label>
                                            <asp:TextBox ID="txtFileName" runat="server" CssClass="form-control border-input" ReadOnly="True" meta:resourcekey="txtFileNameResource1"></asp:TextBox>
                                            <%--   <asp:HyperLink ID="Download" Text="Download" NavigateUrl="#" runat="server"  Enabled="true">
                                        <img  src="../Images/Download.png"  />
                                            </asp:HyperLink>--%>



                                            <asp:LinkButton ID="lnkDownload" Text="
                                                       &lt;img  src=&quot;../Images/Download.png&quot;  /&gt;
                                            " runat="server" OnClick="lnkDownload_Click" meta:resourcekey="lnkDownloadResource1" ></asp:LinkButton>
                                            <br />

                                        </div>
                                    </div>
                                </div>





                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label14" runat="server" Text="Status" meta:resourcekey="Label14Resource1"></asp:Label></label>
                                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control border-input" meta:resourcekey="ddlStatusResource1">
                                                <%--  <asp:ListItem Value="0">Open</asp:ListItem>--%>
                                                <asp:ListItem Value="1" meta:resourcekey="ListItemResource1">Closed</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label15" runat="server" Text="Remark" meta:resourcekey="Label15Resource1"></asp:Label></label>
                                            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label3Resource1"></asp:Label>
                                            <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control border-input" ForeColor="Green" meta:resourcekey="txtRemarkResource1"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv" runat="server" ErrorMessage="Please Enter Remark" ControlToValidate="txtRemark" ValidationGroup="UpdateClick" ForeColor="Red" meta:resourcekey="rfvResource1"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>



                                   <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label16" runat="server" Text="Time Spent(Hours.Min)" meta:resourcekey="Label16Resource1"></asp:Label></label>
                                               <asp:Label ID="lblStar" runat="server" ForeColor="Red" Text="*" meta:resourcekey="lblStarResource1"></asp:Label>
                                            <asp:TextBox ID="txtHours" runat="server" ValidationGroup="UpdateClick" onkeypress="return onlyNumbersWithDot(event);"  placeholder="Hours.Minute"  CssClass="form-control border-input" meta:resourcekey="txtHoursResource1"  ></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="rfvHours" runat="server" ControlToValidate="txtHours"
                                                ErrorMessage="Please Enter (Hours.Minute)" ForeColor="Red" Display="Dynamic"
                                                ValidationGroup="UpdateClick" meta:resourcekey="rfvHoursResource1"></asp:RequiredFieldValidator>
                                 <asp:RegularExpressionValidator ID="RegularExpressionValidatorHours" runat="server" Display="Dynamic"
         ErrorMessage="Enter Valid Time" ValidationExpression="^-?\d+(?:\.\d+)?$"
        ControlToValidate="txtHours" meta:resourcekey="RegularExpressionValidatorHoursResource1"></asp:RegularExpressionValidator>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label17" runat="server" Text="Is Valid?" meta:resourcekey="Label17Resource1"></asp:Label></label>
                                            <asp:DropDownList ID="ddlIsValid" runat="server" CssClass="form-control border-input" meta:resourcekey="ddlIsValidResource1">
                                                  <asp:ListItem Value="0" meta:resourcekey="ListItemResource2">Yes</asp:ListItem>
                                                <asp:ListItem Value="1" meta:resourcekey="ListItemResource3">No</asp:ListItem>
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                </div>






                              
                                <div class="text-center">

                                    <asp:Label runat="server" ID="lbl_Massage" ForeColor="Red" Text="Depending on the file size..The loading time will vary...." meta:resourcekey="lbl_MassageResource1"></asp:Label>
                                    <br />

                                    <asp:Button ID="UpdateButton" runat="server" Text="Update Ticket" class="btn btn-info btn-fill btn-wd " OnClientClick = "ConfirmUpdate()"  ValidationGroup="UpdateClick" OnClick="UpdateButton_Click" meta:resourcekey="UpdateButtonResource1" />
                                      <asp:Button ID="btnReassign" runat="server" Text="Reassign" class="btn btn-info btn-fill btn-wd " BackColor="Red" OnClientClick = "ConfirmReassign()"  OnClick="btnReassign_Click" meta:resourcekey="btnReassignResource1" />

                                </div>


                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label18" runat="server" Text="Comments" meta:resourcekey="Label18Resource1"></asp:Label></label>
                                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*(Comment is mandatory for updating comment)" meta:resourcekey="Label1Resource1"></asp:Label>
                                            <asp:TextBox ID="txt_Comments" runat="server" ValidationGroup="Check1" Height="100%" CssClass="form-control border-input" TextMode="MultiLine" meta:resourcekey="txt_CommentsResource1"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Comments" ErrorMessage="Please Enter Comment" ForeColor="Red" Display="Dynamic" ValidationGroup="Check1" meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
                                            
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <br />
                                            <br />
                                            <div class="text-center">

                                                <asp:Button ID="btn_UpdateComment" runat="server" ValidationGroup="Check1" Text="Submit Comment" Style="background-color: red;" CssClass="btn btn-info btn-fill btn-wd" BorderColor="Orange" OnClick="btn_UpdateComment_Click" meta:resourcekey="btn_UpdateCommentResource1" />

                                                 
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <h3 style="text-decoration: underline;">
                                    <asp:Label ID="Label19" runat="server" Text="Comments:" meta:resourcekey="Label19Resource1"></asp:Label></h3>
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>

                                        <div id="comment-92" class="panel panel-default">
                                            <div class="comment-content panel-body">
                                                <p>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Comment") %>' meta:resourcekey="Label4Resource1"></asp:Label>
                                                </p>
                                            </div>
                                            <div class="panel-footer">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <i class="ti-user"></i>
                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Blue" Text='<%# Eval("isAdmin") %>' meta:resourcekey="Label5Resource1"></asp:Label>
                                                        <i class="ti-alarm-clock"></i>
                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="SkyBlue" Text='<%# Eval("Created_Datetime") %>' meta:resourcekey="Label2Resource1"></asp:Label>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>

                                    </ItemTemplate>
                                </asp:Repeater>

                                <div class="col-md-12">
                                    <div class="form-group">

                                        <div style="overflow: hidden;">
                                            <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnPage"
                                                        Style="padding: 8px; margin: 2px; background: #007acc; border: solid 1px blue; font: 8px;"
                                                        CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                                        runat="server" ForeColor="White" Font-Bold="True" CausesValidation="False" meta:resourcekey="btnPageResource1"><%# Container.DataItem %></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>

                                <div class="clearfix"></div>
                            </form>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>

    <style type="text/css">
        #page
        {
            display: block;
        }

        #loading
        {
            display: none;
            position: absolute;
            top: 0;
            left: 0;
            z-index: 100;
            width: 100%;
            height: 200%;
            background-color: rgba(255, 255, 255, 0.5);
            background-image: url('../pages/images/ajax-loader.gif');
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>
    <div id="loading"></div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>
