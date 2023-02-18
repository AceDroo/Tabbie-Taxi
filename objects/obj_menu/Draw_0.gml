draw_set_font(fntGUI);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(room_width div 2, room_height div 2 + 96, "High Score: " + string(global.high_score));	