if ready == 1
    scale -= 0.5

x = camerawidth()/2
y = cameraheight()/2

image_xscale = scale;
image_yscale = scale;

if scale < 0
{
	//Enter the Battle
	room_goto(global.roomin); //for now
	instance_destroy(obj_battlecontrol)
	//room_goto(global.battleroom);

    ready = 2
}

if ready == 2
{
	scale++
}

if scale > 28
	instance_destroy();