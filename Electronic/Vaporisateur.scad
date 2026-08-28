



difference() {
	disque();
	translate([0,0,3])
		atomiseur();
}


module atomiseur() {
	d = 27.7;
	h = 8;
	hole_d = 15;
	hole_h = 30;
	union() {
		cylinder(h,d/2,d/2, $fn=64);
		translate([0,0,-hole_h+1])
			cylinder(hole_h, hole_d/2, hole_d/2, $fn=64);
	}
}

module side() {
	
}


module disque() {
	disque_d = 67.2;
	disque_h = 5;

	side_e = 2;
	side_h = 61 + disque_h -2;
	side_h_bis = 35;
	side_l = 21;
	
	difference() {
		union() {
			cylinder(disque_h,disque_d/2+.8, disque_d/2+.8, $fn=64);
			translate([disque_d/2+.8-side_e,-side_l/2,-side_h+disque_h])
				cube([side_e,side_l, side_h]);
			rotate([0,0,34])
				translate([disque_d/2+.8-side_e,-side_l/2,-side_h_bis+disque_h])
					cube([side_e,side_l, side_h_bis]);
			rotate([0,0,-34])
				translate([disque_d/2+.8-side_e,-side_l/2,-side_h_bis+disque_h])
					cube([side_e,side_l, side_h_bis]);

		}
		translate([0,0,-0.001])
			cylinder(2,disque_d/2, disque_d/2, $fn=64);
	}
}

module pot() {
	d_bas = 52.5;
	d_haut = 61;
	hauteur = 60;

	difference() {
		cylinder(hauteur+.8,d_bas/2+.8, d_haut/2+.8, $fn=64);
		translate([0,0,.8])
			cylinder(hauteur+.8,d_bas/2, d_haut/2, $fn=64);
		translate([0,0,hauteur/2])
			cube([20, d_haut+20, hauteur-20], true);
	}
}