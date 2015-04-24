$(document).ready(function(e){

    // Instantiate the mode
    var ipa_mode = false;
    var last_key_pressed = null;
    var counter = 0;

    // Functions to be performed on keydown
    $(document).keydown(function(e){
        if(e.shiftKey){
            ipa_mode = true;
        }
    });

    // Functions to be performed on keyup
    $(document).keyup(function(e){
        if(e.which == 16){
            ipa_mode = false;
        }
    });

    // Functions to be performed on keypress
    $(document).keypress(function(e){
        // IPA mode is on. Cycle through them choices
        if(ipa_mode === true){
            // Here would be the place to construct some sort of ajax query.
            if(e.which != last_key_pressed){
                counter = 0;
            }
        }
    });


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
