
	repeat 8
	{
		with instance_create(x,y,obj_slapstar)
		{
			sprite_index = spr_metaldebris
			image_xscale = 2
			image_yscale = 2
			hsp = random_range(-5, 5)
			vsp = random_range(-15, -10)
			grav = 0.8
		}
	}
	scr_sleep(5);
	with (instance_create(x, y-32, obj_bangeffect))
	{
		image_xscale = 2
		image_yscale = 2
	}
	with instance_create(x,y,obj_shake)
	{
		shakex = 0
		shakey = 8
		shakespeed = 2
	}
	audio_play_sound(sfx_breakmetal,1,0)
destroyed = true;