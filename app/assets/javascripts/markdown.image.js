var $textBox;
$(document).ready(function() {
    $textBox = $(".markItUpEditor");

    function saveSelection(){
        $textBox.data("lastSelection", $textBox.getSelection());
    }

    $textBox.focusout(saveSelection);

    $textBox.bind("beforedeactivate", function() {
        saveSelection();
        $textBox.unbind("focusout");
    });
});
function insertText(text) {
    var selection = $textBox.data("lastSelection");
    $textBox.focus();
    $textBox.setSelection(selection.start, selection.end);
    $textBox.replaceSelectedText(text);
}