if ready == 1
    scale--

x = camerawidth()/2
y = cameraheight()/2

image_xscale = scale;
image_yscale = scale;

if scale < 0
{
	//Enter the Battle
	room_goto(targetroom); //for now
	obj_ow_player.x = target_x
	obj_ow_player.y = target_y
	obj_ow_player.active = true
	//room_goto(global.battleroom);

    ready = 2
}

if ready == 2
{
	scale++
}

if scale > 28
	instance_destroy();