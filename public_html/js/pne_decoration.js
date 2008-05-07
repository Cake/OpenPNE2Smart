function pne_toggle_mce_editor(id)
{
    var textmode_checked = document.getElementById("mce_editor_mode_changer_1").checked;
    var previewmode_checked = document.getElementById("mce_editor_mode_changer_2").checked;

    var editor = tinyMCE.get(id);
    if (!editor && previewmode_checked) {
        tinyMCE.execCommand('mceAddControl', 0, id);
        document.getElementById('mce_editor_buttonmenu').style.display = "none";
        return true;
    }

    if (editor.isHidden() && previewmode_checked) {
        editor.show();
        document.getElementById('mce_editor_buttonmenu').style.display = "none";
    } else if (!editor.isHidden() && textmode_checked) {
        editor.hide();
        document.getElementById('mce_editor_buttonmenu').style.display = "block";
    }
}

function pne_mce_editor_init()
{
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        editor_selector : "mceEditor_dummy_selector",
        plugins : "openpne",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        theme_advanced_buttons1 : "op_b,op_u,op_s,op_i,op_large,op_small,op_color,op_image,op_emoji_docomo,op_emoji_au,op_emoji_softbank",
        theme_advanced_buttons2 : "",
        theme_advanced_buttons3 : "",
        valid_elements : "b/strong,u,s/strike,i,font[color|size],br",
        forced_root_block : false,
        force_p_newlines : false,
        force_br_newlines : true,
        inline_styles : false,
        language : "ja",
        entity_encoding : "raw",
        remove_linebreaks : false
    });

    var textmode_checkbox = document.getElementById("mce_editor_mode_changer_1");
    var previewmode_checkbox = document.getElementById("mce_editor_mode_changer_2");
    if (previewmode_checkbox.checked) {
        textmode_checkbox.checked = true;
        previewmode_checkbox.checked = false;
    }
}

function pne_mce_insert_tagname(id, tagname, opt)
{
    var opt = opt || "";

    var elm = document.getElementById(id);
    var selection = new Selection(elm);

    var pos = selection.create(); 

    if (tagname == "op:color" && !opt) {
        pne_mce_show_color_table(id, tagname);
        return;
    }

    var replace = "<" + tagname + opt + ">" + elm.value.substring(pos.start, pos.end) + "</" + tagname + ">";
    var head = elm.value.substring(0, pos.start);
    var tail = elm.value.substring(pos.end, elm.value.length);
    elm.value =  head + replace + tail;
}

function pne_mce_show_color_table(id, tagname)
{
    var table = document.getElementById("mce_editor_color_table")
    if (table) {
        table.parentNode.removeChild(table);
        return;
    }

    var color = null;
    var settings = {
        colors : ["000000","993300","333300","003300","003366","000080","333399","333333","800000","FF6600","808000","008000","008080","0000FF","666699","808080","FF0000","FF9900","99CC00","339966","33CCCC","3366FF","800080","999999","FF00FF","FFCC00","FFFF00","00FF00","00FFFF","00CCFF","993366","C0C0C0","FF99CC","FFCC99","FFFF99","CCFFCC","CCFFFF","99CCFF","CC99FF","FFFFFF"],
        grid_width : 8,
        default_color : "#888888"
    };

    var button = document.getElementById("mce_textmode_button_op_color");

    var button_container = document.getElementById("mce_editor_buttonmenu");

    var tbody = document.createElement("tbody");

    var tr;
 
    for (var i = 0; i < settings.colors.length; i++) {
        var code = "#" + settings.colors[i];

        if (i == 0 || i % settings.grid_width == 0) {
            tr = document.createElement("tr");
            tbody.appendChild(tr);
        }

        var td = document.createElement("td");
        td.style.border = "0 none";
        td.style.width = "12px";
        td.style.padding = "2px";
        td.style.margin = "0";

        var a = document.createElement("a");
        a.setAttribute("href", "#");
        a.colorCode = code;
        a.style.width = "9px";
        a.style.height = "9px";
        a.style.display = "block";
        a.style.overflow = "hidden";
        a.style.border = "1px solid #808080";
        a.style.backgroundColor = "#" + settings.colors[i];
        a.onclick = function() {
            pne_mce_insert_tagname(id, tagname, ' code="' + this.colorCode + '"');
            var table = document.getElementById("mce_editor_color_table")
            table.parentNode.removeChild(table);
        };

        var span = document.createElement("span");
        span.style.display = "none";
        span.appendChild(document.createTextNode(code));

        a.appendChild(span);
        td.appendChild(a);
        tr.appendChild(td);
    }

    var table = document.createElement("table");
    table.id = "mce_editor_color_table";
    table.style.width = "auto";
    table.style.position = "absolute";
    table.style.zIndex = 150;
    table.style.border = "1px solid gray";
    table.style.backgroundColor = "#fff";
    table.appendChild(tbody);

    button_container.appendChild(table);

    if (Prototype.Browser.IE) {
        table.style.left = button.parentNode.offsetWidth + button.offsetWidth + "px";
        table.style.top = table.offsetTop + button.offsetHeight;
    } else {
        table.style.left = button.offsetLeft + table.offsetLeft + "px";
    }
}

