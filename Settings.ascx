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
                <asp:HyperLink ID="joopSoft" runat="server" />
            </h3>
        </div>
        <fieldset>
            <div class="fieldset">
                <div class="dnnFormItem group">
                    <dnn:Label ID="lblRotatorType" runat="server" />
                    <asp:DropDownList ID="ddRotatorType" runat="server" CssClass="selectpicker form-control single-select check-equal"
                        data-target=".containerHeight" data-equal="container">
                        <asp:ListItem Value="body" Text="Body" />
                        <asp:ListItem Value="container" Text="Container" />
                    </asp:DropDownList>
                    <div class="containerHeight dnnFormItem">
                        <dnn:Label ID="lblMinHeight" runat="server" />
                        <asp:TextBox ID="txtMinHeight" runat="server" CssClass="form-control" TextMode="Number" />
                    </div>
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblPPControl" runat="server" />
                    <asp:CheckBox ID="cbPPControl" runat="server" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblSlideInfo" runat="server" />
                    <asp:CheckBox ID="cbSlideInfo" runat="server" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblSlide" runat="server" />
                    <asp:TextBox ID="txtSlide" runat="server" CssClass="form-control" TextMode="Number"/>
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblPreload" runat="server" />
                    <asp:CheckBox ID="cbPreload" runat="server" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblPreloadImage" runat="server" />
                    <asp:CheckBox ID="cbPreloadImage" runat="server" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblPreloadVideo" runat="server" />
                    <asp:CheckBox ID="cbPreloadVideo" runat="server" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblTimer" runat="server" />
                    <asp:CheckBox ID="cbTimer" runat="server" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblOverlay" runat="server" />                    
                    <asp:DropDownList ID="ddOverlay" runat="server" CssClass="selectpicker form-control single-select check-equal"
                        data-target=".overlayType" data-equal="path">
                        <asp:ListItem Value="true" Text="True"></asp:ListItem>
                        <asp:ListItem Value="false" Text="False"></asp:ListItem>
                        <asp:ListItem Value="path" Text="Path"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="overlayType dnnFormItem">
                    <dnn:Label ID="lblOverlayType" runat="server" />
                    <asp:DropDownList ID="ddOverlayType" runat="server" CssClass="selectpicker form-control single-select">
                        <asp:ListItem Value="01.png" Text="Overlay Type 01" />
                        <asp:ListItem Value="02.png" Text="Overlay Type 02" />
                        <asp:ListItem Value="03.png" Text="Overlay Type 03" />
                        <asp:ListItem Value="04.png" Text="Overlay Type 04" />
                        <asp:ListItem Value="05.png" Text="Overlay Type 05" />
                        <asp:ListItem Value="06.png" Text="Overlay Type 06" />
                        <asp:ListItem Value="07.png" Text="Overlay Type 07" />
                        <asp:ListItem Value="08.png" Text="Overlay Type 08" />
                        <asp:ListItem Value="09.png" Text="Overlay Type 09" />
                        <asp:ListItem Value="10.png" Text="Overlay Type 10" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblAutoplay" runat="server" />
                    <asp:CheckBox ID="cbAutoplay" runat="server" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblShuffle" runat="server" />
                    <asp:CheckBox ID="cbShuffle" runat="server" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblDelay" runat="server" />
                    <asp:TextBox ID="txtDelay" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblCover" runat="server" />
                    <asp:DropDownList ID="ddCover" runat="server" CssClass="selectpicker form-control single-select">
                        <asp:ListItem Value="true" Text="True" />
                        <asp:ListItem Value="false" Text="False" />
                        <asp:ListItem Value="repeat" Text="Repeat" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblColor" runat="server" />
                    <asp:TextBox ID="txtColor" runat="server" CssClass="form-control" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem group">
                    <dnn:Label ID="lblAlign" runat="server" />
                    <asp:DropDownList ID="ddAlign" runat="server" CssClass="selectpicker form-control single-select check-equal"
                        data-target=".percTextBox" data-equal="percentage">
                        <asp:ListItem Value="top-left" Text="Top Left" />
                        <asp:ListItem Value="top-right" Text="Top Right" />
                        <asp:ListItem Value="top-center" Text="Top Center" />
                        <asp:ListItem Value="bottom-left" Text="Bottom Left" />
                        <asp:ListItem Value="bottom-right" Text="Bottom Right" />
                        <asp:ListItem Value="bottom-center" Text="Bottom Center" />
                        <asp:ListItem Value="center-left" Text="Center Left" />
                        <asp:ListItem Value="center-right" Text="Center Right" />
                        <asp:ListItem Value="center-center" Text="Center Center" />
                        <asp:ListItem Value="percentage" Text="Percentage" />
                    </asp:DropDownList>
                </div>
                <div class="percTextBox dnnFormItem">
                    <dnn:Label ID="lblAlignPercentage" runat="server" />
                    <asp:TextBox ID="txtAlignPercentage" runat="server" CssClass="form-control" TextMode="Number" />
                </div>
                <div class="percTextBox dnnFormItem">
                    <dnn:Label ID="lblVAlignPercentage" runat="server" />
                    <asp:TextBox ID="txtVAlignPercentage" runat="server" CssClass="form-control" TextMode="Number" />
                </div>


                <%--DELETE REGION--%>
                    <asp:DropDownList ID="ddVAlign" runat="server"
                        data-target=".percTextBox"
                        Visible="false">
                    </asp:DropDownList>
                <%--END OF DELETE REGION--%>



            </div>
            <div class="fieldset">
                <div class="dnnFormItem group">
                    <dnn:Label ID="lblTransition" runat="server" />
                    <asp:ListBox ID="lbTransition" runat="server" CssClass="lbTransition selectpicker form-control multi-select"
                        data-equal="random" SelectionMode="Multiple" >
                        <asp:ListItem class="JSRandom" Value="random" Text="Random" />
                        <asp:ListItem class="JSAnimType" Value="fade" Text="Fade" />
                        <asp:ListItem class="JSAnimType" Value="fade2" Text="Fade II" />
                        <asp:ListItem class="JSAnimType" Value="slideLeft" Text="Slide Left" />
                        <asp:ListItem class="JSAnimType" Value="slideLeft2" Text="Slide Left II" />
                        <asp:ListItem class="JSAnimType" Value="slideRight" Text="Slide Right" />
                        <asp:ListItem class="JSAnimType" Value="slideRight2" Text="Slide Right II" />
                        <asp:ListItem class="JSAnimType" Value="slideUp" Text="Slide Up" />
                        <asp:ListItem class="JSAnimType" Value="slideUp2" Text="Slide Up II" />
                        <asp:ListItem class="JSAnimType" Value="slideDown" Text="Slide Down" />
                        <asp:ListItem class="JSAnimType" Value="slideDown2" Text="Slide Down II" />
                        <asp:ListItem class="JSAnimType" Value="zoomIn" Text="Zoom In" />
                        <asp:ListItem class="JSAnimType" Value="zoomIn2" Text="Zoom In II" />
                        <asp:ListItem class="JSAnimType" Value="zoomOut" Text="Zoom Out" />
                        <asp:ListItem class="JSAnimType" Value="zoomOut2" Text="Zoom Out II" />
                        <asp:ListItem class="JSAnimType" Value="swirlLeft" Text="Swirl Left" />
                        <asp:ListItem class="JSAnimType" Value="swirlLeft2" Text="Swirl Left II" />
                        <asp:ListItem class="JSAnimType" Value="swirlRight" Text="Swirl Right" />
                        <asp:ListItem class="JSAnimType" Value="swirlRight2" Text="Swirl Right II" />
                        <asp:ListItem class="JSAnimType" Value="burn" Text="Burn" />
                        <asp:ListItem class="JSAnimType" Value="burn2" Text="Burn II" />
                        <asp:ListItem class="JSAnimType" Value="blur" Text="Blur" />
                        <asp:ListItem class="JSAnimType" Value="blur2" Text="Blur II" />
                        <asp:ListItem class="JSAnimType" Value="flash" Text="Flash" />
                        <asp:ListItem class="JSAnimType" Value="flash2" Text="Flash II" />
                        <asp:ListItem class="JSAnimType" Value="negative" Text="Negative" />
                        <asp:ListItem class="JSAnimType" Value="negative2" Text="Negative II" />
                    </asp:ListBox>
                </div>
                <div class="dnnFormItem">
                    <dnn:Label ID="lblTransDurationType" runat="server" />
                    <asp:RadioButtonList ID="rblTransDurationType" runat="server" CssClass="hidder-radio" 
                        data-target=".transDur" RepeatDirection="Horizontal">
                        <asp:ListItem Value="auto" Text="Auto" />
                        <asp:ListItem Value="manual" Text="Manual" />
                    </asp:RadioButtonList>
                </div>
                <div class="transDur dnnFormItem">
                    <dnn:Label ID="lblTransDuration" runat="server" />
                    <asp:TextBox ID="txtTransDuration" runat="server" CssClass="form-control" />
                </div>
                <%--
            MOVE TO 2ND VERSE OF MODULE
                <div class="dnnFormItem">
                <dnn:Label ID="lblTransRegister" runat="server" />
                <asp:TextBox ID="txtTransRegister" runat="server" CssClass="form-control" />
            </div>
                --%>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem group">
                    <dnn:Label ID="lblAnimation" runat="server" />
                    <asp:ListBox ID="lbAnimation" runat="server" CssClass="lbAnimation selectpicker form-control multi-select"
                         data-equal="random" SelectionMode="Multiple">
                        <asp:ListItem class="JSRandom" Value="random" Text="Random" />
                        <asp:ListItem class="JSAnimType" Value="kenburns" Text="Kenburns" />
                        <asp:ListItem class="JSAnimType" Value="kenburnsUp" Text="Kenburns Up" />
                        <asp:ListItem class="JSAnimType" Value="kenburnsDown" Text="Kenburns Down" />
                        <asp:ListItem class="JSAnimType" Value="kenburnsRight" Text="Kenburns Right" />
                        <asp:ListItem class="JSAnimType" Value="kenburnsLeft" Text="Kenburns Left" />
                        <asp:ListItem class="JSAnimType" Value="kenburnsUpLeft" Text="Kenburns Up Left" />
                        <asp:ListItem class="JSAnimType" Value="kenburnsUpRight" Text="Kenburns Up Right" />
                        <asp:ListItem class="JSAnimType" Value="kenburnsDownLeft" Text="Kenburns Down Left" />
                        <asp:ListItem class="JSAnimType" Value="kenburnsDownRight" Text="Kenburns Down Right" />
                    </asp:ListBox>
                </div>
                <div class="dnnFormItem">
                    <dnn:Label ID="lblAnimDurationType" runat="server" />
                    <asp:RadioButtonList ID="rblAnimDurationType" runat="server" CssClass="hidder-radio" 
                        data-target=".animDur" RepeatDirection="Horizontal">
                        <asp:ListItem Value="auto" Text="Auto" />
                        <asp:ListItem Value="manual" Text="Manual" />
                    </asp:RadioButtonList>
                </div>
                <div class="animDur dnnFormItem">
                    <dnn:Label ID="lblAnimDuration" runat="server" />
                    <asp:TextBox ID="txtAnimDuration" runat="server" CssClass="form-control" />
                </div>
                <%--
                MOVE TO 2ND VERSE OF MODULE
                            <div class="dnnFormItem">
                <dnn:Label ID="lblAnimRegister" runat="server" />
                <asp:TextBox ID="txtAnimRegister" runat="server" CssClass="form-control" />
            </div>
                --%>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblSlides" runat="server" />
                    <asp:TextBox ID="txtSlides" runat="server" CssClass="form-control"
                        Enabled="false" />
                </div>
            </div>
            <asp:LinkButton ID="btnScrollTop" runat="server" CssClass="scroll-action btn btn-primary link-up no-txt"
                ToolTip="Top" />
        </fieldset>
    </div>
