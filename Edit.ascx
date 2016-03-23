<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="JS.Modules.JSImageRotator.Edit" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<link type="text/css" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"/>
<link type="text/css" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css"/>

<%--BASE STYLE--%>
<%--<link type="text/css" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/datatables/1.10.11/css/jquery.dataTables.min.css"/>--%>

<%--BOOTSTRAP 3--%>
<link type="text/css" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/datatables/1.10.11/css/dataTables.bootstrap.min.css"/>

<%--USING JQUERY UI STYLE--%>
<%--<link type="text/css" rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>--%>
<%--<link type="text/css" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/datatables/1.10.11/css/dataTables.jqueryui.min.css"/>--%>

<div class="JSRotator">
    <div class="dnnForm edit">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <a href="http://www.joopsoft.com/" title="JoopSOFT on web" class="link-dev" data-toggle="tooltip">JoopSOFT.com</a>
            </h3>
        </div>
        <div class="dnnFormSectionHead">
            <div class="dnnFormItem JSRotatorMenu">
                <h3 class="dnnFormMessage dnnFormTitle no-spacing">
                    <asp:Label ID="lblJsonTitle" runat="server" ResourceKey="lblJsonTitle" />
                </h3>
                <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary link-add"
                    ResourceKey="lnkAdd-RRRRR" data-toggle="tooltip" ToolTip='Add New Image' />

                <asp:HyperLink ID="lnkSelect" runat="server" CssClass="btn btn-primary link-list"
                    ResourceKey="lnkSelect-RRRRRR" data-toggle="tooltip" ToolTip='Select Image List' />

                <asp:LinkButton ID="btnShowSelectList" runat="server" CssClass="btn btn-primary link-exch" OnClick="btnShowSelectList_Click"
                    ResourceKey="btnShowSelectList_RRRRRR" data-toggle="tooltip" ToolTip='Select From List' Visible="false" />

                <asp:LinkButton ID="btnShowAddNewList" runat="server" CssClass="btn btn-primary link-exch" OnClick="btnShowAddNewList_Click"
                    ResourceKey="btnShowAddList-RRRRR" data-toggle="tooltip" ToolTip='Create New List' Visible="false" />
            </div>
        </div>

        <fieldset>
            <div class="dnnFormItem group">
                <dnn:label ID="lblSelectList" runat="server" Visible="false" />
                <asp:DropDownList ID="lstSelectList" runat="server" CssClass="form-control grouped" AutoPostBack="True" 
                    OnSelectedIndexChanged="lstSelectList_SelectedIndexChanged" Visible="false" />

                <asp:LinkButton ID="btnDeleteList" runat="server" CssClass="btn btn-danger btn-icon link-delete" OnClick="btnDeleteList_Click"
                    ResourceKey="btnDeleteList-RRRRRRRRRRR" data-toggle="tooltip" ToolTip='Delete List' />

                <dnn:label ID="lblFileName" runat="server" />
                <asp:TextBox ID="txtFileName" runat="server" CssClass="form-control grouped" />

                <asp:LinkButton ID="btnGenerate" runat="server" CssClass="btn btn-primary link-add" OnClick="btnGenerate_Click"
                    ResourceKey="btnGenerate" data-toggle="tooltip" ToolTip='Create List' />
                <asp:Label ID="lblListAdded" runat="server" />
            </div>

            <asp:Panel ID="pnlConfirmDelete" runat="server" CssClass="dnnFormItem" Visible="false">
                <div class="confirm-wrapper">
                    <h3>
                        <asp:Label ID="lblConfirmDelete" runat="server" CssClass="confirm-msg" ResourceKey="lblConfirmDelete" />
                    </h3>
                    <asp:LinkButton ID="btnYes" runat="server" CssClass="btn btn-danger link-delete"
                        OnClick="btnYes_Click" ResourceKey="btnYes" />
                    <asp:LinkButton ID="btnNo" runat="server" CssClass="btn btn-default link-cancel"
                        OnClick="btnNo_Click" ResourceKey="btnNo" />
                </div>
            </asp:Panel>

            <div class="dnnFormItem">
                <%--<dnn:label ID="lblCreationList" runat="server" />--%>
                <%--<dnn:label ID="lblNewImg" runat="server" />--%>
                <%--<dnn:label ID="lblSelImgList" runat="server" />--%>

                <asp:HyperLink ID="lnkAddModal" runat="server" ResourceKey="lnkAdd" CssClass="btn btn-primary link-add"
                    data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" />

            </div>

            <div class="dnnFormItem">
                <h3>
                    <asp:Label ID="lblTableTitle" runat="server" ResourceKey="lblTableTitle" />
                </h3>
                <table id="table-list" class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                <asp:CheckBox ID="cbSelectAll" runat="server" AutoPostBack="true" OnCheckedChanged="cbSelectAll_CheckedChanged" />
                            </th>
                            <th>
                                <asp:Label runat="server" ResourceKey="thImage" />
                            </th>
                            <th>
                                <asp:Label runat="server" ResourceKey="thTitle" />
                            </th>
                            <th>
                                <asp:Label runat="server" ResourceKey="thDesc" />
                            </th>
                            <th>
                                <asp:Label runat="server" ResourceKey="thPhotographer" />
                            </th>
                            <th>
                                <asp:Label runat="server" ResourceKey="thContact" />
                            </th>
                            <th>
                                <asp:Label runat="server" ResourceKey="thModify" />
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptImageList" runat="server" OnItemDataBound="rptImages_ItemDataBound" OnItemCommand="rptImages_ItemCommand">
                            <HeaderTemplate>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td>
                                        <asp:Label ID="imgId" runat="server" Visible="false" Text='<%#DataBinder.Eval(Container.DataItem, "ImageId").ToString() %>' />
                                        <asp:CheckBox ID="cbSelect" runat="server" AutoPostBack="true" Checked='<%#((DataBinder.Eval(Container.DataItem,"IsSelected")!=null) && ((bool)DataBinder.Eval(Container.DataItem,"IsSelected")==true)) %>' OnCheckedChanged="cbSelect_CheckedChanged" />
                                    </td>
                                    <td>
                                        <asp:Image runat="server" CssClass="row-img"
                                            ImageUrl='<%#DataBinder.Eval(Container.DataItem, "ImageUrl").ToString() %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtTitle" runat="server" Enabled="false"
                                            data-toggle="tooltip" ToolTip='Edit title'
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImageTitle").ToString() %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDescription" runat="server" Enabled="false"
                                            data-toggle="tooltip" ToolTip='Edit description'
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImageDescription").ToString() %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPhotographer" runat="server" Enabled="false"
                                            data-toggle="tooltip" ToolTip='Edit photographer'
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImagePhotographer").ToString() %>' />
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtContact" runat="server" Enabled="false"
                                            data-toggle="tooltip" ToolTip='Edit contact'
                                            Text='<%#DataBinder.Eval(Container.DataItem,"ImageContact").ToString() %>' />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="btnEdit" runat="server" CssClass="btn btn-primary link-edit"
                                            Text="Edit" OnClick="btnEdit_Click" data-toggle="tooltip" ToolTip="Edit" />
                                        <%--<asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-primary link-cancel" ResourceKey="CancelItem" />--%>
                                        <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn btn-danger link-delete"
                                            ResourceKey="DeleteItem" CommandName="Delete" data-toggle="tooltip" ToolTip="Delete" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                            </FooterTemplate>
                        </asp:Repeater>
                    </tbody>
                    <%--<tfoot>
                    <tr>
                        <th></th>
                        <th>
                            <asp:Label runat="server" ResourceKey="thImage" />
                        </th>
                        <th>
                            <asp:Label runat="server" ResourceKey="thTitle" />
                        </th>
                        <th>
                            <asp:Label runat="server" ResourceKey="thDesc" />
                        </th>
                        <th>
                            <asp:Label runat="server" ResourceKey="thPhotographer" />
                        </th>
                        <th>
                            <asp:Label runat="server" ResourceKey="thContact" />
                        </th>
                        <th>
                            <asp:Label runat="server" ResourceKey="thModify" />
                        </th>
                    </tr>   
                </tfoot>--%>
                </table>
            </div>

            <div class="dnnFormItem controls">
                <asp:LinkButton ID="btnSubmit" runat="server"
                    OnClick="btnSubmit_Click" ResourceKey="btnSubmit" CssClass="btn btn-primary link-save" />
                <asp:LinkButton ID="btnCancel" runat="server"
                    OnClick="btnCancel_Click" ResourceKey="btnCancel" CssClass="btn btn-default link-cancel" />
            </div>
        </fieldset>
    </div>

    <div class="modal fade bs-example-modal-sm" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="exampleModalLabel">New message</h4>
                </div>
                <div class="modal-body">
                    <form class="dnnForm add-img">

                        <%--                    <div class="form-group">
                        <asp:label ID="lblImage" runat="server" />
                        <asp:FileUpload ID="btnImageSelect" runat="server" />
                        <asp:LinkButton ID="btnImageUpload" runat="server" ResourceKey="btnUpload" 
                            CssClass="dnnSecondaryAction link-upload" />
                    </div>--%>

                        <div class="form-group">
                            <asp:Label ID="lblImgSelected" runat="server" />
                            <asp:Image ID="imgPreview" runat="server" CssClass="news-image" AlternateText="News image"
                                ImageUrl="~/DesktopModules/JSNewsModule/Images/Default Image.png" />
                            <asp:LinkButton ID="btnDeleteImg" runat="server" CssClass="btn btn-danger link-delete"
                                ResourceKey="DeleteItem" />
                            <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" Enabled="false" />

                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblTitle" runat="server" CssClass="control-label" ResourceKey="thTitle" />
                            <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblDescription" runat="server" CssClass="control-label" ResourceKey="thDesc" />
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control teaser-txt" TextMode="MultiLine" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblPhotographer" runat="server" CssClass="control-label" ResourceKey="thPhotographer" />
                            <asp:TextBox ID="txtPhotographer" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblContact" runat="server" CssClass="control-label" ResourceKey="thContact" />
                            <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" />
                        </div>

                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Send message</button>
                </div>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/datatables/1.10.11/js/jquery.dataTables.min.js"></script>

<%--BOOTSTRAP JS--%>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/datatables/1.10.11/js/dataTables.bootstrap.min.js"></script>

<%--JQUERY JS--%>
<%--<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/datatables/1.10.11/js/dataTables.jqueryui.min.js"></script>--%>

<script type="text/javascript" src="<%= ModulePath %>Js/main.js"></script>
