$(document).ready(function(){

    // Make all the buttons work
    $("#ipa-toolbar-keyboard button").click(function(){
        var input = $("#ipa-input").val() + $(this).html()
        $("#ipa-input").val(input);
    });

    // Submit button logic
    $("#submit").click(function(e){
        e.preventDefault();
        var stuff = $('form').serialize();
        var userIn = $("#ipa-input").val();
        alert(userIn);
    });

    // Clear everything
    $("#clear").click(function(e){
        e.preventDefault();
        $('#ipa-input').val('');
    });

    // Toggle navbar modes (English, International)
    // Deal with the navbar pills.
    $('.nav-pills li').click(function(e){
        e.preventDefault();
        toggleButton($(this));
        toggleKeyboard($(this));
    });

    // Hide all keyboards and show one based on the button selection
    function toggleKeyboard( button ){
        $(".ipa-keyboard-panel").children().hide();
        if($(button).attr('id') == "toggle-international"){
            $("#ipa-keyboard-international").show();
        } else {
            $("#ipa-keyboard-english").show();
        }
    }

    // Turn off all active buttons, then activate the selected one
    function toggleButton( button ){
        $(button).parent().find('.active').removeClass('active');
        $(button).toggleClass('active');
        $.cookie("whichButton", $(button).attr('id'));
    }

    // To be run when the page loads
    var button = document.getElementById($.cookie("whichButton"));
    toggleButton($(button));
    toggleKeyboard($(button));
});
