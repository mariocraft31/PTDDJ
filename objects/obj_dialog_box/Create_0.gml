cur_jewel = 0
active = 0
alarm[0] = 1
skippable = 1
free = 0
zurasu = 1
zurasucon =1
xxx = camerax()
yyy = cameray()
writer = 432432
side = 1
remfacex = 0
remfacey = 0
remwriterx = 0
remwritery = 0
myface = -4
f = 1
if instance_exists(obj_ow_player)
{
	 if (obj_ow_player.y > (yyy + 280))
            side = 0
}