function __background_set_element(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12, argument13, argument14) {
	// NOTE: this script will only work properly if you're using the standard depth range (-16000 to 16000)
	var __bind = argument0;
	var __vis = argument1;
	var __fore = argument2;
	var __back = argument3;
	var __x = argument4;
	var __y = argument5;
	var __htiled = argument6;
	var __vtiled = argument7;
	var __xscale = argument8;
	var __yscale = argument9;
	var __stretch = argument10;
	var __hspeed = argument11;
	var __vspeed = argument12;
	var __blend = argument13;
	var __alpha = argument14;

	//var __nearestdepth = -15000;
	//var __farthestdepth = 15999;
	var __nearestdepth = 1000000000;
	var __farthestdepth = -1000000000;
	var __depthinc = 100;

	var __result;
	__result[0] = -1;
	__result[1] = -1;


	// Now look at the existing layers in the room to see if we have any foregrounds or backgrounds
	var __fgstring = "Foreground_";
	var __bgstring = "Background_";
	var __colstring = "Colour";
	var __fglen = string_length(__fgstring);
	var __bglen = string_length(__bgstring);
	var __layerlist = layer_get_all();
	var __layerlistlength = array_length_1d(__layerlist);
	var __collayer = -1;
	var __slots;
	var __isforeground;
	var __i;
	for(__i = 0; __i < 8; __i++)
	{
		__slots[__i] = -1;
		__isforeground[__i] = false;
	}


	for(__i = 0; __i < __layerlistlength; __i++)
	{
		var __layername = layer_get_name(__layerlist[__i]);	
		if (string_pos(__fgstring, __layername) > 0)
		{
			var __slotchr = string_char_at(__layername, __fglen + 1);
			if (__slotchr == "")
				continue;
			
			var __slot = real( __slotchr );
			__slots[__slot] = __layerlist[__i];
		
			__isforeground[__slot] = true;
		
			// Could check the contents of this layer to see if it has a single background element on it but that's probably overkill		
		}
		else if (string_pos(__bgstring, __layername) > 0)
		{
			var __slotchr = string_char_at(__layername, __bglen + 1);
			if (__slotchr == "")
				continue;
			
			var __slot = real( __slotchr );
			__slots[__slot] = __layerlist[__i];
		
			__isforeground[__slot] = false;
		
			// Could check the contents of this layer to see if it has a single background element on it but that's probably overkill		
		}
		else if (string_pos(__colstring, __layername) > 0)
		{
			// Make sure colour is as deep as it can be
			__collayer = __layerlist[__i];
			layer_depth(__layerlist[__i], __farthestdepth);
		}
		else
		{
			var __currdepth = layer_get_depth(__layerlist[__i]);
		
			if (__currdepth < __nearestdepth)
				__nearestdepth = __currdepth;
			
			if (__currdepth > __farthestdepth)
				__farthestdepth = __currdepth;
		}
	}

	// Reassign depths
	__farthestdepth += __depthinc + 1000;		// add some margin for the background layers
	__nearestdepth -= __depthinc;

	//__farthestdepth = max(__farthestdepth, 15999);
	//__nearestdepth = min(__nearestdepth, -15000);
	__farthestdepth = max(__farthestdepth, 2147483600);
	__nearestdepth = min(__nearestdepth, -2147482000);

	for(__i = 0; __i < 8; __i++)
	{
		if (__slots[__i] != -1)
		{
			var __depth = 0;
			if (__isforeground[__i] == true)
			{
				__depth = __nearestdepth - (__i * __depthinc);
			}
			else
			{
				__depth = (__farthestdepth - __depthinc) - (__slot * __depthinc);
			}
		
			layer_depth(__slots[__i], __depth);
		}
	}

	if (__collayer != -1)
	{
		layer_depth(__collayer, __farthestdepth);
	}


	// Construct our layer name and depth
	var __layername;
	var __layerdepth;
	if (__bind == -1)
	{
		// This is the background colour layer
		__layername = __colstring;
		__layerdepth = __farthestdepth;
	}
	else
	{
		if (__fore == true)
		{
			__layername = __fgstring + string(__bind);
			__layerdepth = __nearestdepth - (__bind * __depthinc);
		}
		else
		{
			__layername = __bgstring + string(__bind);
			__layerdepth = (__farthestdepth - __depthinc) - (__bind * __depthinc);	// reserve 16000 for imported colour
		}
	}

	// If we already have a background in this slot, nuke it
	var __layerid;
	if (__bind == -1)
	{
		__layerid = __collayer;
	}
	else
	{
		__layerid = __slots[__bind];
	}
	
	if (__layerid != -1)
	{
		layer_destroy(__layerid);
	}
	__layerid = layer_create(__layerdepth, __layername);

	// Set our layer properties
	layer_x(__layerid, __x);
	layer_y(__layerid, __y);
	layer_hspeed(__layerid, __hspeed);
	layer_vspeed(__layerid, __vspeed);

	// Construct our new background element
	var __backel = layer_background_create(__layerid, __back);
	layer_background_visible(__backel, __vis);
	layer_background_htiled(__backel, __htiled);
	layer_background_vtiled(__backel, __vtiled);
	layer_background_xscale(__backel, __xscale);
	layer_background_yscale(__backel, __yscale);
	layer_background_stretch(__backel, __stretch);
	layer_background_blend(__backel, __blend);
	layer_background_alpha(__backel, __alpha);

	__result[0] = __backel;
	__result[1] = __layerid;

	return __result;


}

