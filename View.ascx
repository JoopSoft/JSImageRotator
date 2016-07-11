<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JS.Modules.JSImageRotator.View" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="vegasCss" runat="server" FilePath="~/DesktopModules/JSImageRotator/Vegas/vegas.min.css" />
<dnn:DnnCssInclude ID="mainCss" runat="server" FilePath="~/DesktopModules/JSImageRotator/module.min.css" />

<div class="JSRotator">
    <div class="view">
        <%--BG CONTROLS--%>
        <asp:Panel ID="pnlControlHolder" runat="server" CssClass="pnlControlHolder">
            <div class="btn-group">
                <asp:HyperLink ID="btnPrev" runat="server" CssClass="btn btn-primary"
                    ToolTip="Previous" />
                <asp:HyperLink ID="btnPlayPause" runat="server" CssClass="btn btn-primary"
                    ToolTip="Pause" />
                <asp:HyperLink ID="btnNext" runat="server" CssClass="btn btn-primary"
                    ToolTip="Next" />
            </div>
            <asp:Panel ID="pnlSlideInfo" runat="server" CssClass="pnl-info"></asp:Panel>
        </asp:Panel>

        <%--FIRST CONTROLS--%>
        <asp:Panel ID="pnlFirstButton" runat="server" CssClass="btn-group">
            <asp:HyperLink ID="lnkFirstButton" runat="server" CssClass="btn btn-primary link-add" />
        </asp:Panel>

        <%--EDIT MODE GROUP BUTTONS--%>
        <asp:Panel ID="pnlAdmin" runat="server" Visible="true" CssClass="pnl-admin">
            <div class="btn-group" role="group" aria-label="Control buttons">
                <asp:Label ID="lblContentHolder" runat="server" />
                <asp:Label ID="lblContentHolderActivate" runat="server" />

                <asp:LinkButton ID="lnkCheckLicenseKey" runat="server"
                    OnClick="lnkCheckLicenseKey_Click" />
                <asp:LinkButton ID="lnkGetOwnerInfo" runat="server"
                    OnClick="lnkMoreInfo_Click" />
                                
                <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary link-add no-txt"
                    ResourceKey="lnkAdd" ToolTip="Add New Image" />
                <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary link-edit-square no-txt"
                    ResourceKey="lnkEdit" ToolTip="Edit Image Lists" />
                <asp:HyperLink ID="lnkView" runat="server" CssClass="btn btn-primary link-list no-txt"
                    ResourceKey="lnkView" ToolTip="Select Image Lists" />
                <asp:HyperLink ID="lnkSettings" runat="server" CssClass="btn btn-primary link-settings no-txt"
                    ResourceKey="lnkSettings" ToolTip="Settings" />
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlPopUp" runat="server" Visible="false" CssClass="popup overlay">
            <div class="popup-wrapper">
                <asp:Label ID="lblPopUpIcon" runat="server" />
                <h3>
                    <asp:Label ID="lblPopUpTitle" runat="server" CssClass="popup-msg" />
                </h3>

                <asp:Panel ID="pnlInputGroups" runat="server" CssClass="input-group">
                    <asp:Label ID="lblKey" runat="server" CssClass="input-group-addon"
                        ClientIDMode="Static" />
                    <asp:TextBox ID="txtKey" runat="server" CssClass="form-control" Enabled="true"
                        aria-describedby="lblKey"
                        Placeholder="Enter Installed Key" />
                    <span class="input-group-btn">
                        <asp:HyperLink ID="lnkSubmit" runat="server" CssClass="btn btn-primary link-key no-txt"
                            data-toggle="tooltip" />
                    </span>
                </asp:Panel>

                <asp:Panel ID="pnlAlerts" runat="server" CssClass="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true" class="link-close no-txt">&times;</span>
                    </button>
                    <asp:Label ID="lblPopUpMsg" runat="server"
                        Text="Error messaging status text.." />
                </asp:Panel>

                <asp:Panel ID="pnlButtonGroups" runat="server" CssClass="btn-group" role="group" aria-label="Control buttons">
                    <asp:LinkButton ID="btnGenConfirmKey" runat="server" CssClass="btn btn-primary link-key"
                        ResourceKey="btnGenConfirmKey"
                        data-toggle="tooltip" ToolTip="Generate Confirm Key" />

                    <asp:LinkButton ID="btnActivateModule" runat="server" CssClass="btn btn-primary link-lock"
                        ResourceKey="btnActivateModule"
                        data-toggle="tooltip" ToolTip="Activate Module" />

                    <asp:HyperLink ID="lnkOwnerInfo" runat="server" CssClass="btn btn-primary link-info"
                        href="#pnlOwnerInfo" aria-expanded="false" ResourceKey="lnkOwnerInfo"
                        data-toggle="collapse" data-toggle-tooltip="tooltip" ToolTip="Owner Info" />
                </asp:Panel>

                <asp:Panel ID="pnlOwnerInfo" runat="server" ClientIDMode="Static">
                    <div class="owner-wrapper">
                        <asp:Label ID="lblInfoInstalledKey" runat="server"
                            Text="<strong>Installed Key: </strong>47334jLJND#@fsssdg#dvjjbb343#$$" />
                        <asp:Label ID="lblInfoConfirmKey" runat="server"
                            Text="<strong>Confirm Key: </strong>fsjjdv34347bbs33D#@#$s4jLJNdg#$" />
                        <asp:Label ID="lblInfoCompany" runat="server"
                            Text="<strong>Company: </strong>JoopSOFT Ltd." />
                        <asp:Label ID="lblInfoEmail" runat="server"
                            Text="<strong>Email: </strong><a href='mailto:iliya@devedjiev.me' title='Send mail to iliya@devedjiev.me'>iliya@devedjiev.me</a>" />
                        <asp:Label ID="lblInfoCellPhone" runat="server"
                            Text="<strong>Cell: </strong>+359878/209292" />
                        <asp:Label ID="lblInfoDomain" runat="server"
                            Text="<strong>Installed on: </strong><a href='www.devedjiev.me' title='Installed domain' target='_blank'>www.devedjiev.me</a>" />
                    </div>
                </asp:Panel>


                <asp:LinkButton ID="btnClose" runat="server" CssClass="close-action btn btn-danger link-close no-txt"
                    data-toggle="tooltip" ToolTip="Close" OnClick="btnClose_Click" />
            </div>
        </asp:Panel>
    </div>
