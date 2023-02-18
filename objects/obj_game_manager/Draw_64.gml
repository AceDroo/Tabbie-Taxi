/// @desc Draw Debug Info

var _w = obj_camera.res.width * obj_camera.res.scale / 2;

draw_text(_w, 128, "Score " + string(score));
draw_text(_w, 128 + 64, "High Score " + string(global.high_score));

if (display_failure) {
	var _txt = "You have lost " + string(customers_lost) + " customers!";
	if (customers_lost == 2) _txt += "\nThis is your last warning!";
	draw_set_font(fntGUI);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(_w, 128 + 96, _txt);	
}