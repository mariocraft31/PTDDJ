if image_alpha > 0 && global.strike = 0
    with obj_battlecontrol 
		event_user(0);
image_alpha = 0;
with obj_gustavob image_alpha = 0;
audio_sound_gain(global.music,-0.025,1000);