<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Settings.ascx.cs" Inherits="JS.Modules.JSImageRotator.Settings" %>
<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/LabelControl.ascx" %>

<link type="text/css" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"/>
<link type="text/css" rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css">

<div class="JSRotator">
    <div class="dnnForm settings">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon">
                <%=LocalizeString("Title")%>
                <a href="http://www.joopsoft.com/" title="JoopSOFT.com" class="link-dev">JoopSOFT.com</a>
            </h3>
        </div>
        <fieldset>
            <div class="dnnFormItem group">
                <dnn:Label ID="lblRotatorType" runat="server" />
                <asp:DropDownList ID="ddRotatorType" runat="server" CssClass="selectpicker show-tick single-select" >
                    <asp:ListItem Selected>Body</asp:ListItem>
                    <asp:ListItem>Container</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblPPControl" runat="server" />
                <asp:CheckBox ID="cbPPControl" runat="server"
                    Checked="true" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblSlideInfo" runat="server" />
                <asp:CheckBox ID="cbSlideInfo" runat="server" 
                    Checked="true" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblSlide" runat="server" />
                <asp:TextBox ID="txtSlide" runat="server" CssClass="form-control"
                    Text="0" Enabled="false" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblPreload" runat="server" />
                <asp:CheckBox ID="cbPreload" runat="server" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblPreloadImage" runat="server" />
                <asp:CheckBox ID="cbPreloadImage" runat="server" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblPreloadVideo" runat="server" />
                <asp:CheckBox ID="cbPreloadVideo" runat="server" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblTimer" runat="server" />
                <asp:CheckBox ID="cbTimer" runat="server" 
                    Checked="true" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblOverlay" runat="server" />
                <asp:CheckBox ID="cbOverlay" runat="server" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblAutoplay" runat="server" />
                <asp:CheckBox ID="cbAutoplay" runat="server" 
                    Checked="true" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblShuffle" runat="server" />
                <asp:CheckBox ID="cbShuffle" runat="server" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblDelay" runat="server" />
                <asp:TextBox ID="txtDelay" runat="server" CssClass="form-control"
                    Text="5000" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblCover" runat="server" />
                <asp:CheckBox ID="cbCover" runat="server" 
                    Checked="true" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblColor" runat="server" />
                <asp:TextBox ID="txtColor" runat="server" CssClass="form-control" />
            </div>
            <div class="dnnFormItem group">
                <dnn:Label ID="lblAlign" runat="server" />
                <asp:DropDownList ID="ddAlign" runat="server" CssClass="selectpicker show-tick single-select" >
                    <asp:ListItem Selected="True">Center</asp:ListItem>
                    <asp:ListItem>Top</asp:ListItem>
                    <asp:ListItem>Right</asp:ListItem>
                    <asp:ListItem>Bottom</asp:ListItem>
                    <asp:ListItem>Left</asp:ListItem>
                    <asp:ListItem>Percentage</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="dnnFormItem group">
                <dnn:Label ID="lblVAlign" runat="server" />
                <asp:DropDownList ID="ddVAlign" runat="server" CssClass="selectpicker show-tick single-select" >
                    <asp:ListItem Selected="True">Center</asp:ListItem>
                    <asp:ListItem>Top</asp:ListItem>
                    <asp:ListItem>Right</asp:ListItem>
                    <asp:ListItem>Bottom</asp:ListItem>
                    <asp:ListItem>Left</asp:ListItem>
                    <asp:ListItem>Percentage</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="dnnFormItem group">
                <dnn:Label ID="lblTransition" runat="server" />
                <asp:DropDownList ID="ddTransition" runat="server" CssClass="selectpicker multi-select" multiple >
                    <asp:ListItem Selected="True">Random</asp:ListItem>                    
                    <asp:ListItem>Fade</asp:ListItem>
                    <asp:ListItem>Fade 2</asp:ListItem>
                    <asp:ListItem>Slide Left</asp:ListItem>
                    <asp:ListItem>Slide Left 2</asp:ListItem>
                    <asp:ListItem>Slide Right</asp:ListItem>
                    <asp:ListItem>Slide Right 2</asp:ListItem>
                    <asp:ListItem>Slide Up</asp:ListItem>
                    <asp:ListItem>Slide Up 2</asp:ListItem>
                    <asp:ListItem>Slide Down</asp:ListItem>
                    <asp:ListItem>Slide Down 2</asp:ListItem>
                    <asp:ListItem>Zoom In</asp:ListItem>
                    <asp:ListItem>Zoom In 2</asp:ListItem>
                    <asp:ListItem>Zoom Out</asp:ListItem>
                    <asp:ListItem>Zoom Out 2</asp:ListItem>
                    <asp:ListItem>Swirl Left</asp:ListItem>
                    <asp:ListItem>Swirl Left 2</asp:ListItem>
                    <asp:ListItem>Swirl Right</asp:ListItem>
                    <asp:ListItem>Swirl Right 2</asp:ListItem>
                    <asp:ListItem>Burn</asp:ListItem>
                    <asp:ListItem>Burn 2</asp:ListItem>
                    <asp:ListItem>Blur</asp:ListItem>
                    <asp:ListItem>Blur 2</asp:ListItem>
                    <asp:ListItem>Flash</asp:ListItem>
                    <asp:ListItem>Flash 2</asp:ListItem>
                    <asp:ListItem>Negative</asp:ListItem>
                    <asp:ListItem>Negative 2</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblTransDuration" runat="server" />
                <asp:TextBox ID="txtTransDuration" runat="server" CssClass="form-control" 
                    Text="1000" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblTransRegister" runat="server" />
                <asp:TextBox ID="txtTransRegister" runat="server" CssClass="form-control" />
            </div>
            <div class="dnnFormItem group">
                <dnn:Label ID="lblAnimation" runat="server" />
                <asp:DropDownList ID="ddAnimation" runat="server" CssClass="selectpicker multi-select" multiple >
                    <asp:ListItem>Random</asp:ListItem>
                    <asp:ListItem>Kenburns</asp:ListItem>
                    <asp:ListItem>Kenburns Up</asp:ListItem>
                    <asp:ListItem>Kenburns Down</asp:ListItem>
                    <asp:ListItem>Kenburns Right</asp:ListItem>
                    <asp:ListItem>Kenburns Left</asp:ListItem>
                    <asp:ListItem>Kenburns Up Left</asp:ListItem>
                    <asp:ListItem>Kenburns Up Right</asp:ListItem>
                    <asp:ListItem>Kenburns Down Left</asp:ListItem>
                    <asp:ListItem>Kenburns Down Right</asp:ListItem>
                </asp:DropDownList>
            </div>            
            <div class="dnnFormItem">
                <dnn:Label ID="lblAnimDuration" runat="server" />
                <asp:TextBox ID="txtAnimDuration" runat="server" CssClass="form-control" 
                    Text="Auto" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblAnimRegister" runat="server" />
                <asp:TextBox ID="txtAnimRegister" runat="server" CssClass="form-control" />
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblSlides" runat="server" />
                <asp:TextBox ID="txtSlides" runat="server" CssClass="form-control"
                    Text="Json/Slides.json" Enabled="false" />
            </div>
            
        </fieldset>
    </div>
</div>

<script type="text/javascript">

    var $fullURL = '<%= ModulePath %>';
    //console.log($fullURL);
</script>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>

<%--<script type="text/javascript" src="<%= ModulePath %>Ellipsis/jquery.ellipsis.min.js"></script>--%>
<script type="text/javascript" src="<%= ModulePath %>Js/main.js" defer></script>