function __background_get_colour_element() {
	// NOTE: this script will only work properly if you're using the standard depth range (-16000 to 16000)
	var __nearestdepth = -15000;
	var __farthestdepth = 15999;
	var __depthinc = 100;

	var __result;
	__result[0] = -1;
	__result[1] = -1;


	// Now look at the existing layers in the room to see if we have any foregrounds or backgrounds
	var __colstring = "Color";
	var __layerlist = layer_get_all();
	var __layerlistlength = array_length_1d(__layerlist);
	var __i;

	var __layerid = -1;
	var __isforeground = false;

	// Try and find the appropriate background in the list of layers
	for(__i = 0; __i < __layerlistlength; __i++)
	{
		var __layername = layer_get_name(__layerlist[__i]);	
		if (string_pos(__colstring, __layername) > 0)
		{
			__layerid = __layerlist[__i];		
			
			break;		
		}	
	}

	if (__layerid != -1)
	{
		// We have a winner!
		// Get id of background element on this layer
		var __els = layer_get_all_elements(__layerid);
		var __elslength = array_length_1d(__els);
		for(__i = 0; __i < __elslength; __i++)
		{
			if (layer_get_element_type(__els[__i]) == layerelementtype_background)
			{				
				__result[0] = __els[__i];
				__result[1] = __layerid;
			}
		}			
	}
	else
	{
		// Need to construct a new layer with a new background
		var __newback = __background_set_element(-1, false, false, -1, 0, 0, true, true,1,1, true, 0, 0, $0, 1);
		__result[0] = __newback[0];
		__result[1] = __newback[1];	
	}

	return __result;


}


function __background_set_colour(argument0) {
	var __newcol = argument0;

	var __colinfo = __background_get_colour_element();

	if (__colinfo[0] == -1)
		return 0;
	
	layer_background_blend(__colinfo[0], __newcol);
	return __newcol;
}


function __background_get_element(argument0) {
	var __bind = argument0;

	var __result;
	__result[0] = -1;
	__result[1] = -1;
	__result[2] = -1;


	// Look at the existing layers in the room to see if we have any foregrounds or backgrounds
	var __fgstring = "Foreground_";
	var __bgstring = "Background_";
	var __fglen = string_length(__fgstring);
	var __bglen = string_length(__bgstring);
	var __layerlist = layer_get_all();
	var __layerlistlength = array_length_1d(__layerlist);
	var __i;

	var __layerid = -1;
	var __isforeground = false;

	// Try and find the appropriate background in the list of layers
	for(__i = 0; __i < __layerlistlength; __i++)
	{
		var __layername = layer_get_name(__layerlist[__i]);	
		if (string_pos(__fgstring, __layername) > 0)
		{
			var __slotchr = string_char_at(__layername, __fglen + 1);
			if (__slotchr == "")
				continue;
			
			var __slot = real( __slotchr );
		
			if (__slot == __bind)
			{
				__layerid = __layerlist[__i];
				__isforeground = true;
			
				break;
			}		
		}
		else if (string_pos(__bgstring, __layername) > 0)
		{
			var __slotchr = string_char_at(__layername, __bglen + 1);
			if (__slotchr == "")
				continue;
			
			var __slot = real( __slotchr );
		
			if (__slot == __bind)
			{
				__layerid = __layerlist[__i];
				__isforeground = false;
			
				break;
			}		
		}	
	}

	if (__layerid != -1)
	{
		// We have a winner!
		// Get id of background element on this layer
		var __els = layer_get_all_elements(__layerid);
		var __elslength = array_length_1d(__els);
		for(__i = 0; __i < __elslength; __i++)
		{
			if (layer_get_element_type(__els[__i]) == layerelementtype_background)
			{				
				__result[0] = __els[__i];
				__result[1] = __layerid;
				__result[2] = __isforeground;
			}
		}			
	}
	else
	{
		// Need to construct a new layer with a new background
		var __newback = __background_set_element(__bind, false, false, -1, 0, 0, true, true,1,1, false, 0, 0, $ffffff, 1);
		__result[0] = __newback[0];
		__result[1] = __newback[1];
		__result[2] = false;
	}

	return __result;


}

