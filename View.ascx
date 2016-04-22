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
                <asp:HyperLink ID="btnPlayPause" runat="server" CssClass="btn btn-primary"
                    ToolTip="Pause" >
                </asp:HyperLink>
                <%--<asp:HyperLink ID="btnSlideInfo" runat="server" CssClass="btn btn-primary"
                    data-toggle="tooltip" >
                </asp:HyperLink>--%>
            </div>
            <asp:Panel ID="pnlSlideInfo" runat="server" CssClass="pnl-info" ></asp:Panel>
        </asp:Panel>

        <%--FIRST CONTROLS--%>
        <asp:Panel ID="pnlFirstButton" runat="server">
            <asp:HyperLink ID="lnkFirstButton" runat="server" CssClass="btn btn-primary link-add" />
        </asp:Panel>

        <%--EDIT MODE GROUP BUTTONS--%>
        <asp:Panel ID="pnlAdmin" runat="server" Visible="true" CssClass="pnl-admin">
            <div class="btn-group" role="group" aria-label="Control buttons">
                <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary link-add"
                    ResourceKey="lnkAdd" data-toggle="tooltip" ToolTip="Add New Image" />
                <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary link-edit-square"
                    ResourceKey="lnkEdit" data-toggle="tooltip" ToolTip="Edit Image Lists" />
                <asp:LinkButton ID="lnkView" runat="server" CssClass="btn btn-primary link-list"
                    ResourceKey="lnkView" data-toggle="tooltip" ToolTip="View Image Lists" />
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

        $slidesData = '<%= ModulePath %>Json/<%= ModuleId %>_Slides.json',
        $settingsData = '<%= ModulePath %>Json/<%= ModuleId %>_Settings.json',

        $settings = {};
    

    //$('#<= btnSlideInfo.ClientID %>')
    //    .html('<i class="fa ' + $lnkInfo + ' fa-2x"></i>')
    //    .addClass('active')
    //    .each(function () {
    //        $(this)
    //            .attr('data-original-title', function(index, title){
    //                return title === 'Close' ? 'Info' : 'Close';
    //            })
    //            .find('i').toggleClass($lnkInfo + ' ' + $lnkClose);
    //
    //        if($(this).is('.active')) $('#<= pnlSlideInfo.ClientID %>').show();
    //        else $('#<= pnlSlideInfo.ClientID %>').hide();
    //    })
    //    .bind('click', function () {
    //        $(this)
    //            .toggleClass('active')
    //            .attr('data-original-title', function(index, title){
    //                return title === 'Info' ? 'Close' : 'Info';
    //            })                
    //            .find('i').toggleClass($lnkInfo + ' ' + $lnkClose);
    //
    //        if($(this).is('.active')) $('#<= pnlSlideInfo.ClientID %>').fadeIn();
    //        else $('#<= pnlSlideInfo.ClientID %>').fadeOut();          
    //    });
    //


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
                //console.log('Before load JSON');
            }, true)
    		.done(function (data) {
    		    //var $settings = data.settings;
    		    $settings = data.settings;

    		})
    		.fail(function (jqXHR, textStatus) {
    		    console.log('Error loading JSON');
    		});

    $(window).load(function () {

        $('#<%= btnPlayPause.ClientID %>')//
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

                    $('#<%= pnlControlHolder.ClientID %>')
                        .addClass(($settings.rotatorType !== 'body') ? $settings.rotatorType : 'body');

                    $($moduleId).css('min-height', '150px');


                    $(($settings.rotatorType !== 'body') ? $moduleId : 'body')
                        .vegas({
                            //ppControl: $settings.ppControl,
                            //slideInfo: $settings.slideInfo,
                            slide: $settings.slide,
                            preload: $settings.preload,
                            preloadImage: $settings.preloadImage,
                            preloadVideo: $settings.preloadVideo,
                            timer: $settings.timer,
                            overlay: (($settings.overlay === true) ? '<%= ModulePath %>Vegas/overlays/' + $settings.overlayType : false),
                            autoplay: $settings.autoplay,
                            shuffle: $settings.shuffle,
                            delay: $settings.delay,
                            cover: $settings.cover,
                            color: $settings.backgroundColor,
                            align: $settings.align,
                            valign: $settings.vAlign,

                            transition: $settings.transition,
                            transitionDuration: $settings.transitionDuration,
                            transitionRegister: $settings.transitionRegister,

                            animation: $settings.animation,
                            animationDuration: $settings.animationDuration,
                            animationRegister: $settings.animationRegister,
                            
                            slides: $slides,

                            init: function (globalSettings) {
                                console.log("Init");
                            },
                            play: function (index, slideSettings) {
                                console.log("Play");
                            },
                            pause: function (index, slideSettings) {
                                console.log("Pause");
                            },
                            walk: function (index, slideSettings) {
                                $('#<%= pnlSlideInfo.ClientID %>')
    		                    .html('<h3>' + slideSettings.title + '</h3>'
                                        //+ '<span>' + $image + ' ' + slideSettings.description + '</span>'
                                        + '<span>' + $lnkCamera + ' ' + slideSettings.photographer + '</span>'
                                        + '<span>' + $lnkMail + ' <a href="mailto:' + slideSettings.contact + '" title="Send mail to ' + slideSettings.contact + '">' + slideSettings.contact + '</a></span>'
                                    );
    		            }

                    });
    		})
    		.fail(function (jqXHR, textStatus) {
    		    console.log('Error func');
    		});


    });

</script>

<dnn:DnnJsInclude ID="vegasJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Vegas/vegas.min.js" Priority="21" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Js/main.min.js" Priority="22" />


