if keyboard_check(ord("R"))
{
	game_restart();
	room_speed = 60
}
if keyboard_check(ord("T"))
{
	room_speed = 15
}
	
if room == rm_init
	room_goto_next()
	
if instance_exists(obj_dialog_box)
{
	global.interact = 1;
}
else
	global.interact = 0;
	
if !instance_exists(obj_transition) && (global.turn == -1 && global.outcome == 1 && global.stunned == true && create)
{
	instance_create_depth(x,y,-9999,obj_transition)
	create = false
}