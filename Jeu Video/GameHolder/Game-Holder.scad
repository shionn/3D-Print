
mode = "switch";

game_separation = .8;
game_seperation_l = 20;
side = 4;
handling = 10;

if (mode == "ds") {
	game_count = 9;
	game_h = 21; //ma mesure 20+.5
	game_p = 138.2-handling; // ma mesuer 137
	game_l = 126; // ma mesure 124+.5
	title_h = 25;
	draw(game_l, game_p, game_h, game_count, title_h, "Nintendo_DS_Logo.svg", 0.12);
} else if (mode == "3ds") {
	game_count = 12;
	game_h = 16; //ma mesure 15.2+.5
	game_p = 138.2-handling;
	game_l = 126; // ma mesure 124.7+.5
	title_h = 20;
	draw(game_l, game_p, game_h, game_count, title_h, "Nintendo_3DS_logo.svg", .055);
} else if (mode == "snes") {
	game_count = 5;
	game_h = 37; //ma mesure 36
	game_p = 180 - handling; // 180
	game_l = 133; // 131
	title_h = 25;
	draw(game_l, game_p, game_h, game_count, title_h, "snes_logo.svg", .8);
} else if (mode == "switch") {
	game_count = 15;
	game_h = 12; //ma mesure 11.1+.5
	game_p = 104-handling;
	game_l = 171; // ma mesure 169.5
	title_h = 25;
	draw(game_l, game_p, game_h, game_count, title_h, "switch-logo-simple.svg", .7);
} 




module draw(game_l,game_p,game_h, game_count, title_h, logo, logo_scale) {
	ext_l = game_l+side*2;
	ext_p = game_p + game_separation;
	game_h_total = game_h * game_count+ game_separation * (game_count-1);
	ext_h = game_h_total +title_h +side;

	difference() {
		cube([ext_l,ext_p,ext_h]);
		translate([side,-1, side])
			for(i=[0:game_count-1]) {
				translate([0,0,game_h*i+game_separation*i])
				cube([game_l,game_p+1,game_h]);
			}
		translate([side+game_seperation_l,-1,side])
			cube([game_l-game_seperation_l*2,
				game_p+10,
				game_h_total]);
	};
		color("red")
			translate([ext_l/2,0,game_h_total+side+title_h/2])
				rotate([90,0,0])
					linear_extrude(1)
						scale(logo_scale)
							import(logo, center=true);
};
