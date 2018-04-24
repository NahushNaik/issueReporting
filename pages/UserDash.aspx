<%@ Page Title="" Language="C#" MasterPageFile="~/pages/UserMaster.master" AutoEventWireup="true" CodeFile="UserDash.aspx.cs" Inherits="pages_UserDash" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>

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
    <a class="navbar-brand" href="#">
        <asp:Label ID="Label2" runat="server" Text="Dashboard" meta:resourcekey="Label2Resource2"></asp:Label></a>
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
                                    <a href="UserTicketAdd.aspx" onclick="skm_LockScreen('We are processing your request...')"  class="btn btn-default btn-login" style="height:64px; background-color:#68B3C8; color:black; width:170px; font-size:25px;" ><asp:Label ID="Label8" runat="server" Text="New Ticket" meta:resourcekey="Label8Resource1"></asp:Label></a>
								</center>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <i class="ti-slice"></i><a href="UserTicketAdd.aspx" style="color: black;"  onclick="skm_LockScreen('We are processing your request...')"><B>
                                        <asp:Label ID="Label9" runat="server" Text="New Ticket" meta:resourcekey="Label8Resource1"></asp:Label></B></a>

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
                                    <div class="icon-big  text-center">
                                        <i class="ti-check-box"></i>
                                    </div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="numbers">
                                        <p>
                                            <asp:HyperLink ID="HyperLinkTicketsClosed" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" meta:resourcekey="HyperLinkTicketsClosedResource2">[HyperLinkTicketsClosed]</asp:HyperLink>
                                        </p>
                                        <asp:HyperLink ID="HyperLinkTicketsClosedCount" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" meta:resourcekey="HyperLinkTicketsClosedCountResource2">[HyperLinkTicketsClosedCount]</asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <asp:HyperLink ID="HyperLinkTicketClosedViewList" class="ti-list-ol" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="View List" meta:resourcekey="HyperLinkTicketClosedViewListResource2"></asp:HyperLink>
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
                                    <div class="icon-big  text-center">
                                        <i class="ti-pencil-alt"></i>
                                    </div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="numbers">

                                        <p>
                                            <asp:HyperLink ID="HyperLinkTicketsOpen" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" meta:resourcekey="HyperLinkTicketsOpenResource2">[HyperLinkTicketsOpen]</asp:HyperLink>
                                        </p>
                                        <asp:HyperLink ID="HyperLinkTicketsOpenCount" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" meta:resourcekey="HyperLinkTicketsOpenCountResource2">[HyperLinkTicketsOpenCount]</asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">

                                    <asp:HyperLink ID="HyperLinkTicketOpenViewList" class="ti-list-ol" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="View List" meta:resourcekey="HyperLinkTicketOpenViewListResource2"></asp:HyperLink>
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
                                            <asp:HyperLink ID="HyperLinkTicketRecent" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="Recent Ticket" meta:resourcekey="HyperLinkTicketRecentResource2"></asp:HyperLink>
                                        </p>
                                        <asp:HyperLink ID="HyperLinkTicketDays" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" meta:resourcekey="HyperLinkTicketDaysResource2">[HyperLinkTicketDays]</asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">
                                    <asp:HyperLink ID="HyperLinkTicketRecentView" class="ti-list-ol" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="View List" meta:resourcekey="HyperLinkTicketRecentViewResource2"></asp:HyperLink>
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
                                    <div class="icon-big text-center">
                                        <i class="ti-thumb-down"></i>
                                    </div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="numbers">

                                       <%-- <p>
                                            <asp:Label ID="Label3" Style="color: black;"  runat="server" Text="Label"></asp:Label>
                                        </p>--%>
                                        <asp:Label ID="lblWrongTicketCount" Style="color: black;"  runat="server" meta:resourcekey="lblWrongTicketCountResource1"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">

                                    <asp:HyperLink ID="HyperLink1" class="ti-list-ol" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="Wrong Ticket Raised"  NavigateUrl="~/pages/Form_Wrong_Ticket.aspx" meta:resourcekey="HyperLink1Resource1"></asp:HyperLink>
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
                                    <div class="icon-big text-center">
                                        <i class="ti-comment-alt"></i>
                                    </div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="numbers">

                                       <%-- <p>
                                            <asp:Label ID="Label3" Style="color: black;"  runat="server" Text="Label"></asp:Label>
                                        </p>--%>
                                        <asp:Label ID="lblPendingFeedback" Style="color: black;"  runat="server" meta:resourcekey="lblPendingFeedbackResource1"></asp:Label>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">

                                    <asp:HyperLink ID="HyperLink6" class="ti-list-ol" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="Pending Feedbacks" NavigateUrl="Form_Pending_Feedback.aspx" meta:resourcekey="HyperLink6Resource1"></asp:HyperLink>
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
                                    <div class="icon-big icon-success text-center">
                                        <i class="ti-face-smile"></i>
                                    </div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="numbers">

                                        <p>
                                            <asp:HyperLink ID="hplFeedbackCountPositive1" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" meta:resourcekey="hplFeedbackCountPositive1Resource2"></asp:HyperLink>
                                        </p>
                                        <asp:HyperLink ID="hplFeedbackCountPositiveText" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" meta:resourcekey="hplFeedbackCountPositiveTextResource2">[hplFeedbackCountPositiveText]</asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">

                                    <asp:HyperLink ID="hplFeedbackCountPositive2" class="ti-list-ol" runat="server" Style="color: black;" NavigateUrl="~/pages/Form_FeedbackMaster.aspx?status=Good"    Text="Happy Feedback" meta:resourcekey="hplFeedbackCountPositive2Resource2"></asp:HyperLink>
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
                                            <asp:HyperLink ID="hplFeedbackCountNegative1" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" meta:resourcekey="hplFeedbackCountNegative1Resource2"></asp:HyperLink>
                                        </p>
                                        <asp:HyperLink ID="hplFeedbackCountNegativeText" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" meta:resourcekey="hplFeedbackCountNegativeTextResource2"  >[hplFeedbackCountNegativeText]</asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">

                                    <asp:HyperLink ID="hplFeedbackCountNegative2" class="ti-list-ol" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="Not Happy Feedback"  NavigateUrl="~/pages/Form_FeedbackMaster.aspx?status=Bad" meta:resourcekey="hplFeedbackCountNegative2Resource2"></asp:HyperLink>
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
                                        <i class="ti-flickr-alt" style="color:#9da100"></i>
                                    </div>
                                </div>
                                <div class="col-xs-7">
                                    <div class="numbers">

                                        <p>
                                            <asp:HyperLink ID="HyperLink2" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" meta:resourcekey="HyperLink2Resource1"></asp:HyperLink>
                                        </p>
                                        <asp:HyperLink ID="hplFeedbackCountModerateText" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" meta:resourcekey="hplFeedbackCountModerateTextResource1"  >[hplFeedbackCountModerateText]</asp:HyperLink>
                                    </div>
                                </div>
                            </div>
                            <div class="footer">
                                <hr />
                                <div class="stats">

                                    <asp:HyperLink ID="hplModerate" class="ti-list-ol" runat="server" Style="color: black;" onclick="skm_LockScreen('We are processing your request...')" Text="Neutral Feedback"  NavigateUrl="~/pages/Form_FeedbackMaster.aspx?status=Moderate" meta:resourcekey="hplModerateResource1"></asp:HyperLink>
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
                            <h4 class="title">
                                <asp:Label ID="Label3" runat="server" Text="Ticket Statistics" meta:resourcekey="Label3Resource2"></asp:Label></h4>
                            <p class="category">
                                <asp:Label ID="Label4" runat="server" Text="Completion Status" meta:resourcekey="Label4Resource2"></asp:Label></p>
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
                                    <i class="ti-timer"></i>
                                    <asp:Label ID="Label5" runat="server" Text="Based on no of ticket completed..." meta:resourcekey="Label5Resource2"></asp:Label>
								   
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card ">
                        <div class="header">
                            <h4 class="title">
                                <asp:Label ID="Label6" runat="server" Text="Support Team" meta:resourcekey="Label6Resource2"></asp:Label></h4>
                            <p class="category">
                                <asp:Label ID="Label7" runat="server" Text="Connect with support team" meta:resourcekey="Label7Resource2"></asp:Label></p>
                            
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
                                        <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="*" meta:resourcekey="Label1Resource2"></asp:Label>
                                        <asp:TextBox ID="txtEscalation" runat="server" TextMode="MultiLine" class="form-control border-input" ValidationGroup="DocumentGroup" Rows="5" meta:resourcekey="txtEscalationResource2"></asp:TextBox>

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEscalation"
                                            ErrorMessage="Required Field Support Team " ForeColor="Red" Display="Dynamic"
                                            ValidationGroup="DocumentGroup" meta:resourcekey="RequiredFieldValidator2Resource2"></asp:RequiredFieldValidator>

                                        <%--<textarea rows="5" class="form-control border-input" placeholder="Type your query or escalation to support team..."></textarea>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center">
                                <asp:Button ID="btnEscalate" runat="server" ValidationGroup="DocumentGroup" Text="Send" Style="background-color: #EB5E28;" class="btn btn-info btn-fill btn-wd" OnClick="btnEscalate_Click" meta:resourcekey="btnEscalateResource2" />
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

