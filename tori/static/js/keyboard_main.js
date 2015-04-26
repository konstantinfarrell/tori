$(document).ready(function(e){
    const SHIFT = 16;

    // Initialize the variables
    var ipa_mode = false;
    var last_key_pressed = null;
    var current_key = null;
    var times = 0;
    var counter = 0;

    // Get a JSON object with the english keybindings.
    var bindings = JSON.stringify(english_keybindings);

    // Functions to be performed on keydown
    $(document).keydown(function(e){
        if(e.shiftKey){
            ipa_mode = true;
            $("#ipa-indicator").css("color", "pink");
            $("#ipa-indicator").text(" on");
        }
    });

    // Functions to be performed on keyup
    $(document).keyup(function(e){
        if(e.which == SHIFT){
            ipa_mode = false;
            $("#ipa-indicator").css("color", "white");
            $("#ipa-indicator").text("off");
        }
    });

    // Functions to be performed on keypress. Mostly keybinding stuff.
    $(document).keypress(function(e){

        // Get the current value of the text input
        var current_value = $("#ipa-input").val();

        // Which key was just pressed?
        current_key = String.fromCharCode(e.which);
        // Initialize the empty list of keys bound to current
        var bound_to_current = [];
        bound_to_current.push(current_key);
        bound_to_current.push(current_key.toLowerCase());

        // IPA mode is on. Cycle through them choices
        if(ipa_mode === true){

            // Prevent it from appending the originally pushed key
            e.preventDefault();

            // Make a list. Maybe check it more than once.
            $.each($.parseJSON(bindings), function(idx, obj){
                if(obj.key_binding == current_key.toLowerCase()){
                    bound_to_current.push(obj.code);
                }
            });

            // Cycle through the choices.
            if(current_key === last_key_pressed){
                counter++;
                var which = 1;
                var second_to_last = current_value[current_value.length-2];
                //#TODO: Figure out this last bug and you're done.
                if(second_to_last === current_key.toLowerCase() && times < 2){
                    which = 2;
                    times++;
                }
                current_value = current_value.substring(0, current_value.length - which);
            } else {
                counter = 0;
            }

            // Set the new character to the rendered form of the escaped HTML
            // indicated by the counter.
            var char_to_add = htmlDecode(bound_to_current[counter % bound_to_current.length]);

            // Handle an unbound key.
            if(char_to_add == "undefined"){
                char_to_add = "";
            }

            // Rewrite the textarea.
            $("#ipa-input").val(current_value + char_to_add);
        }

        // Keep track of which key was pressed
        last_key_pressed = current_key;
    });

    // WOW OK JQUERY. Making me write a function to render the HTML special
    // character in a div, then return the extracted form on its own. Why isn't
    // this a feature? huh??
    function htmlDecode(input){
        var e = document.createElement('div');
        e.innerHTML = input;
        return e.childNodes.length === 0 ? "" : e.childNodes[0].nodeValue;
    }

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

    //#TODO: find a way to reset all variables
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
