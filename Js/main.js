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
            $lnkSuccess = '<i class="fa fa-check-circle"></i>',
            $lnkInfo = '<i class="fa fa-info-circle"></i>',
            $lnkList = '<i class="fa fa-list"></i>',
            $lnkExch = '<i class="fa fa-exchange"></i>',
            $lnkClose = '<i class="fa fa-close"></i>',
            $lnkWarning = '<i class="fa fa-warning"></i>',


            $lnkPrev = '<i class="fa fa-angle-left"></i>',
            $lnkNext = '<i class="fa fa-angle-right"></i>',
            $largeIcon = 'fa-lg';

              
        //CUTTING TEXT BY ELLIPSIS PLUGIN
        if ($('.JSRotator .ellipsis').exists()) $('.JSRotator .ellipsis').ellipsis({
            row: 2,
            onlyFullWords: false
        });

        $('.JSRotator .link-save').prepend($lnkSave + ' ');
        $('.JSRotator .link-cancel').prepend($lnkCancel + ' ');
        $('.JSRotator .link-all').prepend($lnkAll + ' ');
        $('.JSRotator .link-upload').prepend($lnkUpload + ' ');

        $('.JSRotator .popup .link-close').html($lnkClose);
        $('.JSRotator .popup .link-success').html($lnkSuccess);
        $('.JSRotator .popup .link-warning').html($lnkWarning);
        

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


        $('#table-list tbody tr:eq(1)').addClass('active');
        
        //if ($('#table-list').exists()) $('#table-list').DataTable({
        //    //"dom": '<"toolbar">frtip',
        //    //"pagingType": "full_numbers"
        //
        //});
        //
        //$(".edit .toolbar").html('<b>Custom tool bar! Text/images etc.</b>');

    });

}(jQuery, window.Sys));