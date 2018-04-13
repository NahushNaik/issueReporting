<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="Form_Edit_TicketDetails.aspx.cs" Inherits="pages_Form_Edit_TicketDetails" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Edit Ticket</title>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BodyStart" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body1" runat="Server">
    <a class="navbar-brand" href="#">
    <asp:Label ID="Label11" runat="server" meta:resourcekey="Label11Resource1" Text="Edit Ticket"></asp:Label>
    </a>
   &nbsp;<%-- <script type="text/javascript">
        function DisableButton() {
            document.getElementById("<%=btn_Edit_Details.ClientID %>").disabled = true;
           
              $('#loading').show();


          }
          window.onbeforeunload = DisableButton;

    </script>--%><script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script><script type='text/javascript' src="../Scripts/jquery-1.4.1.min.js"></script><script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script><script src="../Scripts/jquery.maskedinput.js" type="text/javascript"></script><script type="text/javascript">
         $(document).ready(function () {
             $("#<%= btn_Edit_Details.ClientID %>").click(function () {
                debugger;
                if (Page_IsValid == true) {

                    $('#loading').show();

                    return true;
                }
                else {
                    return false;z
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





      <form>
    <div class="content">
        <div class="container-fluid">
            <div class="row">

                <div class="col-lg-11 col-md-10">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">
                                <asp:Label ID="Label3" runat="server" meta:resourcekey="Label3Resource1" Text="View Ticket :"></asp:Label>
&nbsp;<asp:Label ID="lblStatus" runat="server" Text="Label" meta:resourcekey="lblStatusResource1"></asp:Label></h4>
                        </div>
                        <div class="content">
                          

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">
                                            <asp:Label ID="Label12" runat="server" meta:resourcekey="Label12Resource1" Text="Ticket ID"></asp:Label>
                                            </label>
                                            &nbsp;<asp:TextBox ID="TicketID" runat="server" CssClass="form-control border-input" ReadOnly="True" ForeColor="Green" meta:resourcekey="TicketIDResource1"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>
                                            <asp:Label ID="Label4" runat="server" meta:resourcekey="Label4Resource1" Text="Type"></asp:Label>
&nbsp;<asp:Label ID="lbl4" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lbl4Resource1"></asp:Label></label>
                                            <asp:DropDownList ID="drpDownType" runat="server" CssClass="form-control border-input" AutoPostBack="True" OnSelectedIndexChanged="drpDownType_SelectedIndexChanged" meta:resourcekey="drpDownTypeResource1"     ></asp:DropDownList>

                                              <asp:RequiredFieldValidator ID="rfvType" runat="server" ControlToValidate="drpDownType"
                                                ErrorMessage="Please Select Type" ForeColor="Red" Display="Dynamic"
                                                ValidationGroup="updateButton" meta:resourcekey="rfvTypeResource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><span class="auto-style1">
                                            <asp:Label ID="Label5" runat="server" meta:resourcekey="Label5Resource1" Text="Application"></asp:Label>
&nbsp;<asp:Label ID="lbl3" runat="server" Text="*" ForeColor="Red" meta:resourcekey="lbl3Resource1"></asp:Label></span></label>
                                            <asp:DropDownList ID="drpDownApplication" runat="server" CssClass="form-control border-input" AutoPostBack="True" OnSelectedIndexChanged="drpDownApplication_SelectedIndexChanged" meta:resourcekey="drpDownApplicationResource1"></asp:DropDownList>

                                            
                                            <asp:RequiredFieldValidator ID="rfvApplication" runat="server" ControlToValidate="drpDownApplication"
                                                ErrorMessage="Please Select Application" ForeColor="Red" Display="Dynamic"
                                                ValidationGroup="updateButton" meta:resourcekey="rfvApplicationResource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                              


                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>
                                            <asp:Label ID="Label6" runat="server" meta:resourcekey="Label6Resource1" Text="Issue"></asp:Label>
&nbsp;<asp:Label ID="Lbl1" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Lbl1Resource1"></asp:Label></label>
                                            <asp:DropDownList ID="DrpIssueType" runat="server" CssClass="form-control border-input" OnSelectedIndexChanged="DrpIssueType_SelectedIndexChanged" meta:resourcekey="DrpIssueTypeResource1">
                                            </asp:DropDownList>

                                              <asp:RequiredFieldValidator ID="rfvIssue" runat="server" ControlToValidate="DrpIssueType"
                                                ErrorMessage="Please Select Issue" ForeColor="Red" Display="Dynamic"
                                                ValidationGroup="updateButton" meta:resourcekey="rfvIssueResource1"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>
                                            <asp:Label ID="Label7" runat="server" meta:resourcekey="Label7Resource1" Text="Issue Details"></asp:Label>
&nbsp;<asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red" meta:resourcekey="Label2Resource1"></asp:Label></label>
                                            <asp:TextBox ID="IssueDetail" runat="server" CssClass="form-control border-input" TextMode="MultiLine" meta:resourcekey="IssueDetailResource1" >Issue Details</asp:TextBox>

                                             <asp:RequiredFieldValidator ID="rfvDetails" runat="server" ControlToValidate="drpDownApplication"
                                                ErrorMessage="Please Fill Details" ForeColor="Red" Display="Dynamic"
                                                ValidationGroup="updateButton" meta:resourcekey="rfvDetailsResource1"></asp:RequiredFieldValidator>
                                             <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"   Display="Dynamic"
ControlToValidate="IssueDetail" ErrorMessage="Special characters are not allowed"  ForeColor="Red"
ValidationExpression="^([a-zA-Z0-9_\s\-]*)$"></asp:RegularExpressionValidator>--%>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>
                                            <asp:Label ID="Label8" runat="server" meta:resourcekey="Label8Resource1" Text="Priority"></asp:Label>
                                            </label>
                                            &nbsp;<asp:DropDownList ID="DrpPriority" runat="server" CssClass="form-control border-input" Enabled="False" meta:resourcekey="DrpPriorityResource1">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>
                                            <asp:Label ID="Label9" runat="server" meta:resourcekey="Label9Resource1" Text="Status"></asp:Label>
                                            </label>
                                            &nbsp;<asp:DropDownList ID="drpStatus" runat="server" CssClass="form-control border-input" Enabled="False" Visible="False" meta:resourcekey="drpStatusResource1">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>
                                            <asp:Label ID="Label10" runat="server" meta:resourcekey="Label10Resource1" Text="Document"></asp:Label>
                                            </label>
                                            &nbsp;<asp:TextBox ID="txtFileName" runat="server" CssClass="form-control border-input" ReadOnly="True" meta:resourcekey="txtFileNameResource1">No File</asp:TextBox>

                                        

                                            <asp:LinkButton ID="FileDownload" Text="
                                                       &lt;img  src=&quot;../Images/Download.png&quot;  /&gt;
                                            " runat="server" OnClick="FileDownload_Click" meta:resourcekey="FileDownloadResource1" ></asp:LinkButton>

                                          
                                            <br />
                                        </div>
                                    </div>
                                </div>
                            
                                    <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <br />
                                            <br />
                                            <div class="text-center">

                                                <asp:Button ID="btn_Edit_Details" runat="server" Text="Update Details" Style="background-color: #EB5E28;" CssClass="btn btn-info btn-fill btn-wd" BorderColor="Orange"  ValidationGroup="updateButton" Visible="False" OnClick="btn_Edit_Details_Click" meta:resourcekey="btn_Edit_DetailsResource1"    />
                                            </div>
                                        </div>
                                    </div>
                                        </div>
                                </div>

                                <br />

                             



                               



                      
                               
                                <div class="clearfix"></div>
                         
                        </div>
                    </div>
                </div>


            </div>
        </div>
       </form>
       

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
            height: 130%;
            background-color: rgba(255, 255, 255, 0.5);
            background-image: url('images/ajax-loader.gif');
            background-repeat: no-repeat;
            background-position: center;
        }
          .auto-style1 {
              width: 105px;
          }
    </style>
    <div id="loading"></div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>


