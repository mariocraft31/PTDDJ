function scr_player_overworld(){

if (global.interact == 0)
{
	if (onebuffer < 0)
	{
        if keyboard_check_pressed(global.keyA) && (jump == false) 
        {
            thisinteract = 0
            if (face == 0)
            {
                if collision_rectangle((x), ((y + sprite_height) - 112), ((x + sprite_width)) - 24, (y - 56), obj_interactable, 0, 1)
                    thisinteract = 2
            }
            if (thisinteract > 0)
            {
                if (thisinteract == 2)
                    interactedobject = collision_rectangle((x), ((y + sprite_height) - 112), ((x + sprite_width)) - 24, (y - 56), obj_interactable, 0, 1)
                if (interactedobject != noone)
                {
                    with (interactedobject)
                        facing = 2
                    with (interactedobject)
                        func_interact()
                }
            }
            if (face == 2)
            {
                if collision_rectangle((x), ((y + sprite_height) - 112), ((x - sprite_width)) + 24, (y - 56), obj_interactable, 0, 1)
                    thisinteract = 2
            }
            if (thisinteract > 0)
            {
                if (thisinteract == 2)
                    interactedobject = collision_rectangle((x), ((y + sprite_height) - 112), ((x - sprite_width)) + 24, (y - 56), obj_interactable, 0, 1)
                if (interactedobject != noone)
                {
                    with (interactedobject)
                        facing = 0
                    with (interactedobject)
                        func_interact()
                }
            }
            thisinteract = 0
            if (face == 1)
            {
                if collision_rectangle((x - 32), (y)-32, ((x + sprite_width)) - 64, ((y - sprite_height) + 72), obj_interactable, 0, 1)
                    thisinteract = 2
            }
            if (thisinteract > 0)
            {
                if (thisinteract == 2)
                    interactedobject = collision_rectangle((x - 32), (y)-32, ((x + sprite_width)) - 64, ((y - sprite_height) + 72), obj_interactable, 0, 1)
                if (interactedobject != noone)
                {
                    with (interactedobject)
                        facing = 1
                    with (interactedobject)
                        func_interact()
                }
            }
            thisinteract = 0
            if (face == 3)
            {
                if collision_rectangle((x - 32), (y), ((x + sprite_width)) - 64, ((y + sprite_height) - 72), obj_interactable, 0, 1)
                    thisinteract = 2
            }
            if (thisinteract > 0)
            {
                if (thisinteract == 2)
                    interactedobject = collision_rectangle((x - 32), (y), ((x + sprite_width)) - 64, ((y + sprite_height) - 72), obj_interactable, 0, 1)
                if (interactedobject != noone)
                {
                    with (interactedobject)
                        facing = 0
                    with (interactedobject)
                        func_interact()
                }
            }
        }
    }

instleft = (instance_place(x+lengthdir_x(movespd,-global.z-180),y+lengthdir_y(movespd,-global.z-180),obj_wall))
instright = (instance_place(x+lengthdir_x(movespd,-global.z),y+lengthdir_y(movespd,-global.z),obj_wall))
instdown = (instance_place(x+lengthdir_x(movespd,-global.z-90),y+lengthdir_y(movespd,-global.z-90),obj_wall))
instup = (instance_place(x+lengthdir_x(movespd,-global.z-270),y+lengthdir_y(movespd,-global.z-270),obj_wall))

if keyboard_check(global.keyRight)
{
	face = RIGHT
	if ((!instright) || (instright.z <= z))
	{
		x += lengthdir_x(movespd,-global.z)
		y += lengthdir_y(movespd,-global.z)
	}
}
if keyboard_check(global.keyLeft)
{
	face = LEFT
	if ((!instleft) || (instleft.z <= z))
	{
		x += lengthdir_x(movespd,-global.z-180)
		y += lengthdir_y(movespd,-global.z-180)
	}
}
if keyboard_check(global.keyDown)
{
	face = DOWN
	if ((!instdown) or (instdown.z <= z))
	{
		x += lengthdir_x(movespd,-global.z-90)
		y += lengthdir_y(movespd,-global.z-90)
	}
}
if keyboard_check(global.keyUp)
{
	face = UP
	if ((!instup) or (instup.z <= z))
	{
		x += lengthdir_x(movespd,-global.z-270)
		y += lengthdir_y(movespd,-global.z-270)
	}
}

if !(x == xprevious && y == yprevious)
move = true
else
move = false

scr_dotaunt();

if keyboard_check_pressed(global.keyB) && character == "G"
{
	if (z <= floorz)
	{
		audio_play_sound(sfx_jump,1,false)
		jump = true; /*you are now in the air*/
	}
}
if keyboard_check(global.keyB) && character == "P" && move
{
	state = 3
}

//z jump (when space pressed)
if (jump == true)
{
	z += zspeed /*z pos goes up*/
}
//if not ontop of block
if (!instance_place(x,y,obj_wall))
{
	floorz = 0; /*zfloor is ground level*/

}
//if not on ground
if (!z <= floorz)
{
	z -= zgrav; /*apply downforce on z pos*/
	zgrav += 0.8; /*grav gets stronger each step*/
}
//stop falling when you hit zfloor
if (z <= floorz+1/*+1 for sticking glitch on ground*/)
{
	z = floorz;	/*snap z pos to on ground*/
	zgrav = 0; /*stop applying downforce*/
	jump = false; /*no longer in the air*/
}
	}
}