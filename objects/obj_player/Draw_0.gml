/// @desc Draw Player

draw_self();

// Draw arrow indicating destination planet
if (PlayerIsCarryingPassenger()) {
	var _planet = current_passenger.destination_planet;
	var _dir = point_direction(x, y, _planet.x, _planet.y);
	var _len = 96
	var _x = x + lengthdir_x(_len, _dir);
	var _y = y + lengthdir_y(_len, _dir);
	
	draw_sprite_ext(spr_arrow, 0, _x, _y, 1, 1, _dir, _planet.image_blend, 1);	
}