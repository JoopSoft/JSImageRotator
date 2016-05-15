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

        var $lnkAdd = '<i class="fa fa-plus-circle"></i>',
            $lnkEdit = '<i class="fa fa-pencil"></i>',
            $lnkEditSquare = '<i class="fa fa-pencil-square-o"></i>',
            $lnkDelete = '<i class="fa fa-trash-o"></i>',
            $lnkBack = '<i class="fa fa-angle-left"></i>',
            $lnkUp = '<i class="fa fa-angle-up"></i>',
            $lnkHome = '<i class="fa fa-home"></i>',
            $lnkAll = '<i class="fa fa-external-link"></i>',
            $lnkUpload = '<i class="fa fa-upload"></i>',
            $lnkSave = '<i class="fa fa-floppy-o"></i>',
            $lnkCancel = '<i class="fa fa-ban"></i>',
            $lnkSuccess = '<i class="fa fa-check-circle"></i>',
            $lnkInfo = '<i class="fa fa-info-circle"></i>',
            $lnkInfo2x = '<i class="fa fa-info fa-2x"></i>',
            $lnkList = '<i class="fa fa-list"></i>',
            $lnkExch = '<i class="fa fa-exchange"></i>',
            $lnkImage = '<i class="fa fa-picture-o"></i>',
            $lnkClose = '<i class="fa fa-close"></i>',
            $lnkWarning = '<i class="fa fa-warning"></i>',
            $lnkSelUp = '<i class="fa fa-arrow-circle-up"></i>',
            $lnkSelDown = '<i class="fa fa-arrow-circle-down"></i>',
            $lnkSelRight = '<i class="fa fa-arrow-circle-right"></i>',
            $lnkSelLeft = '<i class="fa fa-arrow-circle-left"></i>',
            $lnkPrev = '<i class="fa fa-angle-left"></i>',
            $lnkNext = '<i class="fa fa-angle-right"></i>',
            $largeIcon = 'fa-lg';

        //PUSHED MIXED UP ICON AND TEXT IN TO THE ELEMENTS
        function loadIcons() {

            $('.JSRotator .link-add').prepend($lnkAdd + ' ');
            $('.JSRotator .link-edit').prepend($lnkEdit + ' ');
            $('.JSRotator .link-edit-square').prepend($lnkEditSquare + ' ');
            $('.JSRotator .link-delete').prepend($lnkDelete + ' ');
            $('.JSRotator .link-back').prepend($lnkBack + ' ');
            $('.JSRotator .link-up').prepend($lnkUp + ' ');

            $('.JSRotator .link-select-up').append(' ' + $lnkSelUp);
            $('.JSRotator .link-select-down').append(' ' + $lnkSelDown);
            $('.JSRotator .link-select-right').append(' ' + $lnkSelRight);
            $('.JSRotator .link-select-left').append(' ' + $lnkSelLeft);

            $('.JSRotator .link-home').prepend($lnkHome + ' ');
            $('.JSRotator .link-all').prepend($lnkAll + ' ');
            $('.JSRotator .link-upload').prepend($lnkUpload + ' ');
            $('.JSRotator .link-save').prepend($lnkSave + ' ');
            $('.JSRotator .link-cancel').prepend($lnkCancel + ' ');
            $('.JSRotator .link-info').prepend($lnkInfo + ' ');
            $('.JSRotator .link-info2x').prepend($lnkInfo2x + ' ');
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
            $('.JSRotator .link-up.no-txt').html($lnkUp);

            $('.JSRotator .link-select-up.no-txt').html($lnkSelUp);
            $('.JSRotator .link-select-down.no-txt').html($lnkSelDown);
            $('.JSRotator .link-select-right.no-txt').html($lnkSelRight);
            $('.JSRotator .link-select-left.no-txt').html($lnkSelLeft);

            $('.JSRotator .link-home.no-txt').html($lnkHome);
            $('.JSRotator .link-all.no-txt').html($lnkAll);
            $('.JSRotator .link-upload.no-txt').html($lnkUpload);
            $('.JSRotator .link-save.no-txt').html($lnkSave);
            $('.JSRotator .link-cancel.no-txt').html($lnkCancel);
            $('.JSRotator .link-info.no-txt').html($lnkInfo);
            $('.JSRotator .link-info2x.no-txt').html($lnkInfo2x);
            $('.JSRotator .link-prev.no-txt').html($lnkPrev);
            $('.JSRotator .link-next.no-txt').html($lnkNext);
            $('.JSRotator .link-close.no-txt').html($lnkClose);
            $('.JSRotator .link-warning.no-txt').html($lnkWarning);
            $('.JSRotator .link-success.no-txt').html($lnkSuccess);
            $('.JSRotator .link-list.no-txt').html($lnkList);
            $('.JSRotator .link-exch.no-txt').html($lnkExch);
            $('.JSRotator .link-image.no-txt').html($lnkImage);

            $('.JSRotator a.dnnFormHelp').prepend($lnkInfo);
        }

        loadIcons();

        //CUTTING TEXT BY ELLIPSIS PLUGIN
        if ($('.JSRotator .edit .ellipsis').exists()) $('.JSRotator .edit .ellipsis').ellipsis({
            row: 1,
            onlyFullWords: false
        });

        if ($('.JSRotator .select .ellipsis').exists()) $('.JSRotator .select .ellipsis').ellipsis({
            row: 1,
            onlyFullWords: false
        });

        //POPUP INPUT TEXTBOX - TABLE
        $('.JSRotator .dnnFormItem table input[type=text]').focus(function () {
            var $this = $(this);

            $('.JSRotator .dnnFormItem table tr.active td').addClass('no-edit-cell');

            $this.tooltip('destroy').keyup(function (e) {
                var code = e.keyCode ? e.keyCode : e.which;
                if (code === 27) {
                    $('.JSRotator .dnnFormItem table tr.active td').removeClass('no-edit-cell');
                    $this.closest('td').removeClass('edit-cell').find('button').remove();
                    $this.blur().tooltip({ placement: 'auto bottom' });
                }
            }).closest('td').removeClass('no-edit-cell').addClass('edit-cell');

            if (!$this.closest('td').find('button').exists()) $this.closest('td').append($('<button>', { 'class': 'btn btn-primary' }).html($lnkSuccess).bind('click', function () {
                $(this).remove();
                $('.JSRotator .dnnFormItem table tr.active td').removeClass('no-edit-cell');
                $this.closest('td').removeClass('edit-cell');
                $this.blur().tooltip({ placement: 'auto bottom' });
            })).find('i').addClass('fa-2x');
        });

        //BIGGER CONTROL ICONS ON EDIT TABLE
        $('.JSRotator .dnnFormItem table .active td:last').find('i').addClass('fa-lg');

        //REMOVING TOOLTIPS FROM ALL DISABLED ELEMENTS
        $('.JSRotator [disbled="disabled"], .JSRotator .aspNetDisabled, .JSRotator .dnnDisabled').tooltip('destroy');

        //BIG CLOSE ICON
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
        $('.JSRotator table tbody .cbSelect input:checkbox').each(function () {
            var $n = parseInt($('.JSRotator table tbody .cbSelect input:checked').length),
                $t = parseInt($('.JSRotator table tbody .cbSelect input:checkbox').length);

            if ($n === $t) $('.JSRotator table thead .cbSelectAll input:checkbox').prop('checked', true);else $('.JSRotator table thead .cbSelectAll input:checkbox').prop('checked', false);

            if ($('.JSRotator .edit .txtFileName').val() === '') {
                $('.JSRotator .controls .btnSubmit').addClass('disabled');
                $('.JSRotator .edit .btnAddUpdateList').addClass('disabled');
            } else {
                $('.JSRotator .controls btnSubmit').removeClass('disabled');
                $('.JSRotator .edit btnAddUpdateList').removeClass('disabled');
            }
        }).bind('change', function () {
            var $n = parseInt($('.JSRotator table tbody .cbSelect input:checked').length),
                $t = parseInt($('.JSRotator table tbody .cbSelect input:checkbox').length);

            if ($n === $t) $('.JSRotator table thead .cbSelectAll input:checkbox').prop('checked', true);else $('.JSRotator table thead .cbSelectAll input:checkbox').prop('checked', false);

            if ($n != 0) {
                if ($('.JSRotator .edit .txtFileName').val() === '') {
                    $('.JSRotator .controls .btnSubmit').addClass('disabled');
                    $('.JSRotator .edit .btnAddUpdateList').addClass('disabled');
                } else {
                    $('.JSRotator .controls .btnSubmit').removeClass('disabled');
                    $('.JSRotator .edit .btnAddUpdateList').removeClass('disabled');
                }
            } else {
                $('.JSRotator .controls .btnSubmit').addClass('disabled');
                $('.JSRotator .edit .btnAddUpdateList').addClass('disabled');
            }
        });

        $('.JSRotator table thead .cbSelectAll input:checkbox')
        //.each(function () {
        //    $('.JSRotator table tbody .cbSelect input:checkbox').prop('checked', $(this).prop('checked'));
        //})
        .bind('change', function () {
            var $n = parseInt($('.JSRotator table tbody .cbSelect input:checked').length);

            $('.JSRotator table tbody .cbSelect input:checkbox').prop('checked', $(this).prop('checked'));

            if ($n != 0) {
                if ($('.JSRotator .edit .txtFileName').val() === '') {
                    $('.JSRotator .controls .btnSubmit').addClass('disabled');
                    $('.JSRotator .edit .btnAddUpdateList').addClass('disabled');
                } else {
                    $('.JSRotator .controls .btnSubmit').removeClass('disabled');
                    $('.JSRotator .edit .btnAddUpdateList').removeClass('disabled');
                }
            } else {
                $('.JSRotator .controls .btnSubmit').addClass('disabled');
                $('.JSRotator .edit .btnAddUpdateList').addClass('disabled');
            }
        });

        //SCROLL TABLES
        if ($('.JSRotator .edit .table tbody').height() == 185) $('.JSRotator .edit .table').addClass('scroll').find('thead tr').append('<th class="add-custom"></th>');else $('.JSRotator .edit .table').removeClass('scroll').find('thead tr .add-custom').remove();

        if ($('.JSRotator .select .table tbody').height() == 245) $('.JSRotator .select .table').addClass('scroll').find('thead tr').append('<th class="add-custom"></th>');else $('.JSRotator .select .table').removeClass('scroll').find('thead tr .add-custom').remove();

        //DISPALY/HIDE PANEL DEFINITION
        $('.JSRotator .hidder input:checkbox').each(function () {
            var $target = $(this).parent().data('target');

            if ($(this).is(':checked')) $($target).show();else $($target).hide();
        }).bind('change', function () {
            var $target = $(this).parent().data('target');

            if ($(this).is(':checked')) $($target).show();else $($target).hide();
        });

        $('.JSRotator .unhidder input:checkbox').each(function () {
            var $target = $(this).parent().data('target');

            if ($(this).is(':checked')) $($target).hide();else $($target).show();
        }).bind('change', function () {
            var $target = $(this).parent().data('target');

            if ($(this).is(':checked')) $($target).hide();else $($target).show();
        });

        $('.JSRotator input:file').each(function () {
            var $this = $(this),
                $target = $this.data('target');

            if ($this.val() != '') {
                $($target).show();
                $($target + '.reverse').hide();
            } else {
                $($target).hide();
                $($target + '.reverse').show();
            }
        }).bind('change', function () {
            var $this = $(this),
                $target = $this.data('target');

            if ($this.val() != '') {
                $($target).show();
                $($target + '.reverse').hide();
            } else {
                $($target).hide();
                $($target + '.reverse').show();
            }
        });

        $('.JSRotator .check-equal').each(function () {
            if ($(this).val() === $(this).data('equal')) $($(this).data('target')).show();else $($(this).data('target')).hide();
        }).bind('change', function () {
            if ($(this).val() === $(this).data('equal')) $($(this).data('target')).show();else $($(this).data('target')).hide();
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
            showTick: true,
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
            selectedTextFormat: 'values', //'count'
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

        //SINGLE SELECT ON TABLE
        if ($('.JSRotator .selectpicker.table-select').exists()) $('.JSRotator .selectpicker.table-select').selectpicker({
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
            showTick: true,
            size: 'auto',
            style: 'btn-primary',
            tickIcon: 'glyphicon-ok',
            title: null,
            width: '150px'
        });

        //CUSTOM ANIMATION & TRANSITION SELECT DEFINITION
        $('.JSRotator .lbAnimation, .JSRotator .lbTransition').each(function () {
            var $value = new String($(this).val()),
                $length = $(this).find(':selected').length;

            if (eval($value) == 'random') {
                //console.log('ONLY RANDOM');
                $(this).find('[class=JSRandom]').prop('disabled', false);
                $(this).find('[class=JSAnimType]').prop('disabled', true);
                $(this).selectpicker('refresh');
            } else if (eval($value) == 'null') {
                //console.log("NOTHING SELECTED");
                $(this).find('[class=JSRandom]').prop('disabled', false);
                $(this).find('[class=JSAnimType]').prop('disabled', false);
                $(this).find('[class=JSDefault]').prop('selected', true);
                $(this).selectpicker('refresh');
            } else {
                //console.log("REST OF ITEMS");
                $(this).find('[class=JSRandom]').prop('disabled', true);
                $(this).find('[class=JSAnimType]').prop('disabled', false);
                $(this).selectpicker('refresh');
            }
        }).change(function () {
            var $value = new String($(this).val()),
                $length = $(this).find(':selected').length;

            if (eval($value) == 'random') {
                //console.log('ONLY RANDOM');               
                $(this).find('[class=JSRandom]').prop('disabled', false);
                $(this).find('[class=JSAnimType]').prop('disabled', true);
                $(this).selectpicker('refresh');
            } else if (eval($value) == 'null') {
                //console.log("NOTHING SELECTED");
                $(this).find('[class=JSRandom]').prop('disabled', false);
                $(this).find('[class=JSAnimType]').prop('disabled', false);
                $(this).selectpicker('refresh');
            } else {
                //console.log("REST OF ITEMS");
                $(this).find('[class=JSRandom]').prop('disabled', true);
                $(this).find('[class=JSAnimType]').prop('disabled', false);
                $(this).selectpicker('refresh');
            }
        });

        //GET PARTIAL POSTBACK ON UPDATEPANEL REFRESH
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    RefreshPostBack();
                }
            });
        };

        function RefreshPostBack() {

            loadIcons();

            //SELECT PICKER CUSTOM PLUGIN DEFINITION
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
                showTick: true,
                size: 'auto',
                style: 'btn-primary',
                tickIcon: 'glyphicon-ok',
                title: null,
                width: '50%'
            });
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
                selectedTextFormat: 'values', //'count'
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
            if ($('.JSRotator .selectpicker.table-select').exists()) $('.JSRotator .selectpicker.table-select').selectpicker({
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
                showTick: true,
                size: 'auto',
                style: 'btn-primary',
                tickIcon: 'glyphicon-ok',
                title: null,
                width: '150px'
            });

            //CUSTOM ANIMATION & TRANSITION SELECT DEFINITION
            $('.JSRotator .lbAnimation, .JSRotator .lbTransition').each(function () {
                var $value = new String($(this).val()),
                    $length = $(this).find(':selected').length;

                if (eval($value) == 'random') {
                    //console.log('ONLY RANDOM');
                    $(this).find('[class=JSRandom]').prop('disabled', false);
                    $(this).find('[class=JSAnimType]').prop('disabled', true);
                    $(this).selectpicker('refresh');
                } else if (eval($value) == 'null') {
                    //console.log("NOTHING SELECTED");
                    $(this).find('[class=JSRandom]').prop('disabled', false);
                    $(this).find('[class=JSAnimType]').prop('disabled', false);
                    $(this).find('[class=JSDefault]').prop('selected', true);
                    $(this).selectpicker('refresh');
                } else {
                    //console.log("REST OF ITEMS");
                    $(this).find('[class=JSRandom]').prop('disabled', true);
                    $(this).find('[class=JSAnimType]').prop('disabled', false);
                    $(this).selectpicker('refresh');
                }
            }).change(function () {
                var $value = new String($(this).val()),
                    $length = $(this).find(':selected').length;

                if (eval($value) == 'random') {
                    //console.log('ONLY RANDOM');               
                    $(this).find('[class=JSRandom]').prop('disabled', false);
                    $(this).find('[class=JSAnimType]').prop('disabled', true);
                    $(this).selectpicker('refresh');
                } else if (eval($value) == 'null') {
                    //console.log("NOTHING SELECTED");
                    $(this).find('[class=JSRandom]').prop('disabled', false);
                    $(this).find('[class=JSAnimType]').prop('disabled', false);
                    $(this).selectpicker('refresh');
                } else {
                    //console.log("REST OF ITEMS");
                    $(this).find('[class=JSRandom]').prop('disabled', true);
                    $(this).find('[class=JSAnimType]').prop('disabled', false);
                    $(this).selectpicker('refresh');
                }
            });

            //DISPALY/HIDE PANEL DEFINITION
            $('.JSRotator .hidder input:checkbox').each(function () {
                var $target = $(this).parent().data('target');

                if ($(this).is(':checked')) $($target).show();else $($target).hide();
            }).bind('change', function () {
                var $target = $(this).parent().data('target');

                if ($(this).is(':checked')) $($target).show();else $($target).hide();
            });

            $('.JSRotator .unhidder input:checkbox').each(function () {
                var $target = $(this).parent().data('target');

                if ($(this).is(':checked')) $($target).hide();else $($target).show();
            }).bind('change', function () {
                var $target = $(this).parent().data('target');

                if ($(this).is(':checked')) $($target).hide();else $($target).show();
            });

            $('.JSRotator input:file').each(function () {
                var $this = $(this),
                    $target = $this.data('target');

                if ($this.val() != '') {
                    $($target).show();
                    $($target + '.reverse').hide();
                } else {
                    $($target).hide();
                    $($target + '.reverse').show();
                }
            }).bind('change', function () {
                var $this = $(this),
                    $target = $this.data('target');

                if ($this.val() != '') {
                    $($target).show();
                    $($target + '.reverse').hide();
                } else {
                    $($target).hide();
                    $($target + '.reverse').show();
                }
            });

            $('.JSRotator .check-equal').each(function () {
                if ($(this).val() === $(this).data('equal')) $($(this).data('target')).show();else $($(this).data('target')).hide();
            }).bind('change', function () {
                if ($(this).val() === $(this).data('equal')) $($(this).data('target')).show();else $($(this).data('target')).hide();
            });
        }

        //CHECK TO SEE IF THE WINDOW IS TOP IF NOT THEN DISPLAY BUTTON
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) $('.JSRotator .scroll-action').fadeIn();else $('.JSRotator .scroll-action').fadeOut();
        });

        //CLICK EVENT TO SCROLL TO TOP
        $('.JSRotator .scroll-action').click(function () {
            $('html, body').animate({ scrollTop: 0 }, 300);
            return false;
        });

        //FUNCTIONS BY BOOTSTRAP FRAMEWORK
        //$('.JSRotator [data-toggle="collapse"]').collapse();
        //$('.JSRotator [data-toggle="popover"]').popover();

        $('.JSRotator [data-toggle="tooltip"]').tooltip({
            placement: 'auto bottom'
        });
    });
})(jQuery, window.Sys);

