/* global $, Quill */
$(document).ready(function () {

    var $form = $('form');

    // Initializing the rich text editor
    var quill = new Quill('#id_description', {theme: 'snow'});
    quill.addModule('toolbar', { container: '#toolbar' });

    $form.submit(function() {
        var hiddenField = document.createElement('input');
        hiddenField.setAttribute('type', 'hidden');
        hiddenField.setAttribute('name', 'description');
        hiddenField.setAttribute('value', quill.getHTML());
        $form.append(hiddenField);
    });

});
