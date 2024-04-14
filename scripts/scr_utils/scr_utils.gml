function declare_particle(part, sprite, anim_speed, depth)
{
	ds_map_set(global.part_map, part, part_type_create());
	ds_map_set(global.part_depth, part, depth);
	var p = ds_map_find_value(global.part_map, part);
	part_type_sprite(p, sprite, true, true, false);
	var t = sprite_get_number(sprite);
	var s = anim_speed;
	var spd = t / s;
	part_type_life(p, spd, spd);
	return p;
}
function particle_set_scale(part, xscale, yscale)
{
	part_type_scale(ds_map_find_value(global.part_map, part), xscale, yscale);
}
function create_debris(_x, _y, _sprite, _animated = false, _scale)
{
	var q = 
	{
		x: _x,
		y: _y,
		sprite_index: _sprite,
		image_number: sprite_get_number(_sprite),
		image_index: irandom(image_number - 1),
		image_angle: random_range(1, 270),
		image_speed: 0.35,
		image_xscale: _scale,
		image_yscale: _scale,
		sprw: sprite_get_width(_sprite),
		sprh: sprite_get_height(_sprite),
		hsp: random_range(-4, 4),
		vsp: random_range(-5, -2),
		alpha: 1,
		grav: 0.4,
		type: part_type.normal,
		animated: _animated,
		destroyonanimation: false
	};
	ds_list_add(global.debris_list, q);
	return q;
}

function scr_sleep(miliseconds)
{
	var time = current_time;
	var ms = miliseconds;
	do {} until current_time - time >= round(ms);
	return current_time - time;
}

function func_interact() 
{
    myinteract = 1;
    event_user(0);
    return;
}

function hit_fx()
{
	if !instance_exists(obj_slapstar)
	{
		instance_create(x,y-24,obj_slapstar);
		instance_create(x,y-24,obj_slapstar);
		instance_create(x,y-24,obj_slapstar);
	}
	if !instance_exists(obj_bangeffect)
		instance_create(x,y-24,obj_bangeffect);
}

function hit_fx2()
{
	if !instance_exists(obj_parryeffect)
		instance_create(x, y-24, obj_parryeffect)
	if !instance_exists(obj_parryfx)	
		instance_create(x, y-24, obj_parryfx)
}

function __view_get(argument0, argument1) {
    var __prop = argument0
    var __index = argument1
    var __res = -1
    switch __prop
    {
        case 0:
            var __cam = view_get_camera(__index)
            __res = camera_get_view_x(__cam)
            break
        case 1:
            __cam = view_get_camera(__index)
            __res = camera_get_view_y(__cam)
            break
        case 2:
            __cam = view_get_camera(__index)
            __res = camera_get_view_width(__cam)
            break
        case 3:
            __cam = view_get_camera(__index)
            __res = camera_get_view_height(__cam)
            break
        case 4:
            __cam = view_get_camera(__index)
            __res = camera_get_view_angle(__cam)
            break
        case 5:
            __cam = view_get_camera(__index)
            __res = camera_get_view_border_x(__cam)
            break
        case 6:
            __cam = view_get_camera(__index)
            __res = camera_get_view_border_y(__cam)
            break
        case 7:
            __cam = view_get_camera(__index)
            __res = camera_get_view_speed_x(__cam)
            break
        case 8:
            __cam = view_get_camera(__index)
            __res = camera_get_view_speed_y(__cam)
            break
        case 9:
            __cam = view_get_camera(__index)
            __res = camera_get_view_target(__cam)
            break
        case 10:
            __res = view_get_visible(__index)
            break
        case 11:
            __res = view_get_xport(__index)
            break
        case 12:
            __res = view_get_yport(__index)
            break
        case 13:
            __res = view_get_wport(__index)
            break
        case 14:
            __res = view_get_hport(__index)
            break
        case 15:
            __res = view_get_camera(__index)
            break
        case 16:
            __res = view_get_surface_id(__index)
            break
        default:
            break
    }

    return __res;
}

function __view_set_internal(argument0, argument1, argument2) {
    var __prop = argument0
    var __index = argument1
    var __val = argument2
    switch __prop
    {
        case 0:
            var __cam = view_get_camera(__index)
            camera_set_view_pos(__cam, __val, camera_get_view_y(__cam))
            break
        case 1:
            __cam = view_get_camera(__index)
            camera_set_view_pos(__cam, camera_get_view_x(__cam), __val)
            break
        case 2:
            __cam = view_get_camera(__index)
            camera_set_view_size(__cam, __val, camera_get_view_height(__cam))
            break
        case 3:
            __cam = view_get_camera(__index)
            camera_set_view_size(__cam, camera_get_view_width(__cam), __val)
            break
        case 4:
            __cam = view_get_camera(__index)
            camera_set_view_angle(__cam, __val)
            break
        case 5:
            __cam = view_get_camera(__index)
            camera_set_view_border(__cam, __val, camera_get_view_border_y(__cam))
            break
        case 6:
            __cam = view_get_camera(__index)
            camera_set_view_border(__cam, camera_get_view_border_x(__cam), __val)
            break
        case 7:
            __cam = view_get_camera(__index)
            camera_set_view_speed(__cam, __val, camera_get_view_speed_y(__cam))
            break
        case 8:
            __cam = view_get_camera(__index)
            camera_set_view_speed(__cam, camera_get_view_speed_x(__cam), __val)
            break
        case 9:
            __cam = view_get_camera(__index)
            camera_set_view_target(__cam, __val)
            break
        case 10:
            __res = view_set_visible(__index, __val)
            break
        case 11:
            __res = view_set_xport(__index, __val)
            break
        case 12:
            __res = view_set_yport(__index, __val)
            break
        case 13:
            __res = view_set_wport(__index, __val)
            break
        case 14:
            __res = view_set_hport(__index, __val)
            break
        case 15:
            __res = view_set_camera(__index, __val)
            break
        case 16:
            __res = view_set_surface_id(__index, __val)
            break
        default:
            break
    }

    return 0;
}

function __view_set(argument0, argument1, argument2) {
    var __prop = argument0
    var __index = argument1
    var __val = argument2
    __view_set_internal(__prop, __index, __val)
    var __res = __view_get(__prop, __index)
    return __res;
}

function camerax(){
	return __view_get(0, 0);
}

function cameray(){
	return __view_get(1, 0);
}

function camerawidth() {
	return __view_get(2, 0);
}

function cameraheight() {
	return __view_get(3, 0);
}

function camerax_set(arg0) {
	__view_set(0, 0, arg0)
	return;
}


function cameray_set(arg0) {
	__view_set(1, 0, arg0)
	return;
}

function trace()
{
	var _string = "";
	for (var i = 0; i < argument_count; i++)
		_string += string(argument[i]);
	show_debug_message(_string);
}