
// clim
commande_p = 19.2+1;
commande_w = 60+1; 
command_h = 130;

wall = 1.2;
wall_p = 4;
wall_b = 4;

// lampe justine
commande_p = 14.5+1;
commande_w = 38.2+1; 
command_h = 90;

wall = 1.2;
wall_p = 4;
wall_b = 4; //*/


difference() {
	base();
	commande();
	corner();
	tranche();

	translate([wall+commande_w/2,wall+commande_p, wall_b+commande_w/2])
		rotate([-90,0,0])
			screew();
	translate([wall+commande_w/2,wall+commande_p,command_h+wall_b-commande_w/2])
		rotate([-90,0,0])
			screew();
}


module tranche() {
	translate([wall+commande_w/4,-5,5+commande_w/4])
		cube([commande_w/2,10,command_h]);
}

module corner() {
	translate([-5,commande_p+wall_p,command_h+wall_b])
		rotate([-225,0,0])
			cube([commande_w+10,commande_p*2,commande_p*2]);
	translate([wall,commande_p+wall_p,command_h+wall_b])
		rotate([-225+35,0,0])
			cube([commande_w,commande_p,commande_p]);
}

module base() {
	cube([commande_w+wall*2, commande_p+wall_p+wall,command_h+wall_b]);
}

module commande() {
	translate([wall, wall, wall_b])
		cube([commande_w,commande_p,command_h+10]);
}

module screew() {
	color("yellow") 
		union() {
			cylinder(20, 4/2, 4/2, $fn=32);
			cylinder(5, 10/2, 0, $fn=32);
			translate([0,0,-4])
				cylinder(4, 10/2, 10/2, $fn=32);
		}
}
