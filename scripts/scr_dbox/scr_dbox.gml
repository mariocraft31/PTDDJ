function scr_dbox() {
    xxx = __view_get((0), 0)
    yyy = __view_get((1), 0)
    if (side == 0)
        {
			draw_set_alpha(1)
            draw_set_color(c_white)
            draw_rectangle((xxx + 16), (yyy + 25), (xxx + 940), (yyy + 135), false)
            scr_bubble(((xxx)), ((yyy)), ((xxx + 959)), ((yyy + 139)))
        }
        else
        {
			draw_set_alpha(1)
            draw_set_color(c_white)
            draw_rectangle((xxx + 16), (yyy + 386), (xxx + 940), (yyy + 515), false)
            scr_bubble(((xxx)), ((yyy + 380)), ((xxx + 959)), ((yyy + 539)))
        }
    }
    return;
	
function scr_bubble(argument0, argument1, argument2, argument3) {
    cur_jewel += 1
    textbox_width = ((argument2 - argument0) - 63)
    if (textbox_width < 0)
        textbox_width = 0
    textbox_height = ((argument3 - argument1) - 63)
    if (textbox_height < 0)
        textbox_height = 0
    if (textbox_width > 0)
    {
        draw_sprite_stretched(spr_dbox_top, 0, (argument0 + 32), argument1, textbox_width, 32)
        draw_sprite_ext(spr_dbox_top, 0, (argument0 + 32), (argument3 + 1), textbox_width, -2, 0, c_white, 1)
    }
    if (textbox_height > 0)
    {
        draw_sprite_ext(spr_dbox_left, 0, (argument2 + 1), (argument1 + 32), -2, textbox_height, 0, c_white, 1)
        draw_sprite_ext(spr_dbox_left, 0, argument0, (argument1 + 32), 2, textbox_height, 0, c_white, 1)
    }
        draw_sprite_ext(spr_dbox_topleft, 0, argument0, argument1, 2, 2, 0, c_white, 1)
        draw_sprite_ext(spr_dbox_topleft, 0, (argument2 + 1), argument1, -2, 2, 0, c_white, 1)
        draw_sprite_ext(spr_dbox_topleft, 0, argument0, (argument3 + 1), 2, -2, 0, c_white, 1)
        draw_sprite_ext(spr_dbox_topleft, 0, (argument2 + 1), (argument3 + 1), -2, -2, 0, c_white, 1)
    return;
}


