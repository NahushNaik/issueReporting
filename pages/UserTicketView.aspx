﻿<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="UserTicketView.aspx.cs" Inherits="pages_View" culture="auto" meta:resourcekey="PageResource3" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>View Ticket</title>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="BodyStart" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Body1" runat="Server">
    <a class="navbar-brand" href="#">
        <asp:Label ID="Label3" runat="server" Text="View Ticket" meta:resourcekey="Label3Resource2"></asp:Label></a>
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

    </script>


    <div class="content">
        <div class="container-fluid">
            <div class="row">

                <div class="col-lg-11 col-md-10">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">
                                <asp:Label ID="Label6" runat="server" Text="View Ticket :" meta:resourcekey="Label6Resource2"></asp:Label>
                                <asp:Label ID="lblStatus" runat="server" Text="Label" meta:resourcekey="lblStatusResource2"></asp:Label></h4>
                            <asp:Label ID="lblCreatedAt" runat="server" Text="(User)" meta:resourcekey="lblCreatedAtResource1"></asp:Label>
                        </div>
                        <div class="content">
                            <form>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">
                                                <asp:Label ID="Label7" runat="server" Text="Ticket ID" meta:resourcekey="Label7Resource2"></asp:Label></label>
                                            <asp:TextBox ID="TicketID" runat="server" CssClass="form-control border-input" ReadOnly="True" ForeColor="Green" OnTextChanged="TicketID_TextChanged" meta:resourcekey="TicketIDResource2"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><asp:Label ID="Label8" runat="server" Text="Type" meta:resourcekey="Label8Resource2"></asp:Label></label>
                                            
                                            <asp:DropDownList ID="drpDownType" runat="server" CssClass="form-control border-input" AutoPostBack="True" Enabled="False" meta:resourcekey="drpDownTypeResource2"></asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>
                                            <asp:Label ID="Label9" runat="server" Text="Application" meta:resourcekey="Label9Resource2"></asp:Label></label>
                                            <asp:DropDownList ID="drpDownApplication" runat="server" CssClass="form-control border-input" AutoPostBack="True" Enabled="False" meta:resourcekey="drpDownApplicationResource2"></asp:DropDownList>
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
                                            <label>
                                                <asp:Label ID="Label10" runat="server" Text="Issue" meta:resourcekey="Label10Resource1"></asp:Label></label>
                                            <asp:DropDownList ID="DrpIssueType" runat="server" CssClass="form-control border-input" Enabled="False" meta:resourcekey="DrpIssueTypeResource2">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label11" runat="server" Text="Issue Details" meta:resourcekey="Label11Resource2"></asp:Label></label>
                                            <asp:TextBox ID="IssueDetail" runat="server" CssClass="form-control border-input" TextMode="MultiLine" ReadOnly="True" meta:resourcekey="IssueDetailResource2">Issue Details</asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label12" runat="server" Text="Priority" meta:resourcekey="Label12Resource2"></asp:Label></label>
                                            <asp:DropDownList ID="DrpPriority" runat="server" CssClass="form-control border-input" Enabled="False" meta:resourcekey="DrpPriorityResource2">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label13" runat="server" Text="Status" meta:resourcekey="Label13Resource2"></asp:Label></label>
                                            <asp:DropDownList ID="drpStatus" runat="server" CssClass="form-control border-input" Enabled="False" meta:resourcekey="drpStatusResource2">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label14" runat="server" Text="Document" meta:resourcekey="Label14Resource2"></asp:Label></label>
                                            <asp:TextBox ID="txtFileName" runat="server" CssClass="form-control border-input" ReadOnly="True" meta:resourcekey="txtFileNameResource2">No File</asp:TextBox>

                                            <%--  <asp:Button ID="FileDownload" runat="server" CssClass="btn" Text="Download" OnClick="FileDownload_Click">
                                                  
                                              </asp:Button>--%>

                                            <asp:LinkButton ID="FileDownload" Text="
                                                       &lt;img  src=&quot;../Images/Download.png&quot;  /&gt;
                                            " runat="server" OnClick="FileDownload_Click" meta:resourcekey="FileDownloadResource2"></asp:LinkButton>

                                            <%--      <asp:LinkButton ID="lnkDownload" Text="Download"  runat="server" OnClick="lnkDownload_Click">
                                                       <img  src="../Images/Download.png"  />
                                            </asp:LinkButton>--%>
                                            <br />
                                        </div>
                                    </div>
                                </div>
                                <%--          <div class="text-center">
                                    <button type="submit" class="btn btn-info btn-fill btn-wd" disabled="disabled">Update Ticket</button>
                                </div>--%>


                                <%-- <div class="row">
                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <label>Comments</label>
                                            <asp:TextBox ID="txt_Comments" runat="server" Height="100%" CssClass="form-control border-input" TextMode="MultiLine"></asp:TextBox>


                                        </div>
                                    </div>--%>
                                    <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <br />
                                            <br />
                                            <div class="text-center">

                                                <asp:Button ID="btn_Edit_Details" runat="server" Text="Edit Details" Style="background-color: #EB5E28;" CssClass="btn btn-info btn-fill btn-wd" BorderColor="Orange" OnClick="btn_Edit_Details_Click" Visible="False" meta:resourcekey="btn_Edit_DetailsResource2"  />
                                            </div>
                                        </div>
                                    </div>
                                        </div>
                                </div>

                                <br />

                                <div class="row">
                                    <div class="col-md-9">
                                        <div class="form-group">
                                            <label>
                                                <asp:Label ID="Label15" runat="server" Text="Comments" meta:resourcekey="Label15Resource2"></asp:Label></label>
                                            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*(Comment is mandatory for updating comment)" meta:resourcekey="Label1Resource2"></asp:Label>
                                            <asp:TextBox ID="txt_Comments" runat="server" ValidationGroup="Check1" Height="100%" CssClass="form-control border-input" TextMode="MultiLine" meta:resourcekey="txt_CommentsResource2"></asp:TextBox>

                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Comments"
                                                ErrorMessage="Please Enter Comment" ForeColor="Red" Display="Dynamic"
                                                ValidationGroup="Check1" meta:resourcekey="RequiredFieldValidator2Resource2"></asp:RequiredFieldValidator>

                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <br />
                                            <br />
                                            <div class="text-center">

                                                <asp:Button ID="btn_UpdateComment" runat="server" ValidationGroup="Check1" Text="Submit Comment" Style="background-color: #EB5E28;" CssClass="btn btn-info btn-fill btn-wd" BorderColor="Orange" OnClick="btn_UpdateComment_Click" meta:resourcekey="btn_UpdateCommentResource2" />
                                            </div>
                                        </div>
                                    </div>
                                </div>



                                <h3 style="text-decoration: underline;">
                                    <asp:Label ID="Label16" runat="server" Text="Comments:" meta:resourcekey="Label16Resource2"></asp:Label></h3>
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>


                                        <div id="comment-92" class="panel panel-default">
                                            <div class="comment-content panel-body">
                                                <p>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("Comment") %>' meta:resourcekey="Label4Resource2"></asp:Label>
                                                </p>
                                            </div>
                                            <div class="panel-footer">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                        <i class="ti-user"></i>
                                                        <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="Blue" Text='<%# Eval("isAdmin") %>' meta:resourcekey="Label5Resource2"></asp:Label>
                                                        <i class="ti-alarm-clock"></i>
                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="SkyBlue" Text='<%# Eval("Created_Datetime") %>' meta:resourcekey="Label2Resource2"></asp:Label>
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
                                                        runat="server" ForeColor="White" Font-Bold="True" CausesValidation="False" meta:resourcekey="btnPageResource2"><%# Container.DataItem %></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                </div>




                                <%--<div class="col-md-12">
                                    <h5>Notification</h5>

                                    <div class="row">
                                        <div class="col-md-9">
                                            <div class="form-group">
                                                <label>Notification Details</label>
                                                <input type="text" class="form-control border-input" placeholder="First Name">
                                            </div>  
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>Add Notification</label>
                                                <button type="submit" class="btn btn-info btn-fill btn-wd">Add</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="alert alert-success">
                                        <span><b>Admin (27 Nov 2017, 14:23)- </b>This is a regular notification made withThis is a regular notification made withThis is a regular notification made withThis is a regular notification made withThis is a regular notification made with ".alert-success"</span>
                                    </div>
                                    <div class="alert alert-warning">
                                        <span><b>User  (27 Nov 2017, 14:54)- </b>This is a regular notification made with ".alert-warning"</span>
                                    </div>
                                    <div class="alert alert-warning">
                                        <span><b>User  (27 Nov 2017, 16:23)- </b>This is a regular notification made with ".alert-warning"</span>
                                    </div>
                                </div>--%>
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

