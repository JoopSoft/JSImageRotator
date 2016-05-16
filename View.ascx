﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JS.Modules.JSImageRotator.View" %>
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
            <asp:Panel ID="pnlSlideInfo" runat="server" CssClass="pnl-info" ></asp:Panel>
        </asp:Panel>

        <%--FIRST CONTROLS--%>
        <asp:Panel ID="pnlFirstButton" runat="server" CssClass="btn-group">
            <asp:HyperLink ID="lnkFirstButton" runat="server" CssClass="btn btn-primary link-add" />
        </asp:Panel>

        <%--EDIT MODE GROUP BUTTONS--%>
        <asp:Panel ID="pnlAdmin" runat="server" Visible="true" CssClass="pnl-admin pull-right">
            <div class="btn-group" role="group" aria-label="Control buttons">
                <asp:Label ID="lblContentHolder" runat="server" CssClass="content-holder" />
                <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary link-add no-txt"
                    ResourceKey="lnkAdd" ToolTip="Add New Image" />
                <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary link-edit-square no-txt"
                    ResourceKey="lnkEdit" ToolTip="Edit Image Lists" />
                <asp:HyperLink ID="lnkView" runat="server" CssClass="btn btn-primary link-list no-txt"
                    ResourceKey="lnkView" ToolTip="Select Image Lists" />
            </div>
        </asp:Panel>
    </div>
</div>

<script type="text/javascript">
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

        $('.JSRotator #<%= lblContentHolder.ClientID %>')
            .html($settings.rotatorType);

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

</script>

<dnn:DnnJsInclude ID="vegasJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Vegas/vegas.min.js" Priority="21" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Js/main.min.js" Priority="22" />


