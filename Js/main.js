/*globals jQuery, window, Sys */
(function ($, Sys) {
    //function dnnEditBasicSettings() {
    //    $('#dnnEditBasicSettings').dnnPanels();
    //    $('#dnnEditBasicSettings .dnnFormExpandContent a').dnnExpandAll({ expandText: '<%=Localization.GetString("ExpandAll", LocalResourceFile)%>', collapseText: '<%=Localization.GetString("CollapseAll", LocalResourceFile)%>', targetArea: '#dnnEditBasicSettings' });
    //}

    $(function () {
        $('[data-toggle="tooltip"]').tooltip({

            placement: 'auto left'
        })
    });

    $(document).ready(function () {

        //CUSTOM MODULE FOR CHECKING EXISTING AN ELEMENS
        jQuery.fn.exists = function () { return this.length > 0; }

        var $lnkAdd = '<i class="fa fa-plus-circle"></i>',
            $lnkEdit = '<i class="fa fa-pencil"></i>',
            $lnkDelete = '<i class="fa fa-trash-o"></i>',
            $lnkBack = '<i class="fa fa-angle-left"></i>',
            $lnkHome = '<i class="fa fa-home"></i>',
            $lnkAll = '<i class="fa fa-external-link"></i>',
            $lnkUpload = '<i class="fa fa-upload"></i>',
            $lnkSave = '<i class="fa fa-floppy-o"></i>',
            $lnkCancel = '<i class="fa fa-ban"></i>',
            $lnkInfo = '<i class="fa fa-info-circle"></i>',

            $lnkPrev = '<i class="fa fa-angle-left"></i>',
            $lnkNext = '<i class="fa fa-angle-right"></i>',
            $largeIcon = 'fa-lg';


        //CUTTING TEXT BY ELLIPSIS PLUGIN
        if ($('.rpt-list .teaser-txt').exists()) $('.rpt-list .teaser-txt').ellipsis({
            row: 5,
            onlyFullWords: true
        });

        //CUTTING TEXT BY ELLIPSIS PLUGIN
        if ($('.rpt-accordion .teaser-txt').exists()) $('.rpt-accordion .teaser-txt').ellipsis({
            row: 2,
            onlyFullWords: true
        });

        $('.link-save').prepend($lnkSave + ' ');
        $('.link-cancel').prepend($lnkCancel + ' ');
        $('.link-all').prepend($lnkAll + ' ');
        $('.link-upload').prepend($lnkUpload + ' ');

        $('a.dnnFormHelp').prepend($lnkInfo);


        $('.details-view .link-home').prepend($lnkHome + ' ');
        $('.details-view .link-back').prepend($lnkBack + ' ');
        $('.details-view .link-edit').prepend($lnkEdit + ' ');
        $('.details-view .link-delete').prepend($lnkDelete + ' ');


        $('.rpt-list .link-edit').prepend($lnkEdit + ' ');
        $('.rpt-list .link-add').prepend($lnkAdd + ' ');
        $('.rpt-list .link-delete').prepend($lnkDelete + ' ');
        $('.rpt-list .link-prev, .details-view .link-prev').prepend($lnkPrev + ' ');
        $('.rpt-list .link-next, .details-view .link-next').append(' ' + $lnkNext);


        $('.rpt-accordion .link-edit').html($lnkEdit);
        $('.rpt-accordion .link-add').html($lnkAdd);
        $('.rpt-accordion .link-delete').html($lnkDelete);
        $('.rpt-accordion .link-prev').html($lnkPrev);
        $('.rpt-accordion .link-next').html($lnkNext);

        //COLLAPSING BY BOOTSTRAP FRAMEWORK
        $('.collapse').collapse();


        //dnnEditBasicSettings();
        //Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        //    dnnEditBasicSettings();
        //});
    });

}(jQuery, window.Sys));