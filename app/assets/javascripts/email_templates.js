$( document ).ready(function() {
    $('.datetimepicker').datetimepicker({
        format: 'm/d/Y H:i',
        inline: false
      });
    $('.datetimepicker').val("").change(); // Force initial reformat of date
});

function updatePreview() {
    var template_id = $('#email_template_id').val();
    var template_text = $('#email_template_body').val();
    args = {};
    args.body = template_text;
    // Make Ajax call to fetch preview text, and then show in the preview div
    $.ajax({
        url: '/email_templates/'+template_id+'/preview',
        type: 'post',
        contentType: "application/json; charset=utf-8", // Sent type
        data: JSON.stringify(args),
        dataType: 'text', // Returned type
        success: function( data ){
            $('#template-preview pre').html( data );
        },
        error: function( jqXhr, textStatus, errorThrown ){
            console.log( jqXhr.responseText );
            $('#template-preview pre').html( jqXhr.responseText );
        }
    });
}
