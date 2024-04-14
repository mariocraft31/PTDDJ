function scr_84_draw_text_outline(_x, _y, _str) {
    var xx = argument0
    var yy = argument1
    var str = argument2
    var __txtcolor__ = draw_get_color()
    draw_set_colour(c_black)
    draw_text((xx - 1), (yy - 1), str)
    draw_text((xx + 1), (yy - 1), str)
    draw_text((xx - 1), (yy + 1), str)
    draw_text((xx + 1), (yy + 1), str)
    draw_set_colour(__txtcolor__)
    draw_text(xx, yy, str)
    return;
}

function scr_84_init_values(){
	global.chemg_last_get_font = ""
	global.font_map = ds_map_create()
	var fm = global.font_map
    ds_map_add(fm, "main", fnt_pizza)
}

function scr_84_get_font(font) {
    if (!variable_global_exists("chemg_last_get_font"))
        global.chemg_last_get_font = ""
    if (argument0 != global.chemg_last_get_font)
        global.chemg_last_get_font = argument0
    return ds_map_find_value(global.font_map, argument0);
}

function scr_84_set_draw_font(font) {
    global.chemg_font = argument0
    draw_set_font(scr_84_get_font(argument0))
    return;
}

function scr_writetext(msc, msg, portrait, typer) {
    global.portrait = 0
    global.msc = argument0
    if (argument1 != "x")
        global.msg[0] = argument1
    if (argument2 != 0)
        global.portrait = argument2
    global.typer = 5
    if (argument3 != 0)
        global.typer = argument3
    instance_create_depth(0, 0, -10000, obj_dialog_box)
    return;
}

function scr_textsetup(font, color, x, y, line, shak, rat, sound, h_sp, v_sp, spec) {
    myfont = argument0
    mycolor = argument1
    writingx = argument2
    writingy = argument3
    charline = argument4
    shake = argument5
    rate = argument6
    textsound = argument7
    hspace = argument8
    vspace = argument9
    special = argument10
    colorchange = true
    xcolor = mycolor
    return;
}

function scr_texttype() {
    var font_set = true
    textscale = 1
    switch global.typer
    {
        case 0:
            font_set = false
            break
        case 1:
            scr_textsetup(scr_84_get_font("main"), c_black, x, y, 33, 0, 1, sfx_talk_n, 16, 24, false)
            break
        case 2:
            scr_textsetup(scr_84_get_font("main"), c_black, x, y, 33, 0, 2, -1, 8, 18, false)
            break
        case 3:
            scr_textsetup(scr_84_get_font("main"), c_black, x, y, 33, 0, 2, sfx_talk_n, 8, 18, true)
            break
        case 4:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, sfx_talk_n, 16, 28, true)
            break
        case 5:
            scr_textsetup(scr_84_get_font("main"), c_black, x, y, 54, 0, 1, sfx_talk_n, 16,32, false)
            break
        case 6:
            scr_textsetup(scr_84_get_font("main"), c_black, x, y, 54, 1, 1, sfx_talk_n, 16, 36, true)
            break
        case 10:
            scr_textsetup(scr_84_get_font("main"), c_black, x, y, 54, 0, 1, sfx_peptalk, 16, 24, false)
            break
        case 11:
            scr_textsetup(scr_84_get_font("main"), c_black, x, y, 33, 0, 1, sfx_peptalk, 16, 24, false)
            break
        case 15:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 1, sfx_talk_n, 8, 18, false)
            break
        case 16:
            font_set = false
            break
        case 30:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, sfx_peptalk, 16, 36, true)
			break;
        case 36:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, -1, 16, 36, true)
            break
        case 37:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 3, sfx_peptalk, 18, 36, true)
            break
        case 40:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 2, -1, 8, 18, false)
            break
        case 41:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 3, -1, 8, 18, false)
            break
        case 42:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 2, -1, 16, 36, true)
            break
        case 47:
            scr_textsetup(scr_84_get_font("mainbig"), c_white, x, y, 33, 0, 1, sfx_peptalk, 16, 28, true)
            break
        case 50:
            scr_textsetup(scr_84_get_font("dotumche"), c_black, x, y, 33, 0, 1, sfx_talk_n, 9, 20, false)
            break
        case 53:
            scr_textsetup(scr_84_get_font("dotumche"), c_black, x, y, 33, 0, 1, sfx_peptalk, 9, 20, false)
            break
        case 54:
            scr_textsetup(scr_84_get_font("dotumche"), c_black, x, y, 33, 0, 2, sfx_peptalk, 9, 20, false)
            break
        case 61:
            scr_textsetup(scr_84_get_font("main"), c_white, x, y, 33, 0, 2, sfx_peptalk, 12, 20, false)
            break
        case 75:
            scr_textsetup(scr_84_get_font("dotumche"), c_black, x, y, 33, 0, 1, sfx_peptalk, 9, 20, false)
            break
        case 76:
        default:
            font_set = false
            break
    }
    return;
}

function scr_textsound() {
	action2_key = keyboard_check_pressed(ord("X"))
    playtextsound = true
    if action2_key
        playtextsound = false
    if (skippable == false)
        playtextsound = true
    if (playtextsound == true)
    {
        if (rate <= 2)
            getchar = string_char_at(mystring, pos)
        else
            getchar = string_char_at(mystring, (pos - 1))
        play = true
        playcheck = false
        if (getchar == "&" || getchar == "\n")
        {
            if (rate < 3)
            {
                playcheck = true
                getchar = string_char_at(mystring, (pos + 1))
            }
            else
                play = false
        }
        if (getchar == " ")
            play = false
        if (getchar == "^")
            play = false
        if (getchar == "!")
            play = false
        if (getchar == ".")
            play = false
        if (getchar == "?")
            play = false
        if (getchar == ",")
            play = false
        if (getchar == ":")
            play = false
        if (getchar == "/")
            play = false
        if (getchar == "\\")
            play = false
        if (getchar == "|")
            play = false
        if (getchar == "*")
            play = false
        if (play == true)
        {
			if (textsound == sfx_peptalk)
	            {
					global.talker = 1
	                audio_stop_sound(sfx_peptalk)
	                qv = snd_play(sfx_peptalk)
	                qp = (0.9 + random(0.15))
	                snd_pitch(qv, qp)
	                sound_timer = 4
				}
			else
				{
					global.talker = 0
					qv = snd_play(textsound)
	                qp = (0.9 + random(0.15))
	                snd_pitch(qv, qp)
	                sound_timer = 4
				}
			}
        }
    }
    return;