function __background_set_internal(argument0, argument1, argument2, argument3) {
	var __prop = argument0;
	var __bind = argument1;
	var __val = argument2;
	var __backinfo = argument3;

	if (__backinfo[0] == -1)
	{
		return -1;	// erm
	}

	var __backid = __backinfo[0];
	var __layerid = __backinfo[1];
	var __isfore = __backinfo[2];

	if (__prop == e__BG.Foreground)
	{
		// This requires quite a bit of extra logic (we need to modify our layer list)
		if (round(__val) != round(__isfore))
		{
			// okay, we have a mismatch
			// Get all properties, then set the background again and copy the properties
			var __visible = layer_get_visible(__layerid);
			var __index = layer_background_get_sprite(__backid);
			var __htiled = layer_background_get_htiled(__backid);
			var __vtiled = layer_background_get_vtiled(__backid);
			var __stretch = layer_background_get_stretch(__backid);
			var __blend = layer_background_get_blend(__backid);
			var __alpha = layer_background_get_alpha(__backid);
			var __xscale = layer_background_get_xscale(__backid);
			var __yscale = layer_background_get_yscale(__backid);

			var __x = layer_get_x(__layerid);
			var __y = layer_get_y(__layerid);
			var __hspeed = layer_get_hspeed(__layerid);
			var __vspeed = layer_get_vspeed(__layerid);

			__background_set_element(__bind, __visible, __val, __index, __x, __y, __htiled, __vtiled,__xscale,__yscale, __stretch, __hspeed, __vspeed, __blend, __alpha);
		}
	}
	else
	{
		switch(__prop)
		{
		case e__BG.Visible: layer_set_visible(__layerid, __val); layer_background_visible(__backid, __val); break;	
		case e__BG.Index: 		
			layer_background_change(__backid, __val);  
			// RK :: if we are setting a sprite then set the background colour to white so it is blending correctly
			if (sprite_exists(__val)) { 
				layer_background_blend(__backid, c_white ); 
				layer_background_alpha(__backid, 1 ); 
			} // end if
			break;
		case e__BG.X: layer_x(__layerid, __val); break;
		case e__BG.Y: layer_y(__layerid, __val); break;
		case e__BG.HTiled: layer_background_htiled(__backid, __val); break;
		case e__BG.VTiled: layer_background_vtiled(__backid, __val); break;
		case e__BG.XScale: layer_background_xscale(__backid, __val); break;
		case e__BG.YScale: layer_background_yscale(__backid, __val); break;
		case e__BG.HSpeed: layer_hspeed(__layerid, __val); break;
		case e__BG.VSpeed: layer_vspeed(__layerid, __val); break;
		case e__BG.Blend: layer_background_blend(__backid, __val); break;
		case e__BG.Alpha: layer_background_alpha(__backid, __val); break;
		default: break;
		};
	}

	return -1;

}

function __background_get_internal(argument0, argument1, argument2) {
	var __prop = argument0;
	var __bind = argument1;
	var __backinfo = argument2;

	if ((__backinfo[0] == -1)
		|| (layer_background_exists(__backinfo[1], __backinfo[0]) == false))	// this can happen when we change between backgrounds and foregrounds (because layers and elements get destroyed)
	{
		// Try getting the background info again from the bind index
		__backinfo = __background_get_element(__bind);

		if (__backinfo[0] == -1)
			return -1;	// erm
	}



	var __res = -1;

	var __backid = __backinfo[0];
	var __layerid = __backinfo[1];
	var __isfore = __backinfo[2];

	switch(__prop)
	{
	case e__BG.Visible: __res = layer_get_visible(__layerid); break;
	case e__BG.Foreground: __res = __isfore; break;
	case e__BG.Index: __res = layer_background_get_sprite(__backid)  break;
	case e__BG.X: __res = layer_get_x(__layerid); break;
	case e__BG.Y: __res = layer_get_y(__layerid); break;
	case e__BG.Width: __res = sprite_get_width(layer_background_get_index(__backid)); break;
	case e__BG.Height: __res = sprite_get_height(layer_background_get_index(__backid)); break;
	case e__BG.HTiled: __res = layer_background_get_htiled(__backid); break;
	case e__BG.VTiled: __res = layer_background_get_vtiled(__backid); break;
	case e__BG.XScale: __res = layer_background_get_xscale(__backid); break;
	case e__BG.YScale: __res = layer_background_get_yscale(__backid); break;
	case e__BG.HSpeed: __res = layer_get_hspeed(__layerid); break;
	case e__BG.VSpeed: __res = layer_get_vspeed(__layerid); break;
	case e__BG.Blend: __res = layer_background_get_blend(__backid); break;
	case e__BG.Alpha: __res = layer_background_get_alpha(__backid); break;
	default: break;
	};

	return __res;
}

function __background_set(argument0, argument1, argument2) {
	var __prop = argument0;
	var __bind = argument1;
	var __val = argument2;

	var __backinfo = __background_get_element(__bind);

	__background_set_internal(__prop, __bind, __val, __backinfo);

	var __res = __background_get_internal(__prop, __bind, __backinfo);
	return __res;


}

function __background_get(argument0, argument1) {
	var __prop = argument0;
	var __bind = argument1;

	var __backinfo = __background_get_element(__bind);

	return __background_get_internal(__prop, __bind, __backinfo);
}

