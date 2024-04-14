instance_create_depth(obj_ow_player.x,obj_ow_player.y + obj_ow_player.z,-1000,obj_poof)

if other.character == "P"
{
	other.paletteselect += 1
	if other.paletteselect > 11
		other.paletteselect = 1
}