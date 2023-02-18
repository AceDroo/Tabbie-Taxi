/// @desc Draw the passenger

draw_self();

if (!is_travelling) {
	var hp = 100 * (patience / initial_patience);
	draw_healthbar(x - 12, y + 9, x + 12, y + 3, hp, c_black, c_red, c_green, 0, true, true);
}