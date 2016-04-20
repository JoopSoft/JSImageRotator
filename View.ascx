<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JS.Modules.JSImageRotator.View" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="vegasCss" runat="server" FilePath="~/DesktopModules/JSImageRotator/Vegas/vegas.min.css" />

<div class="JSRotator">
    <div class="view">
        <%--BG CONTROLS--%>
        <div class="ppControlHolder body">
            <div class="btn-group">
                <asp:LinkButton ID="ppControl" runat="server" CssClass="btn btn-primary"
                    data-toggle="tooltip" title="Pause">
                </asp:LinkButton>
                <asp:LinkButton ID="slideInfo" runat="server" CssClass="btn btn-primary"
                    data-toggle="tooltip" title="Info">
                </asp:LinkButton>
            </div>
            <div id="ppLabel"></div>
        </div>

        <%--FIRST CONTROLS--%>
        <asp:Panel ID="pnlFirstButton" runat="server">
            <asp:HyperLink ID="lnkFirstButton" runat="server" CssClass="btn btn-primary link-add" />
        </asp:Panel>
    </div>
</div>

<script type="text/javascript">
    var $localPath = '<%= ModulePath %>Images/',
        //$localPath = '/Portals/0/',
        $modulePath = '<%= ModulePath %>',
        $moduleId = '.DnnModule-<%= ModuleId %>',

        $ppControl = <%= ppControl.ClientID %>,

        $play = 'fa-play-circle-o',
        $pause = 'fa-pause-circle-o',
        $info = '<i class="fa fa-info fa-2x"></i>',
        $camera = '<i class="fa fa-camera"></i>',
        $image = '<i class="fa fa-image"></i>',
        $mail = '<i class="fa fa-envelope"></i>',

        $jsonData = $modulePath + 'Json/<%= ModuleId %>_Slides.json';
    
    //console.log($modulePath + ' / ' + $localPath + ' / ' + $jsonData);
    console.log($moduleId);

    //$('#playControl').on('click', function () {
    //    $('body').vegas('play');
    //});
    //$('#pauseControl').on('click', function () {
    //    $('body').vegas('pause');
    //});

    $('#<%= ppControl.ClientID %>')
        .html('<i class="fa ' + $pause + ' fa-2x"></i>')
        .bind('click', function () {
            $('body').vegas('toggle');

            $(this).find('i').toggleClass($play + ' ' + $pause);
        });

    $('#<%= slideInfo.ClientID %>')
        .html($info);
    //.popover({
    //    title: slideSettings.Title,
    //    content: '<span>' + $camera + ' ' + slideSettings.Photographer + '</span><span>' + $mail + ' <a href="mailto:' + slideSettings.Contact + '" title="Send mail to ' + slideSettings.Contact + '">' + slideSettings.Contact + '</a></span>',
    //    template: '<div class="popover" role="tooltip">'
    //                + '<div class="arrow"></div>'
    //                + '<h3 class="popover-title"></h3>'
    //                + '<div class="popover-content"></div>'
    //              + '</div>',
    //    placement: 'bottom'
    //});

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
    }

    //GET CUSTOM ELEMENTS JSON CONTENT
    jqXHR($jsonData,
            function () {
                //console.log('Before load func');
            }, false)
    		.done(function (data) {
    		    var $slides = data.slides;

    		    console.log($slides);

    		    $('body')
    		    //$($moduleId)
                //    .addClass('JSRotator-container')
                //    .parent()
                    .vegas({
    		            delay: 30000,
    		            timer: true,
    		            shuffle: true,
    		            transition: 'fade',
    		            transitionDuration: 3000,
    		            animation: null, //'random',
    		            autoplay: false,
    		            overlay: $modulePath + '/Vegas/overlays/01.png',
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
    		                //console.log("Slide index " + index + " image " + slideSettings.src + '' + slideSettings.photographer);
    		                //$('#ppLabel')
                            //    .html('<h3>' + slideSettings.Title + '</h3>'
                            //            //+ '<span>' + $image + ' ' + slideSettings.Description + '</span>'
                            //            + '<span>' + $camera + ' ' + slideSettings.Photographer + '</span>'
                            //            + '<span>' + $mail + ' <a href="mailto:' + slideSettings.Contact + '" title="Send mail to ' + slideSettings.Contact + '">' + slideSettings.Contact + '</a></span>'                    
                            //        );

    		            }
    		        
    		    });

    		})
    		.fail(function (jqXHR, textStatus) {
    		    console.log('Error func');
    		});



</script>

<dnn:DnnJsInclude ID="vegasJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Vegas/vegas.min.js" Priority="21" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSImageRotator/Js/main.min.js" Priority="22" />


