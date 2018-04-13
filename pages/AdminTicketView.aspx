<%@ Page Title="" Language="C#" MasterPageFile="~/pages/AdminMaster.master" AutoEventWireup="true" CodeFile="AdminTicketView.aspx.cs" Inherits="pages_AdminTicketView" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>View Ticket</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body1" Runat="Server">
    <a class="navbar-brand" href="#">
    <asp:Label ID="Label22" runat="server" meta:resourcekey="Label22Resource1" Text="View Ticket"></asp:Label>
    </a>&nbsp;
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" Runat="Server">
    <div class="content">
        <div class="container-fluid">
            <div class="row">

                <div class="col-lg-11 col-md-10">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">
                                <asp:Label ID="Label23" runat="server" meta:resourcekey="Label23Resource1" Text="View Ticket"></asp:Label>
                            </h4>
                        </div>
                        <div class="content">
                            <form>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1"><asp:Label ID="Label1" runat="server" Text="Ticket ID" meta:resourcekey="Label1Resource1"></asp:Label></label>
                                            <input type="email" class="form-control border-input" disabled placeholder="Sanjeev Group Email">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><asp:Label ID="Label2" runat="server" Text="Type" meta:resourcekey="Label2Resource1"></asp:Label>
                                            </label>
&nbsp;<input type="text" class="form-control border-input" placeholder="First Name">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><asp:Label ID="Label3" runat="server" Text="Application" meta:resourcekey="Label3Resource1"></asp:Label>
                                            </label>
&nbsp;<input type="text" class="form-control border-input" placeholder="Last Name">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><asp:Label ID="Label4" runat="server" Text="Module" meta:resourcekey="Label4Resource1"></asp:Label>
                                            </label>
&nbsp;<input type="text" class="form-control border-input" placeholder="First Name">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label><asp:Label ID="Label5" runat="server" Text="Related To" meta:resourcekey="Label5Resource1"></asp:Label>
                                            </label>
&nbsp;<input type="text" class="form-control border-input" placeholder="Last Name">
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label><asp:Label ID="Label6" runat="server" Text="Issue" meta:resourcekey="Label6Resource1"></asp:Label>
                                            </label>
                                            &nbsp;<input type="text" class="form-control border-input" placeholder="Select Issue" value="">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label><asp:Label ID="Label7" runat="server" Text="Issue Details" meta:resourcekey="Label7Resource1"></asp:Label>
                                            </label>
                                            &nbsp;<textarea rows="5" class="form-control border-input" placeholder="Here can be your description" value="Mike">test issue details</textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label><asp:Label ID="Label8" runat="server" Text="Priority" meta:resourcekey="Label8Resource1"></asp:Label>
                                            </label>
                                            &nbsp;<input type="text" class="form-control border-input" placeholder="Select Issue" value="">
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label><asp:Label ID="Label9" runat="server" Text="Status" meta:resourcekey="Label9Resource1"></asp:Label>
                                            </label>
                                            &nbsp;<input type="text" class="form-control border-input" placeholder="Select Issue" value="" disabled>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label><asp:Label ID="Label10" runat="server" Text="Document" meta:resourcekey="Label10Resource1"></asp:Label>
                                            </label>
                                            &nbsp;<input type="text" class="form-control border-input" placeholder="Select Issue" value="">
                                        </div>
                                    </div>
                                </div>


                                <div class="text-center">
                                    <button type="submit" class="btn btn-info btn-fill btn-wd"><asp:Label ID="Label11" runat="server" Text="Update Ticket" meta:resourcekey="Label11Resource1"></asp:Label>
                                    </button>
                                </div>





                                <div class="col-md-12">
                                    <h5>
                                        <asp:Label ID="Label12" runat="server" meta:resourcekey="Label12Resource1" Text="Notification"></asp:Label>
                                    </h5>

                                    <div class="row">
                                        <div class="col-md-9">
                                            <div class="form-group">
                                                <label>
                                                <asp:Label ID="Label13" runat="server" meta:resourcekey="Label13Resource1" Text="Notification Details"></asp:Label>
                                                </label>
                                                &nbsp;<input type="text" class="form-control border-input" placeholder="First Name">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>
                                                <asp:Label ID="Label14" runat="server" meta:resourcekey="Label14Resource1" Text="Add Notification"></asp:Label>
                                                </label>
                                                <button type="submit" class="btn btn-info btn-fill btn-wd">
                                                    <asp:Label ID="Label15" runat="server" meta:resourcekey="Label15Resource1" Text="Add"></asp:Label>
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="alert alert-success">
                                        <span><b>
                                        <asp:Label ID="Label16" runat="server" meta:resourcekey="Label16Resource1" Text="Admin (27 Nov 2017, 14:23)-"></asp:Label>
&nbsp;</b><asp:Label ID="Label17" runat="server" meta:resourcekey="Label17Resource1" Text="This is a regular notification made withThis is a regular notification made withThis is a regular notification made withThis is a regular notification made withThis is a regular notification made with &quot;.alert-success&quot;"></asp:Label>
                                        </span>
                                    &nbsp;</div>
                                    <div class="alert alert-warning">
                                        <span><b>
                                        <asp:Label ID="Label18" runat="server" meta:resourcekey="Label18Resource1" Text="User (27 Nov 2017, 14:54)-"></asp:Label>
&nbsp;</b><asp:Label ID="Label19" runat="server" meta:resourcekey="Label19Resource1" Text="This is a regular notification made with &quot;.alert-warning&quot;"></asp:Label>
                                        </span>
                                    &nbsp;</div>
                                    <div class="alert alert-warning">
                                        <span><b>
                                        <asp:Label ID="Label20" runat="server" meta:resourcekey="Label20Resource1" Text="User (27 Nov 2017, 16:23)-"></asp:Label>
&nbsp;</b><asp:Label ID="Label21" runat="server" meta:resourcekey="Label21Resource1" Text="This is a regular notification made with &quot;.alert-warning&quot;"></asp:Label>
                                        </span>
                                    &nbsp;</div>
                                </div>
                                <div class="clearfix"></div>
                            </form>
                        </div>
                    </div>
                </div>


            </div>
        </div>
</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Footer" Runat="Server">
</asp:Content>

