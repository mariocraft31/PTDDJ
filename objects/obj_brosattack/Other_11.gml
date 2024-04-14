//Excellent Hit
audio_sound_gain(sfx_cheer,0.4,0)
audio_play_sound(sfx_cheer,0,0);
with instance_create(x,y,obj_enemydead)
{
	hsp = 0
	vsp = -8
	grav = 0.5
	sprite_index = spr_lonebrick_roll
	image_xscale = 1
	image_speed = 0.35
	image_angle = 0
	depth = -1
}
instance_destroy();