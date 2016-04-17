/*globals jQuery, window, Sys */
'use strict';

(function ($, Sys) {
    //function dnnEditBasicSettings() {
    //    $('#dnnEditBasicSettings').dnnPanels();
    //    $('#dnnEditBasicSettings .dnnFormExpandContent a').dnnExpandAll({ expandText: '<%=Localization.GetString("ExpandAll", LocalResourceFile)%>', collapseText: '<%=Localization.GetString("CollapseAll", LocalResourceFile)%>', targetArea: '#dnnEditBasicSettings' });
    //}

    $(document).ready(function () {

        //dnnEditBasicSettings();
        //Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        //    dnnEditBasicSettings();
        //});

        //CUSTOM MODULE FOR CHECKING EXISTING AN ELEMENS
        $.fn.exists = function () {
            return this.length > 0;
        };

        //CUSTOM SMALL MODULE FOR GET ENTER KEY PRESS
        $.fn.enterKey = function (fnc) {
            return this.each(function () {
                $(this).keyup(function (ev) {
                    var keycode = ev.keyCode ? ev.keyCode : ev.which;
                    if (keycode == 13) {
                        fnc.call(this, ev);
                    }
                });
            });
        };
        //CUSTOM SMALL MODULE FOR GET ESCAPE KEY PRESS
        $.fn.escapeKey = function (fnc) {
            return this.each(function () {
                $(this).keyup(function (ev) {
                    var keycode = ev.keyCode ? ev.keyCode : ev.which;
                    if (keycode == '27') {
                        fnc.call(this, ev);
                        console.log('asdafsjghd');
                    }
                });
            });
        };

        $.fn.JSKeyUp = function () {
            return this.each(function () {
                $(this).keyup(function (e) {
                    var code = e.keyCode ? e.keyCode : e.which;

                    switch (code) {
                        case 27:
                            alert('ESC');
                            break;
                        case 13:
                            alert('ENTER');
                            break;
                        case 32:
                            alert('SPACE');
                            break;
                    }
                });
            });
        };

        var $lnkAdd = '<i class="fa fa-plus-circle"></i>',
            $lnkEdit = '<i class="fa fa-pencil"></i>',
            $lnkEditSquare = '<i class="fa fa-pencil-square-o"></i>',
            $lnkDelete = '<i class="fa fa-trash-o"></i>',
            $lnkBack = '<i class="fa fa-angle-left"></i>',
            $lnkHome = '<i class="fa fa-home"></i>',
            $lnkAll = '<i class="fa fa-external-link"></i>',
            $lnkUpload = '<i class="fa fa-upload"></i>',
            $lnkSave = '<i class="fa fa-floppy-o"></i>',
            $lnkCancel = '<i class="fa fa-ban"></i>',
            $lnkSuccess = '<i class="fa fa-check-circle"></i>',
            $lnkInfo = '<i class="fa fa-info-circle"></i>',
            $lnkList = '<i class="fa fa-list"></i>',
            $lnkExch = '<i class="fa fa-exchange"></i>',
            $lnkImage = '<i class="fa fa-picture-o"></i>',
            $lnkClose = '<i class="fa fa-close"></i>',
            $lnkWarning = '<i class="fa fa-warning"></i>',
            $lnkPrev = '<i class="fa fa-angle-left"></i>',
            $lnkNext = '<i class="fa fa-angle-right"></i>',
            $largeIcon = 'fa-lg';

        //PUSHED MIXED UP ICON AND TEXT ONTO ELEMENTS
        $('.JSRotator .link-add').prepend($lnkAdd + ' ');
        $('.JSRotator .link-edit').prepend($lnkEdit + ' ');
        $('.JSRotator .link-edit-square').prepend($lnkEditSquare + ' ');
        $('.JSRotator .link-delete').prepend($lnkDelete + ' ');
        $('.JSRotator .link-back').prepend($lnkBack + ' ');
        $('.JSRotator .link-home').prepend($lnkHome + ' ');
        $('.JSRotator .link-all').prepend($lnkAll + ' ');
        $('.JSRotator .link-upload').prepend($lnkUpload + ' ');
        $('.JSRotator .link-save').prepend($lnkSave + ' ');
        $('.JSRotator .link-cancel').prepend($lnkCancel + ' ');
        $('.JSRotator .link-info').prepend($lnkInfo + ' ');
        $('.JSRotator .link-prev').prepend($lnkPrev + ' ');
        $('.JSRotator .link-close').prepend($lnkClose + ' ');
        $('.JSRotator .link-warning').prepend($lnkWarning + ' ');
        $('.JSRotator .link-success').prepend($lnkSuccess + ' ');
        $('.JSRotator .link-list').prepend($lnkList + ' ');
        $('.JSRotator .link-exch').prepend($lnkExch + ' ');
        $('.JSRotator .link-image').prepend($lnkImage + ' ');
        $('.JSRotator .link-next').append(' ' + $lnkNext);

        //PUSHED ONLY ICONS ON ELEMTNS
        $('.JSRotator .link-add.no-txt').html($lnkAdd);
        $('.JSRotator .link-edit.no-txt').html($lnkEdit);
        $('.JSRotator .link-edit-square.no-txt').html($lnkEditSquare + ' ');
        $('.JSRotator .link-delete.no-txt').html($lnkDelete);
        $('.JSRotator .link-back.no-txt').html($lnkBack);
        $('.JSRotator .link-home.no-txt').html($lnkHome);
        $('.JSRotator .link-all.no-txt').html($lnkAll);
        $('.JSRotator .link-upload.no-txt').html($lnkUpload);
        $('.JSRotator .link-save.no-txt').html($lnkSave);
        $('.JSRotator .link-cancel.no-txt').html($lnkCancel);
        $('.JSRotator .link-info.no-txt').html($lnkInfo);
        $('.JSRotator .link-prev.no-txt').html($lnkPrev);
        $('.JSRotator .link-next.no-txt').html($lnkNext);
        $('.JSRotator .link-close.no-txt').html($lnkClose);
        $('.JSRotator .link-warning.no-txt').html($lnkWarning);
        $('.JSRotator .link-success.no-txt').html($lnkSuccess);
        $('.JSRotator .link-list.no-txt').html($lnkList);
        $('.JSRotator .link-exch.no-txt').html($lnkExch);
        $('.JSRotator .link-image.no-txt').html($lnkImage);

        $('.JSRotator a.dnnFormHelp').prepend($lnkInfo);

        //CUTTING TEXT BY ELLIPSIS PLUGIN
        if ($('.JSRotator .select .ellipsis').exists()) $('.JSRotator .select .ellipsis').ellipsis({
            row: 2,
            onlyFullWords: false
        });

        if ($('.JSRotator .edit .ellipsis').exists()) $('.JSRotator .edit .ellipsis').ellipsis({
            row: 1,
            onlyFullWords: false
        });

        //FUNCTIONS BY BOOTSTRAP FRAMEWORK
        //$('.JSRotator [data-toggle="collapse"]').collapse();

        //$('.JSRotator [data-toggle="popover"]').popover();

        //ADDING TOOLTIP TO ALL ELEMENTS CONTAINS DATA-TOGGLE ATTRIBUTES
        $('.JSRotator [data-toggle="tooltip"]').tooltip({
            placement: 'auto bottom'
        });

        $('.dnnFormItem table input[type=text]').focus(function () {
            var $this = $(this);

            $('.dnnFormItem table tr.active td').addClass('no-edit-cell');

            $this.tooltip('destroy').keyup(function (e) {
                var code = e.keyCode ? e.keyCode : e.which;
                if (code === 27) {
                    $('.dnnFormItem table tr.active td').removeClass('no-edit-cell');
                    $this.closest('td').removeClass('edit-cell').find('button').remove();
                    $this.blur().tooltip({ placement: 'auto bottom' });
                }
            }).closest('td').removeClass('no-edit-cell').addClass('edit-cell');

            if (!$this.closest('td').find('button').exists()) $this.closest('td').append($('<button>', { 'class': 'btn btn-primary' }).html($lnkSuccess).bind('click', function () {
                $(this).remove();
                $('.dnnFormItem table tr.active td').removeClass('no-edit-cell');
                $this.closest('td').removeClass('edit-cell');
                $this.blur().tooltip({ placement: 'auto bottom' });
            })).find('i').addClass('fa-2x');
        });

        $('.dnnFormItem table tr.active td:last').find('i').addClass('fa-lg');

        //REMOVING TOOLTIPS FROM ALL DISABLED ELEMENTS
        $('.JSRotator [disbled="disabled"], .JSRotator .aspNetDisabled, .JSRotator .dnnDisabled').tooltip('destroy');

        $('.JSRotator .close-action .fa').addClass('fa-5x');

        //AUTO CLOSE POPUP PANEL
        $('.JSRotator .popup').each(function () {

            var $this = $(this),
                $timer = 0,
                $total = 4;

            if ($this.is('.auto-close-box')) {

                $this.find('.popup-wrapper').append($('<div>', { 'class': 'progress-bar' }).css('width', '0%'));

                var $interval = setInterval(function () {

                    $timer++; //$timer = ($timer + 1) % 361;

                    $this.find('.progress-bar').css('width', '100%');

                    if ($timer === $total) {
                        clearInterval($interval);
                        $('.JSRotator .popup.auto-close-box').remove();
                    }
                    //console.log($timer);
                }, 1000);
            }

            //if ($this.is('.confirm-box')) $('.JSNews .popup.confirm-box').remove();
        });

        //CHECKBOX DEFINITION: SELECT/DESELECT ALL CHECKBOXES
        $('.JSRotator table tbody .cbSelect input:checkbox').bind('change', function () {
            var $n = $('.JSRotator table tbody .cbSelect input:checked').length,
                $t = $('.JSRotator table tbody .cbSelect input:checkbox').length;

            if ($n === $t) $('.JSRotator table thead .cbSelectAll input:checkbox').prop('checked', true);else $('.JSRotator table thead .cbSelectAll input:checkbox').prop('checked', false);
        });

        $('.JSRotator table thead .cbSelectAll input:checkbox').bind('change', function () {
            $('.JSRotator table tbody .cbSelect input:checkbox').prop('checked', $(this).prop('checked'));
        });

        //DISPALY/HIDE PANEL DEFINITION
        $('.JSRotator .hidder input:checkbox').each(function () {
            var $this = $(this),
                $target = $this.parent().data('target');

            if ($this.is(':checked')) $($target).removeClass('hidden');else $($target).addClass('hidden');
        }).bind('change', function () {
            var $this = $(this),
                $target = $this.parent().data('target');

            if ($this.is(':checked')) $($target).removeClass('hidden');else $($target).addClass('hidden');
        });

        $('.JSRotator .unhidder input:checkbox').each(function () {
            var $this = $(this),
                $target = $this.parent().data('target');

            if ($this.is(':checked')) $($target).addClass('hidden');else $($target).removeClass('hidden');
        }).bind('change', function () {
            var $this = $(this),
                $target = $this.parent().data('target');

            if ($this.is(':checked')) $($target).addClass('hidden');else $($target).removeClass('hidden');
        });

        //SELECT PICKER CUSTOM PLUGIN DEFINITION
        //SINGLE SELECT OPTIONS
        if ($('.JSRotator .selectpicker.single-select').exists()) $('.JSRotator .selectpicker.single-select').selectpicker({
            actionsBox: false,
            //container: false,
            //countSelectedText:'',
            //dropupAuto: true,
            //header: false,
            //hideDisabled: false,
            //iconBase: 'glyphicon',
            liveSearch: false,
            liveSearchPlaceholder: 'Search',
            maxOptions: 1,
            mobile: false,
            multipleSeparator: ' | ',
            noneSelectedText: 'Select',
            selectedTextFormat: 'values',
            selectOnTab: false,
            showContent: true,
            showIcon: true,
            showSubtext: false,
            showTick: false,
            size: 'auto',
            style: 'btn-primary',
            tickIcon: 'glyphicon-ok',
            title: null,
            width: '50%'
        });
        //MULTI SELECT OPTIONS
        if ($('.JSRotator .selectpicker.multi-select').exists()) $('.JSRotator .selectpicker.multi-select').selectpicker({
            actionsBox: false,
            //container: false,
            //countSelectedText:'',
            //dropupAuto: true,
            //header: false,
            //hideDisabled: false,
            //iconBase: 'glyphicon',
            liveSearch: false,
            liveSearchPlaceholder: 'Search',
            maxOptions: false,
            mobile: false,
            multipleSeparator: ' | ',
            noneSelectedText: 'Select',
            selectedTextFormat: 'count',
            selectOnTab: false,
            showContent: true,
            showIcon: true,
            showSubtext: false,
            showTick: false,
            size: 6,
            style: 'btn-primary',
            tickIcon: 'glyphicon-ok',
            title: null,
            width: '50%'
        });
    });
})(jQuery, window.Sys);

