<%@ Page Title="" Language="C#" MasterPageFile="~/pages/AdminMaster.master" AutoEventWireup="true" CodeFile="AdminTicketView.aspx.cs" Inherits="pages_AdminTicketView" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>View Ticket</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Body1" Runat="Server">
    <a class="navbar-brand" href="#">View Ticket</a>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body2" Runat="Server">
    <div class="content">
        <div class="container-fluid">
            <div class="row">

                <div class="col-lg-11 col-md-10">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">View Ticket</h4>
                        </div>
                        <div class="content">
                            <form>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Ticket ID</label>
                                            <input type="email" class="form-control border-input" disabled placeholder="Sanjeev Group Email">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Type</label>
                                            <input type="text" class="form-control border-input" placeholder="First Name">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Application</label>
                                            <input type="text" class="form-control border-input" placeholder="Last Name">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
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
                                </div>


                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Issue</label>
                                            <input type="text" class="form-control border-input" placeholder="Select Issue" value="">
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Issue Details</label>
                                            <textarea rows="5" class="form-control border-input" placeholder="Here can be your description" value="Mike">test issue details</textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Priority</label>
                                            <input type="text" class="form-control border-input" placeholder="Select Issue" value="">
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label>Status</label>
                                            <input type="text" class="form-control border-input" placeholder="Select Issue" value="" disabled>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Document</label>
                                            <input type="text" class="form-control border-input" placeholder="Select Issue" value="">
                                        </div>
                                    </div>
                                </div>


                                <div class="text-center">
                                    <button type="submit" class="btn btn-info btn-fill btn-wd">Update Ticket</button>
                                </div>





                                <div class="col-md-12">
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

