if ready == 1
    scale--

x = camerawidth()/2
y = cameraheight()/2

image_xscale = scale;
image_yscale = scale;

if scale < 0
{
	//Enter the Battle
	room_goto(global.battleroom); //for now
	//room_goto(global.battleroom);
	audio_sound_gain(global.music,0.4,0);
	music_play(global.music);
	alarm[2] = 60;

    ready = 2
}

if ready == 2
{
	scale += 0.5
}