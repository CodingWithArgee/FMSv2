﻿<%@ Page Title="" Language="C#" MasterPageFile="~/FMS.Master" AutoEventWireup="true" CodeBehind="DepartmentApprover.aspx.cs" Inherits="WebApp_FMS_V2.DepartmentApprover" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Department Approver - Requisition System
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeaderContent" runat="server">
    <!-- DataTables CSS -->
    <link href="../assets/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet" />
    <!-- DataTables Responsive CSS -->
    <link href="../assets/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet" />
    <!-- Personal CSS -->
    <link href="assets/extra.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BodyContent" runat="server">
    <br />
    <div class="row">
        <div class="col-md-10">
            <ul class="breadcrumb">
                <li><a href="Home">Home</a></li>
                <li>Administator</li>
                <li>Data Management</li>
                <li>Department Approver</li>
            </ul>
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnDeptApprover_Create" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Create" OnClick="btnDeptApprover_Create_Click" />
            <asp:Button ID="btnDeptApprover_Back" runat="server" CssClass="btn btn-md btn-warning btn-block" Text="Back" OnClick="btnDeptApprover_Back_Click" />
        </div>
    </div>

    <asp:MultiView ID="mvDeptApproverList" runat="server">
        <asp:View ID="vwViewDeptApproverList" runat="server">
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-4">
                                    <h4>View Department Approver</h4>
                                </div>
                                <div class="col-md-4 col-md-offset-4">
                                    <div class="form-group input-group mTop3-form-group">
                                        <asp:TextBox ID="txtApproverList_Search" runat="server" CssClass="form-control" placeholder="Search" />
                                        <span class="input-group-btn">
                                            <asp:LinkButton ID="lnkDeptApproverList_Search" runat="server" CssClass="btn btn-default btn-padding" OnClick="lnkDeptApproverList_Search_Click">
                                        <i class="fa fa-search"></i></asp:LinkButton>
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body">
                            <asp:GridView runat="server" ID="gvDeptApproverList" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" AllowPaging="true" PageSize="10"
                                HeaderStyle-HorizontalAlign="Center" PagerStyle-CssClass="pagination" OnRowCommand="gvDeptApproverList_RowCommand" OnPageIndexChanging="gvDeptApproverList_PageIndexChanging"
                                OnSelectedIndexChanged="gvDeptApproverList_SelectedIndexChanged">
                                <Columns>
                                    <asp:BoundField DataField="DepartmentID" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="DepartmentName" HeaderText="Department" />
                                    <asp:BoundField DataField="ManilaApproverID1" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="ManilaApproverID2" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="GenSanApproverID1" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="GenSanApproverID2" HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide" />
                                    <asp:BoundField DataField="ManilaFullName1" HeaderText="Manila Approver 1" />
                                    <asp:BoundField DataField="ManilaFullName2" HeaderText="Manila Approver 2" />
                                    <asp:BoundField DataField="GenSanFullName1" HeaderText="GenSan Approver 1" />
                                    <asp:BoundField DataField="GenSanFullName2" HeaderText="GenSan Approver 2" />

                                    <asp:TemplateField ItemStyle-Width="5%" ShowHeader="False" HeaderText="Action" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lnkSelect" CausesValidation="false" CommandName="Select" CssClass="btn btn-primary" title="Select"
                                                CommandArgument='<%# Container.DataItemIndex %>' data-rel="tooltip"><i class="glyphicon glyphicon-th-list"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    No data found.
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </asp:View>
        <asp:View ID="vwDetailsDeptApproverList" runat="server">
            <asp:HiddenField ID="hfDeptApproverID" runat="server" Visible="false" />
            <h4>Approver Details</h4>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblDeptApproverDetails_DepartmentName" runat="server" Text="Department Name **" />
                    <asp:TextBox ID="txtDeptApproverDetails_DepartmentName" runat="server" CssClass="form-control" placeholder="Department Name" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblDeptApproverDetails_ManilaApprover1" runat="server" Text="Manila Approver 1" />
                    <asp:DropDownList ID="ddlDeptApproverDetails_ManilaApprover1" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblDeptApproverDetails_ManilaApprover2" runat="server" Text="Manila Approver 2" />
                    <asp:DropDownList ID="ddlDeptApproverDetails_ManilaApprover2" runat="server" CssClass="form-control" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblDeptApproverDetails_GenSanApprover1" runat="server" Text="GenSan Approver 1" />
                    <asp:DropDownList ID="ddlDeptApproverDetails_GenSanApprover1" runat="server" CssClass="form-control" />
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblDeptApproverDetails_GenSanApprover2" runat="server" Text="GenSan Approver 2" />
                    <asp:DropDownList ID="ddlDeptApproverDetails_GenSanApprover2" runat="server" CssClass="form-control" />
                </div>
            </div>
            <br /><br />
            <asp:Label ID="lblDeptApproverDetails_Alert" runat="server" CssClass="AlertRed" />
            <br /><br />
            <div class="row">
                <div class="col-md-2">
                    <asp:Button ID="btnDeptApproverDetails_Submit" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Submit" OnClick="btnDeptApproverDetails_Submit_Click" />
                </div>
                <div class="col-md-2">
                    <asp:Button ID="btnDeptApproverDetails_Cancel" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="Cancel" OnClick="btnDeptApproverDetails_Cancel_Click" />
                </div>
            </div>

            <div id="modalNotification" runat="server" class="modal">
                <div class="modal-content">
                    <div class="row">
                        <div class="col-md-12">
                            <center><h3><asp:Label ID="lblDeptApproverDetails_NotifHeader" runat="server" /></h3></center>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-12">
                            <center><asp:Label ID="lblDeptApproverDetails_NotifBody" runat="server" /></center>
                        </div>
                    </div>
                    <br /><br /><br />
                    <div class="row">
                        <div class="col-md-7"></div>
                        <div class="col-md-2">
                            <asp:Button ID="btnDeptApproverDetails_SaveYes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Yes" OnClick="btnDeptApproverDetails_SaveYes_Click" />
                            <asp:Button ID="btnDeptApproverDetails_CancelYes" runat="server" CssClass="btn btn-md btn-success btn-block" Text="Yes" OnClick="btnDeptApproverDetails_CancelYes_Click" />
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnDeptApproverDetails_No" runat="server" CssClass="btn btn-md btn-danger btn-block" Text="No" OnClick="btnDeptApproverDetails_No_Click" />
                        </div>
                    </div>
                    <br />
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FooterContent" runat="server">
</asp:Content>
