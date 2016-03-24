<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JS.Modules.JSImageRotator.View" %>

<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />

<link type="text/css" href="<%= ModulePath %>Vegas/vegas.min.css" rel="stylesheet" />

<div class="JSRotator">

    <!--BG CONTROLS-->
    <div class="container ppControlHolder">
        <button id="ppControl" type="button"></button>
        <label id="ppLabel"></label>
    </div>
</div>

<script type="text/javascript" src="<%= ModulePath %>Vegas/vegas.min.js"></script>
<script type="text/javascript" src="<%= ModulePath %>Js/main.js"></script>

<script type="text/javascript">
    //var $localPath = '/Portals/0/',
    var $localPath = '<%= ModulePath %>Images/',
        $modulePath = '<%= ModulePath %>',

        <%--$skinPath = '<%= SkinPath %>',--%>

        $play = 'fa-play-circle-o',
        $pause = 'fa-pause-circle-o',
        $camera = 'fa-camera';

    var $jsonData = 'json/';



    //console.log($modulePath + ' / ' + $localPath);

    //$('#playControl').on('click', function () {
    //    $('body').vegas('play');
    //});
    //$('#pauseControl').on('click', function () {
    //    $('body').vegas('pause');
    //});

    $('#ppControl').html('<i class="fa ' + $pause + ' fa-5x"></i>');

    $('#ppControl').bind('click', function () {
        $('body').vegas('toggle');

        $(this).find('i').toggleClass($play + ' ' + $pause);

    });

    //$(function () {
    //    $('body').vegas({
    //        delay: 30000,
    //        timer: true,
    //        shuffle: true,
    //        transition: 'fade',
    //        transitionDuration: 3000,
    //        animation: 'random',
    //        autoplay: false,
    //        overlay: $modulePath + '/Vegas/overlays/01.png',
    //        slides: [
    //            { src: $localPath + '1.jpg',  photographer: 'Mihail Hubchev - Winter in Shiroka laka village' }//,
    //            //{ src: $localPath + '2.jpg',  photographer: 'Teodor Varbanov' },
    //            //{ src: $localPath + '3.jpg',  photographer: 'Vanya Padalova' },
    //            //{ src: $localPath + '4.jpg',  photographer: 'Tencho Petkov - Monyak pano' },
    //            //{ src: $localPath + '5.jpg',  photographer: 'Alexander Karadzhov' },
    //            //{ src: $localPath + '6.jpg',  photographer: 'Elena Mandjukova' },
    //            //{ src: $localPath + '7.jpg',  photographer: 'Borislava Ivanova - Lake' },
    //            //{ src: $localPath + '8.jpg',  photographer: 'Gergana Todorova - Lake' },
    //            //{ src: $localPath + '9.jpg',  photographer: 'Ivailo Madzharov - "Autumn"' },
    //            //{ src: $localPath + '10.jpg', photographer: 'Chavdar Selinski - "Old bridge"' },
    //            //{ src: $localPath + '11.jpg', photographer: 'Chavdar Selinski - "Agushev konak" - Mogilitsa village' },
    //            //{ src: $localPath + '12.jpg', photographer: 'Mihail Hubchev - Church "St. Visarion Smolyanski" - Smolyan' },
    //            //{ src: $localPath + '13.jpg', photographer: 'Mihail Hubchev - "Winter"' }
    //        ],
    //        walk: function (index, slideSettings) {
    //            //console.log("Slide index " + index + " image " + slideSettings.src + '' + slideSettings.photographer);
    //            $('#ppLabel').html('<i class="fa ' + $camera + '"></i> ' + slideSettings.photographer);
    //
    //        }
    //    });
    //});
    //
</script>
