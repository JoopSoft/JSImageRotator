/*globals jQuery, window, Sys */
(function ($, Sys) {
    //function dnnEditBasicSettings() {
    //    $('#dnnEditBasicSettings').dnnPanels();
    //    $('#dnnEditBasicSettings .dnnFormExpandContent a').dnnExpandAll({ expandText: '<%=Localization.GetString("ExpandAll", LocalResourceFile)%>', collapseText: '<%=Localization.GetString("CollapseAll", LocalResourceFile)%>', targetArea: '#dnnEditBasicSettings' });
    //}

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
            $lnkCheck = '<i class="fa fa-check"></i>',
            $lnkInfo = '<i class="fa fa-info-circle"></i>',
            $lnkList = '<i class="fa fa-list"></i>',
            $lnkExch = '<i class="fa fa-exchange"></i>',

            $lnkPrev = '<i class="fa fa-angle-left"></i>',
            $lnkNext = '<i class="fa fa-angle-right"></i>',
            $largeIcon = 'fa-lg';

        
        //CUTTING TEXT BY ELLIPSIS PLUGIN
        if ($('.JSRotator .rpt-list .teaser-txt').exists()) $('.JSRotator .rpt-list .teaser-txt').ellipsis({
            row: 5,
            onlyFullWords: true
        });

        //CUTTING TEXT BY ELLIPSIS PLUGIN
        if ($('.JSRotator .rpt-accordion .teaser-txt').exists()) $('.JSRotator .rpt-accordion .teaser-txt').ellipsis({
            row: 2,
            onlyFullWords: true
        });

        $('.JSRotator .link-save').prepend($lnkSave + ' ');
        $('.JSRotator .link-cancel').prepend($lnkCancel + ' ');
        $('.JSRotator .link-all').prepend($lnkAll + ' ');
        $('.JSRotator .link-upload').prepend($lnkUpload + ' ');
        $('.JSRotator .link-check').prepend($lnkCheck + ' ');

        $('.JSRotator .link-list').prepend($lnkList + ' ');
        $('.JSRotator .link-add').prepend($lnkAdd + ' ');
        $('.JSRotator .link-edit').prepend($lnkEdit + ' ');


        $('.JSRotator .link-exch').prepend($lnkExch + ' ');

        $('.JSRotator .add-img .link-delete').prepend($lnkDelete + ' ');
        $('.JSRotator .edit .link-delete').prepend($lnkDelete + ' ');
        $('.JSRotator .select .link-delete').prepend($lnkDelete + ' ');

        $('.JSRotator .dnnForm.edit table .link-edit').html($lnkEdit);
        $('.JSRotator .dnnForm.edit table .link-save').html($lnkSave);
        $('.JSRotator .dnnForm.edit table .link-delete').html($lnkDelete);
        $('.JSRotator .dnnForm.edit table .link-cancel').html($lnkCancel);



        $('.JSRotator a.dnnFormHelp').prepend($lnkInfo);


        $('.JSRotator .details-view .link-home').prepend($lnkHome + ' ');
        $('.JSRotator .details-view .link-back').prepend($lnkBack + ' ');
        $('.JSRotator .details-view .link-edit').prepend($lnkEdit + ' ');
        $('.JSRotator .details-view .link-delete').prepend($lnkDelete + ' ');


        $('.JSRotator .rpt-list .link-edit').prepend($lnkEdit + ' ');
        $('.JSRotator .rpt-list .link-add').prepend($lnkAdd + ' ');
        $('.JSRotator .rpt-list .link-delete').prepend($lnkDelete + ' ');
        $('.JSRotator .rpt-list .link-prev, .details-view .link-prev').prepend($lnkPrev + ' ');
        $('.JSRotator .rpt-list .link-next, .details-view .link-next').append(' ' + $lnkNext);


        $('.JSRotator .rpt-accordion .link-edit').html($lnkEdit);
        $('.JSRotator .rpt-accordion .link-add').html($lnkAdd);
        $('.JSRotator .rpt-accordion .link-delete').html($lnkDelete);
        $('.JSRotator .rpt-accordion .link-prev').html($lnkPrev);
        $('.JSRotator .rpt-accordion .link-next').html($lnkNext);

        //COLLAPSING BY BOOTSTRAP FRAMEWORK
        //$('.collapse').collapse();


        //dnnEditBasicSettings();
        //Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        //    dnnEditBasicSettings();
        //});


        $('.JSRotator #exampleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            var recipient = button.data('whatever') // Extract info from data-* attributes
            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            var modal = $(this)
            modal.find('.modal-title').text('New message to ' + recipient)
            modal.find('.modal-body input').val(recipient)
        })


        $('.JSRotator [data-toggle="tooltip"]').tooltip({
            placement: 'auto bottom'
        });


        $('.JSRotator .dnnForm.edit input[type=text]').bind('focusin', function () {
            var $this = $(this),
                $newInputVal = $this.val();


            
            //$('.dnnForm.edit .popup-msg').siblings().remove();
            //$this.parent().siblings().remove();

            //if (!$this.closest('.edit').find('.popup-msg').exists()) {
            //
            //    $this.closest('.edit').addClass('popup')
            //        .prepend(
            //            $('<div>', { 'class': 'overlay'})
            //                .html('<div class="confirm-wrapper">'
            //                        + '<input type="text" class="popup-msg" value="' + $newInputVal + '" />'
            //                        + '<input type="button" class="btn btn-primary link-check" value="Update" />'
            //                        + '<input type="button" class="btn btn-default link-cancel" value="Cancel" />'
            //                    + '</div>'
            //                )
            //            );
            //
            //}

            //CHANGE TITLES FOR EACH OF MORE INFO BUTTONS BY CLICKIN IT
            //$this.attr('title', function (index, attr) {
            //    return attr == $Customs.undo ? $Customs.viewMore : $Customs.undo;
            //});

            
            //$this.html(function (index, icon) {
            //    return icon === $navIconClose ? $navIcon : $navIconClose;
            //});
            console.log($this.attr('id') + ': ' + $newInputVal);
        }).bind('focusout', function () {
            console.log('Focusing out...');
        });

        $('#table-list tbody tr:eq(1)').addClass('active');
        
        if ($('#table-list').exists()) $('#table-list').DataTable({
            //"dom": '<"toolbar">frtip',
            "pagingType": "full_numbers"

        });

        $(".edit .toolbar").html('<b>Custom tool bar! Text/images etc.</b>');

    });

}(jQuery, window.Sys));