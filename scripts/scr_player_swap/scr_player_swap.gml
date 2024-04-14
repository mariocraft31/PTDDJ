function scr_player_swap(){
if global.interact == 0{
	scr_character_spr();	
	
		if swap_key && character == "P"
		{
			instance_create_depth(x,y + z,-1000,obj_poof)
			character = "G";
		}
	
		else if swap_key && character == "G"
		{
			instance_create_depth(x,y + z,-1000,obj_poof)
			character = "v";
		}
	
		else if swap_key && character == "v"
		{
			instance_create_depth(x,y + z,-1000,obj_poof)
			character = "P";
		}
	}
}