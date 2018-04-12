<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="UserTicketAdd.aspx.cs" Inherits="pages_add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>New Ticket</title>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BodyStart" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body1" runat="Server">



    <script type="text/javascript">
        function DisableButton() {
            document.getElementById("<%=btnSave.ClientID %>").disabled = true;
            document.getElementById("<%=UploadDoc.ClientID %>").disabled = true;
           
            $('#loading').show();
              

        }
        window.onbeforeunload = DisableButton;

    </script>


   <%-- <script type="text/javascript">
        $(document).ready(function () {
            $('#<%= btnSave.ClientID %>').click(function () {
             debugger;
             if (Page_IsValid == true) {

                 this.disabled = true;
                
                 $('#loading').show();

                 return true;
             }
             else {
                 return false;
             }


         });
     })

        

    </script>--%>






    <a class="navbar-brand" href="#">New Ticket</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" runat="Server">



    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-11 col-md-10">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">New Ticket</h4>
                        </div>
                        <div class="content">
                            <form>
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Ticket ID</label>
                                            <asp:TextBox ID="TicketID" runat="server" CssClass="form-control border-input" ReadOnly="true" ForeColor="Green"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Type</label>
                                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <asp:DropDownList ID="drpDownType" runat="server" CssClass="form-control border-input" AutoPostBack="true" OnSelectedIndexChanged="drpDownType_SelectedIndexChanged">
                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="drpDownType"
                                                ErrorMessage="Please Select Type" ForeColor="Red" Display="Dynamic"
                                                ValidationGroup="DocumentGroup"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Application</label>
                                            <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <asp:DropDownList ID="drpDownApplication" runat="server" CssClass="form-control border-input" AutoPostBack="true" OnSelectedIndexChanged="drpDownApplication_SelectedIndexChanged">
                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="drpDownApplication"
                                                ErrorMessage="Please Select Application" ForeColor="Red" Display="Dynamic"
                                                ValidationGroup="DocumentGroup"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>

                                <%-- <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Module</label>
                                            <input type="text" class="form-control border-input" placeholder="First Name">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Related To</label>
                                            <input type="text" class="form-control border-input" placeholder="Last Name">
                                        </div>
                                    </div>
                                </div>--%>


                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Issue</label>
                                            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <asp:DropDownList ID="DrpIssueType" runat="server" CssClass="form-control border-input">
                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="DrpIssueType"
                                                ErrorMessage="Please Select Issue" ForeColor="Red" Display="Dynamic"
                                                ValidationGroup="DocumentGroup"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Issue Details</label>
                                            <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <%--<textarea rows="5" class="form-control border-input" placeholder="Here can be your description" value="Mike">test issue details</textarea>--%>
                                            <asp:TextBox ID="IssueDetail" runat="server" CssClass="form-control border-input" placeholder="Issue Details" TextMode="MultiLine"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="IssueDetail"
                                                ErrorMessage="Required Field Area Issue Details" ForeColor="Red" Display="Dynamic"
                                                ValidationGroup="DocumentGroup"></asp:RequiredFieldValidator>
                                            <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"   Display="Dynamic"
ControlToValidate="IssueDetail" ErrorMessage="Special characters are not allowed"  ForeColor="Red"
ValidationExpression="^([a-zA-Z0-9_\s\-]*)$"></asp:RegularExpressionValidator>--%>

                                         
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Priority</label>
                                            <asp:Label ID="Label5" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <asp:DropDownList ID="DrpPriority" runat="server" CssClass="form-control border-input">
                                            </asp:DropDownList>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DrpPriority"
                                                ErrorMessage="Please Select Priority" ForeColor="Red" Display="Dynamic"
                                                ValidationGroup="DocumentGroup"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>
                                </div>


                                <div id="Satus_Group" runat="server" class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                            <label>Status</label>
                                            <asp:DropDownList ID="drpStatus" runat="server" CssClass="form-control border-input" Enabled="false">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Document</label>
                                            <asp:FileUpload ID="UploadDoc" runat="server" CssClass="form-control border-input" />

                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>



                    <div class="text-center" >
                        <%--<button type="submit" class="btn btn-info btn-fill btn-wd" onclick="">Save Ticket</button>--%>
                        <asp:Button ID="btnSave" runat="server" CssClass="btn btn-info btn-fill btn-wd"  ValidationGroup="DocumentGroup"  OnClick="btnSave_Click" Text="Save Ticket" />
                        <%--OnClientClick="if ( ! UserConfirmation()) return false;"--%>
                       

                        <br />
                        <br />
                         <asp:Label runat="server" ID="lbl_Massage" ForeColor="Red" Text="Depending on the file size..The loading time will vary...."></asp:Label>

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
            height: 100%;
            background-color: rgba(255, 255, 255, 0.5);
            background-image: url('../pages/images/ajax-loader.gif');
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>
    <div id="loading"></div>


 

    <%--    <div class="clearfix"></div>
    </form>--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