</div>

<script type="text/javascript">

    $('.JSRotator #<%= txtSlides.ClientID %>')
        .val('<%= ModulePath %>Json/' + <%= ModuleId %> + '_Slides.json');


    //CUSTOM ANIMATION & TRANSITION SELECT DEFINITION
    $('.JSRotator .lbAnimation, .JSRotator .lbTransition')
        .each(function () {
            var $value = $(this).val(),
                //$length = $(this).find(':selected').length,
                $equal = $(this).data('equal');

            if ($value !== null) {
                if ($value.toString() === $equal) {
                    //console.log('ONLY RANDOM');
                    $(this).find('[class=JSRandom]').prop('disabled', false);
                    $(this).find('[class=JSAnimType]').prop('disabled', true);
                } else {
                    //console.log("REST OF ITEMS");
                    $(this).find('[class=JSRandom]').prop('disabled', true);
                    $(this).find('[class=JSAnimType]').prop('disabled', false);
                }
            }
            else {
                //console.log("NULL ITEMS");
                $(this).find('[class=JSRandom]').prop('disabled', false);
                $(this).find('[class=JSAnimType]').prop('disabled', false);
            }
        })
        .bind('change', function () {
            var $value = $(this).val(),
                //$length = $(this).find(':selected').length,
                $equal = $(this).data('equal');

            if ($value !== null) {
                if ($value.toString() === $equal) {
                    //console.log('ONLY RANDOM');
                    $(this).find('[class=JSRandom]').prop('disabled', false);
                    $(this).find('[class=JSAnimType]').prop('disabled', true);
                    $(this).selectpicker('refresh');
                } else {
                    //console.log("REST OF ITEMS");
                    $(this).find('[class=JSRandom]').prop('disabled', true);
                    $(this).find('[class=JSAnimType]').prop('disabled', false);
                    $(this).selectpicker('refresh');
                }
            }
            else {
                //console.log("NULL ITEMS");
                $(this).find('[class=JSRandom]').prop('disabled', false);
                $(this).find('[class=JSAnimType]').prop('disabled', false);
                $(this).selectpicker('refresh');
            }
        });



</script>

<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="19" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="20" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Js/main.min.js" Priority="21" />

