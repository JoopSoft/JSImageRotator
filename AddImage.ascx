<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddImage.ascx.cs" Inherits="JS.Modules.JSImageRotator.AddImage" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<link type="text/css" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"/>
<link type="text/css" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">

<div class="JSRotator">
    <div class="dnnForm add-img">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <a href="http://www.joopsoft.com/" title="JoopSOFT.com" class="link-dev">JoopSOFT.com</a>
            </h3>
        </div>
        <div class="dnnFormSectionHead">
            <div class="dnnFormItem JSRotatorMenu">
                <h3 class="dnnFormMessage two-controls dnnFormTitle no-spacing">
                    <asp:Label ID="lblAddedImage" runat="server" Text="Adding New Image" />
                </h3>
                <%--<asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary link-add no-txt"
                    data-toggle="tooltip" ToolTip="Add New Image" />--%>

                <asp:HyperLink ID="btnSubmit" runat="server" CssClass="btn btn-primary link-edit-square no-txt" 
                    data-toggle="tooltip" ToolTip="Edit Lists" Visible="true" />

                <asp:HyperLink ID="lnkSelect" runat="server" CssClass="btn btn-primary link-list no-txt"
                    data-toggle="tooltip" ToolTip="View Image Lists" Visible="true" />

                <%--<asp:LinkButton ID="btnShowAddNewList" runat="server" CssClass="btn btn-primary link-exch no-txt" 
                    data-toggle="tooltip" ToolTip="Create New List" />--%>
            </div>
        </div>
                
        <fieldset>
            <div class="dnnFormItem">
                <dnn:label ID="lblImage" runat="server" />
                <asp:FileUpload ID="btnImageSelect" runat="server" />
                <asp:LinkButton ID="btnImageUpload" runat="server" CssClass="dnnSecondaryAction link-upload"  
                    OnClick="btnImageUpload_Click" ResourceKey="btnUpload" />
            </div>
            <asp:Panel ID="pnlImgSelected" runat="server" CssClass="dnnFormItem group">
                <dnn:label ID="lblImgSelected" runat="server" />
                <asp:Image ID="imgPreview" runat="server" CssClass="rotator-image" 
                    Visible="false" AlternateText="Rotator Image" ImageUrl="~/DesktopModules/JSNewsModule/Images/Default Image.png" />
                <asp:LinkButton ID="btnDeleteImg" runat="server" CssClass="btn btn-danger link-delete" Visible="false" 
                    OnClick="btnDeleteImg_Click" ResourceKey="btnDeleteImg" />
                <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control txt-img-url" Enabled="false" />
            </asp:Panel>
            <asp:Panel ID="pnlAddToList" runat="server" CssClass="dnnFormItem group">
                <dnn:label ID="lblAvailableLists" runat="server" Visible="false" />
                <asp:CheckBox ID="cbAddToList" runat="server" Visible="false" 
                    OnCheckedChanged="cbAddToList_CheckedChanged" AutoPostBack="true" />
                <asp:DropDownList ID="lstAvailableLists" runat="server" CssClass="selectpicker show-tick single-select cb-group"
                    Visible="false" />
            </asp:Panel>
            
            <asp:Panel ID="pnlConfirmDelete" runat="server" Visible="false">
                <div class="popup-wrapper">
                    <asp:Label ID="lblConfirmIcon" runat="server" />
                    <h3>
                        <asp:Label ID="lblConfirmDelete" runat="server" CssClass="popup-msg"
                            ResourceKey="lblConfirmDelete" />
                    </h3>
                    <asp:LinkButton ID="btnYes" runat="server" CssClass="primary-action btn btn-danger link-delete"
                        OnClick="btnYes_Click" ResourceKey="btnYes"
                        data-toggle="tooltip" ToolTip="Delete Image" />
                    <asp:LinkButton ID="btnNo" runat="server" CssClass="close-action btn btn-default link-close"
                        OnClick="btnNo_Click" 
                        data-toggle="tooltip" ToolTip="Close" />
                </div>
            </asp:Panel>
            <div class="dnnFormItem">
                <dnn:label ID="lblTitle" runat="server" />
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" />
            </div>
            <div class="dnnFormItem">
                <dnn:label ID="lblDescription" runat="server" />
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control teaser-txt" TextMode="MultiLine" />
            </div>
            <div class="dnnFormItem">
                <dnn:label ID="lblPhotographer" runat="server" />
                <asp:TextBox ID="txtPhotographer" runat="server" CssClass="form-control" />
            </div>
            <div class="dnnFormItem">
                <dnn:label ID="lblContact" runat="server" />
                <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" />
            </div>
        </fieldset>
    </div>
    <div class="dnnForm controls">
        <div class="dnnFormItem">
            <asp:LinkButton ID="btnAddImage" runat="server" CssClass="btn btn-primary link-add" 
                OnClick="btnAddImage_Click" ResourceKey="btnAddImage" />            
            <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-default link-cancel"
                OnClick="btnCancel_Click" ResourceKey="btnCancel"  />
        </div>
    </div>
</div>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="<%= ModulePath %>Js/main.js" defer></script>
