<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="UserDash.aspx.cs" Inherits="pages_UserDash" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Dashboard</title>
    <script src="style/d3.v3.min.js" language="JavaScript"></script>
    <script src="style/liquidFillGauge.js" language="JavaScript"></script>
    <style>
        .liquidFillGaugeText
        {
            font-family: Helvetica;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyStart" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body1" runat="Server">
    <a class="navbar-brand" href="#">Dashboard</a>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body2" runat="Server">
     <script type="text/javascript">
         function DisableButton() {
             document.getElementById("<%=btnEscalate.ClientID %>").disabled = true;

        }
        window.onbeforeunload = DisableButton;

    </script>

    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <center> 
                                    <a href="UserTicketAdd.aspx" onclick="skm_LockScreen('We are processing your request...')"  class="btn btn-default btn-login" style="height:64px; background-color:#68B3C8; color:black; width:170px; font-size:25px;" >New Ticket</a>
								</center>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-slice"></i><a href="UserTicketAdd.aspx" style="color: black;" onclick="skm_LockScreen('We are processing your request...')">New Ticket</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <div class="col-xs-5">
                                    <div class="icon-big icon-success text-center">
                                        <i class="ti-face-smile"></i>
                                    </div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="numbers">
                                        <p>
                                            <asp:HyperLink ID="HyperLinkTicketsClosed" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')"></asp:HyperLink>
                                        </p>
                                        <asp:HyperLink ID="HyperLinkTicketsClosedCount" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')"></asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <asp:HyperLink ID="HyperLinkTicketClosedViewList" class="ti-list-ol" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="View List"></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <div class="col-xs-5">
                                    <div class="icon-big icon-danger text-center">
                                        <i class="ti-face-sad"></i>
                                    </div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="numbers">

                                        <p>
                                            <asp:HyperLink ID="HyperLinkTicketsOpen" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')"></asp:HyperLink>
                                        </p>
                                        <asp:HyperLink ID="HyperLinkTicketsOpenCount" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')"></asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">

                                    <asp:HyperLink ID="HyperLinkTicketOpenViewList" class="ti-list-ol" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="View List"></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>


            <div class="row">
                
                <div class="col-lg-4 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <div class="col-xs-5">
                                </div>
                                <div class="col-xs-11">
                                    <div class="numbers">
                                        <p>
                                            <asp:HyperLink ID="HyperLinkTicketRecent" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="Recent Ticket"></asp:HyperLink>
                                        </p>
                                        <asp:HyperLink ID="HyperLinkTicketDays" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')"></asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <asp:HyperLink ID="HyperLinkTicketRecentView" class="ti-list-ol" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="View List"></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                  <div class="col-lg-4 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <div class="col-xs-5">
                                    <div class="icon-big icon-danger text-center">
                                        <i class="ti-plus"></i>
                                    </div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="numbers">

                                        <p>
                                            <asp:HyperLink ID="hplFeedbackCountPositive1" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="Positive"></asp:HyperLink>
                                        </p>
                                        <asp:HyperLink ID="hplFeedbackCountPositiveText" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')"></asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">

                                    <asp:HyperLink ID="hplFeedbackCountPositive2" class="ti-list-ol" runat="server" Style="color: black;"  NavigateUrl="#" onclick="skm_LockScreen('We are processing your request...')" Text="Positive Feedback Count"></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="col-lg-4 col-sm-6">
                    <div class="card">
                        <div class="content">
                            <div class="row">
                                <div class="col-xs-5">
                                    <div class="icon-big icon-danger text-center">
                                        <i class="ti-minus"></i>
                                    </div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="numbers">

                                        <p>
                                            <asp:HyperLink ID="hplFeedbackCountNegative1" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="Negative"></asp:HyperLink>
                                        </p>
                                        <asp:HyperLink ID="hplFeedbackCountNegativeText" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')"  ></asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">

                                    <asp:HyperLink ID="hplFeedbackCountNegative2" class="ti-list-ol" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="Negative Feedback Count" NavigateUrl="#"></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <div class="header">
                            <h4 class="title">Ticket Statistics</h4>
                            <p class="category">Completion Status</p>
                        </div>
                        <div class="content">
                            <%--                            <div id="chartPreferences" class="ct-chart ct-perfect-fourth"></div>--%>
                            <div>
                                <svg id="fillgauge1" width="97%" height="Auto" onclick="gauge1.update(ResetValue());"></svg>
                                <script lang="JavaScript">
                                    var gauge1 = loadLiquidFillGauge("fillgauge1", <%=Session["ticketCompletion"].ToString()%>);
                                    var config1 = liquidFillGaugeDefaultSettings();
                                    config1.circleColor = "#FF7777";
                                    config1.textColor = "#FF4444";
                                    config1.waveTextColor = "#FFAAAA";
                                    config1.waveColor = "#FFDDDD";
                                    config1.circleThickness = 0.2;
                                    config1.textVertPosition = 0.2;
                                    config1.waveAnimateTime = 1000;
                                    function ResetValue() {
                                        //if (Math.random() > .5) {
                                        //    return Math.round(Math.random() * 100);
                                        //} else {
                                        //    return (Math.random() * 100).toFixed(1);
                                        //}

                                        return <%=Session["ticketCompletion"]%>;
                                    }
                                </script>
                            </div>

                            <div class="footer">
                                <%--<div class="chart-legend">
                                    <i class="fa fa-circle text-info"></i>Closed
											
                                    <i class="fa fa-circle text-danger"></i>Open
											
                                    <i class="fa fa-circle text-warning"></i>Discarded
                               
                                </div>--%>
                                <hr>
                                <div class="stats">
                                    <i class="ti-timer"></i>Based on no of ticket completed...
								   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card ">
                        <div class="header">
                            <h4 class="title">Support Team</h4>
                            <p class="category">Connect with support team</p>
                            
                        </div>
                        <div class="content">
                            <%--<div id="chartActivity" class="ct-chart"></div>

                            <div class="footer">
                                <div class="chart-legend">
                                    <i class="fa fa-circle text-info"></i>Ticket Count								   
                                </div>
                                <hr>
                                <div class="stats">
                                    <i class="ti-check"></i>Total created in each month...							   
                                </div>
                            </div>--%>




                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*"></asp:Label>
                                        <asp:TextBox ID="txtEscalation" runat="server" TextMode="MultiLine" class="form-control border-input" placeholder="Type your query or escalation to support team..." ValidationGroup="DocumentGroup" Rows="5"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEscalation"
                                            ErrorMessage="Required Field Support Team " ForeColor="Red" Display="Dynamic"
                                            ValidationGroup="DocumentGroup"></asp:RequiredFieldValidator>

                                        <%--<textarea rows="5" class="form-control border-input" placeholder="Type your query or escalation to support team..."></textarea>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <asp:Button ID="btnEscalate" runat="server" ValidationGroup="DocumentGroup" Text="Send" Style="background-color: #EB5E28;" class="btn btn-info btn-fill btn-wd" OnClick="btnEscalate_Click" />
                                <%--                                <button type="submit" class="btn btn-info btn-fill btn-wd">Send</button>--%>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Footer" runat="Server">
</asp:Content>

