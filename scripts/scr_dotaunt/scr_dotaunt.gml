function scr_dotaunt() //scr_dotaunt
{
	if keyboard_check_pressed(global.taunt_key)
    {
            audio_play_sound(sfx_taunt,1,false)
			audio_sound_pitch(sfx_taunt,random_range(0.98,1.02))
			image_index = random_range(0,10)
            taunttimer = 20
            tauntstoredsprite = sprite_index
            tauntstoredmovespeed = movespd
            tauntstoredvsp = vsp
            tauntstoredstate = state
			state = 1
            with (instance_create_depth(x, y, -bbox_bottom+7, obj_taunt_effect))
                player = other.id
        }
    return;
}