</div>

<script type="text/javascript">
    (function ($, Sys) {
        var $moduleId = '.DnnModule-<%= ModuleId %>',

            $lnkPlay = 'fa-play',
            $lnkPause = 'fa-pause',
            $lnkInfo = 'fa fa-info',
            $lnkClose = 'fa fa-close',
            $lnkCamera = '<i class="fa fa-camera"></i>',
            $lnkImage = '<i class="fa fa-image"></i>',
            $lnkMail = '<i class="fa fa-envelope"></i>',
            $lnkPrev = '<i class="fa fa-angle-left"></i>',
            $lnkNext = '<i class="fa fa-angle-right"></i>',

            $slidesData = '<%= ModulePath %>Json/<%= ModuleId %>_Slides.json',
            $settingsData = '<%= ModulePath %>Json/<%= ModuleId %>_Settings.json',
            $defaultSettingsData = '<%= ModulePath %>Json/Default_Settings.json',

            $settings = {};

        //PREDEFINED AJAX REQUEST
        function jqXHR(url, beforeLoad, cache) {
            return $.ajax({
                url: url,
                dataType: 'json',
                contentType: "application/json; charset=utf-8",
                type: 'get',
                cache: cache,
                beforeSend: beforeLoad
            })
            .always(function () {
                //console.log("complete");
            });
        };

        //GET JSON SETTINGS CONTENT
        jqXHR($settingsData,
                function () {
                    //console.log('Before load Settings JSON');
                }, true)
                .done(function (data) {
                    //var $settings = data.settings;
                    $settings = data.settings;
                })
                .fail(function (jqXHR, textStatus) {
                    console.log('Error loading Settings JSON');
                });

        $(window).load(function () {
        
            $('.JSRotator #<%= btnNext.ClientID %>')
            .html($lnkNext)
            .each(function () {
                $(this)
                    .find('i').addClass(($settings.rotatorType !== 'body') ? '' : 'fa-2x');
            })
            .bind('click', function () {
                $(($settings.rotatorType !== 'body') ? $moduleId : 'body')
                    .vegas('next');
            });

            $('.JSRotator #<%= btnPrev.ClientID %>')
                .html($lnkPrev)
                .each(function () {
                    $(this)
                        .find('i').addClass(($settings.rotatorType !== 'body') ? '' : 'fa-2x');
                })
                .bind('click', function () {
                    $(($settings.rotatorType !== 'body') ? $moduleId : 'body')
                        .vegas('previous');
                });

            $('.JSRotator #<%= btnPlayPause.ClientID %>')
                .html('<i class="fa ' + (($settings.autoplay === true) ? $lnkPause : $lnkPlay) + '"></i>')
                .each(function () {
                    $(this)
                        .attr('title', function (index, title) {
                            return $settings.autoplay === true ? 'Pause' : 'Play';
                        })
                        .find('i').addClass(($settings.rotatorType !== 'body') ? '' : 'fa-2x');
                })
                .bind('click', function () {
                    $(this)
                        .attr('title', function (index, title) {
                            return title === 'Pause' || '' ? 'Play' : 'Pause';
                        })
                        .find('i').toggleClass($lnkPlay + ' ' + $lnkPause);

                    $(($settings.rotatorType !== 'body') ? $moduleId : 'body')
                        .vegas('toggle');

                });

            //GET JSON SLIDES CONTENT
            jqXHR($slidesData,
                    function () {
                        //console.log('Before load func');
                    }, false)
                    .done(function (data) {
                        var $slides = data.slides;

                        $($moduleId).css('min-height', (($settings.rotatorType === 'container') ? $settings.minHeight : 'auto'));
                    
                        $('.JSRotator #<%= pnlControlHolder.ClientID %>')
                        .addClass(($settings.rotatorType !== 'body') ? $settings.rotatorType : 'body');

                        $(($settings.rotatorType !== 'body') ? $moduleId : 'body')
                            .vegas({
                                //ppControl: $settings.ppControl,
                                //slideInfo: $settings.slideInfo,
                                slide: $settings.slide,
                                preload: $settings.preload,
                                preloadImage: $settings.preloadImage,
                                preloadVideo: $settings.preloadVideo,
                                timer: $settings.timer,                            
                                overlay: $settings.overlay,
                                autoplay: $settings.autoplay,
                                shuffle: $settings.shuffle,
                                delay: $settings.delay,
                                cover: $settings.cover,
                                color: $settings.backgroundColor,
                                align: $settings.align,
                                valign: $settings.valign,

                                transition: $settings.transition,
                                transitionDuration: $settings.transitionDuration,
                                transitionRegister: $settings.transitionRegister,

                                animation: $settings.animation,
                                animationDuration: $settings.animationDuration,
                                animationRegister: $settings.animationRegister,
                            
                                slides: $slides,

                                init: function (globalSettings) {
                                    //console.log("Init");
                                },
                                play: function (index, slideSettings) {
                                    //console.log("Play");
                                },
                                pause: function (index, slideSettings) {
                                    //console.log("Pause");
                                },
                                walk: function (index, slideSettings) {
                                    $('.JSRotator #<%= pnlSlideInfo.ClientID %>')
    		                    .html('<h3>' + slideSettings.title + '</h3>'
                                        //+ '<span>' + $image + ' ' + slideSettings.description + '</span>'
                                        + '<span>' + $lnkCamera + ' ' + slideSettings.photographer + '</span>'
                                        + '<span>' + $lnkMail + ' <a href="mailto:' + slideSettings.contact + '" title="Send mail to ' + slideSettings.contact + '">' + slideSettings.contact + '</a></span>'
                                    );
                            }

                        });
                    })
    		.fail(function (jqXHR, textStatus) {
    		    console.log('Error Loading JSON');
    		}); 
        });

    })(jQuery, window.Sys);
</script>

<dnn:DnnJsInclude ID="vegasJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Vegas/vegas.min.js" Priority="21" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Js/main.min.js" Priority="22" />


