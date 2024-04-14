function scr_player_machcharge(){

switch character
{
	case "P":
		var mach3movespd = 8;
		
		instleft = (instance_place(x+lengthdir_x(mach3movespd,-global.z-180),y+lengthdir_y(mach3movespd,-global.z-180),obj_wall))
		instright = (instance_place(x+lengthdir_x(mach3movespd,-global.z),y+lengthdir_y(mach3movespd,-global.z),obj_wall))
		instdown = (instance_place(x+lengthdir_x(mach3movespd,-global.z-90),y+lengthdir_y(mach3movespd,-global.z-90),obj_wall))
		instup = (instance_place(x+lengthdir_x(mach3movespd,-global.z-270),y+lengthdir_y(mach3movespd,-global.z-270),obj_wall))

		if keyboard_check(global.keyRight)
		{
			face = RIGHT
			if ((!instright) || (instright.z <= z))
			{
				x += lengthdir_x(mach3movespd,-global.z)
				y += lengthdir_y(mach3movespd,-global.z)
			}
		}
		if keyboard_check(global.keyLeft)
		{
			face = LEFT
			if ((!instleft) || (instleft.z <= z))
			{
				x += lengthdir_x(mach3movespd,-global.z-180)
				y += lengthdir_y(mach3movespd,-global.z-180)
			}
		}
		if keyboard_check(global.keyDown)
		{
			face = DOWN
			if ((!instdown) or (instdown.z <= z))
			{
				x += lengthdir_x(mach3movespd,-global.z-90)
				y += lengthdir_y(mach3movespd,-global.z-90)
			}
		}
		if keyboard_check(global.keyUp)
		{
			face = UP
			if ((!instup) or (instup.z <= z))
			{
				x += lengthdir_x(mach3movespd,-global.z-270)
				y += lengthdir_y(mach3movespd,-global.z-270)
			}
		}

		if !(x == xprevious && y == yprevious)
		move = true
		else
		move = false
		
		if move
		{
			charge += 1	
		}
		else
			charge = 0

		if charge >= 30
		{
			flash = true;
			state = 2
			charge = 0
		}

		scr_dotaunt();
		
		if !keyboard_check(global.keyB) || !move
		state = 0
		
	break;
	}
}