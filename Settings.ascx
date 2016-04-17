<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Settings.ascx.cs" Inherits="JS.Modules.JSImageRotator.Settings" %>
<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />

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
                    <asp:ListItem>Body</asp:ListItem>
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
                <dnn:Label ID="lblOverlayType" runat="server" />
                <asp:DropDownList ID="ddOverlayType" runat="server" CssClass="selectpicker show-tick single-select" >
                    <asp:ListItem Text="Overlay Type 01" Value="01.png" />
                    <asp:ListItem Text="Overlay Type 02" Value="02.png" />
                    <asp:ListItem Text="Overlay Type 03" Value="03.png" />
                    <asp:ListItem Text="Overlay Type 04" Value="04.png" />
                    <asp:ListItem Text="Overlay Type 05" Value="05.png" />
                    <asp:ListItem Text="Overlay Type 06" Value="06.png" />
                    <asp:ListItem Text="Overlay Type 07" Value="07.png" />
                    <asp:ListItem Text="Overlay Type 08" Value="08.png" />
                    <asp:ListItem Text="Overlay Type 09" Value="09.png" />
                    <asp:ListItem Text="Overlay Type 10" Value="10.png" />
                </asp:DropDownList>
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
                <asp:DropDownList ID="ddCover" runat="server" CssClass="selectpicker show-tick single-select" >
                    <asp:ListItem value="true" Selected="True">True</asp:ListItem>
                    <asp:ListItem value="false">False</asp:ListItem>
                    <asp:ListItem value="repeat">Repeat</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblColor" runat="server" />
                <asp:TextBox ID="txtColor" runat="server" CssClass="form-control" />
            </div>
            <div class="dnnFormItem group">
                <dnn:Label ID="lblAlign" runat="server" />
                <asp:DropDownList ID="ddAlign" runat="server" CssClass="selectpicker show-tick single-select" >
                    <asp:ListItem>Center</asp:ListItem>
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
                    <asp:ListItem>Center</asp:ListItem>
                    <asp:ListItem>Top</asp:ListItem>
                    <asp:ListItem>Right</asp:ListItem>
                    <asp:ListItem>Bottom</asp:ListItem>
                    <asp:ListItem>Left</asp:ListItem>
                    <asp:ListItem>Percentage</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="dnnFormItem group">
                <dnn:Label ID="lblTransition" runat="server" />
                <asp:ListBox ID="lbTransition" runat="server" CssClass="selectpicker multi-select" SelectionMode="Multiple" >
                    <asp:ListItem>Random</asp:ListItem>                    
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
                </asp:ListBox>
            </div>
            <div class="dnnFormItem">
                <dnn:Label ID="lblTransDurationType" runat="server" />
                <asp:RadioButtonList ID="rblTransDurationType" runat="server"  RepeatDirection="Horizontal">
                    <asp:ListItem>Auto</asp:ListItem>
                    <asp:ListItem>Manual</asp:ListItem>
                </asp:RadioButtonList>
            </div> 
            <div class="dnnFormItem">
                <dnn:Label ID="lblTransDuration" runat="server" />
                <asp:TextBox ID="txtTransDuration" runat="server" CssClass="form-control" 
                    Text="1000" />
            </div>
<%--
            MOVE TO 2ND VERSE OF MODULE
                <div class="dnnFormItem">
                <dnn:Label ID="lblTransRegister" runat="server" />
                <asp:TextBox ID="txtTransRegister" runat="server" CssClass="form-control" />
            </div>
--%>
            <div class="dnnFormItem group">
                <dnn:Label ID="lblAnimation" runat="server" />
                <asp:ListBox ID="lbAnimation" runat="server" CssClass="selectpicker multi-select" SelectionMode="Multiple" >
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
                </asp:ListBox>
            </div>           
            
            <div class="dnnFormItem">
                <dnn:Label ID="lblAnimDurationType" runat="server" />
                <asp:RadioButtonList ID="rblAnimDurationType" runat="server"  RepeatDirection="Horizontal">
                    <asp:ListItem>Auto</asp:ListItem>
                    <asp:ListItem>Manual</asp:ListItem>
                </asp:RadioButtonList>
            </div>             
            <div class="dnnFormItem">
                <dnn:Label ID="lblAnimDuration" runat="server" />
                <asp:TextBox ID="txtAnimDuration" runat="server" CssClass="form-control" 
                    Text="5000" />
            </div>
<%--
                MOVE TO 2ND VERSE OF MODULE
                            <div class="dnnFormItem">
                <dnn:Label ID="lblAnimRegister" runat="server" />
                <asp:TextBox ID="txtAnimRegister" runat="server" CssClass="form-control" />
            </div>
--%>
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

<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="19" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="20" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Js/main.min.js" Priority="21" />

