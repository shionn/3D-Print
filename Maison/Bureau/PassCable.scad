
epaisseur = 4;
arrondi = 4;

// big one
difference() {
	base(50,80,50,20);
	hole(50,20,50);
	hole(50,80-20,50);
}

// small one
translate([60, 0,0])
	difference() {
		base(50,50,30, 12);
		hole(50,25,30);
	}

//casque
translate([-60, 0,0])
	difference() {
		base(50,60,50, 30);
		hole(50,20,50);
		hole(50,40,50);
	}


module base(l,p,h, cable_hole) {

	difference() {
		cube([l,p,h]);

		translate([0,epaisseur+arrondi, epaisseur+arrondi])
			minkowski() {
				cube([l+10, p-epaisseur*2-arrondi*2, h-epaisseur*2-arrondi*2]);
				sphere(arrondi,$fn=64);
			}
		translate([-5,p-10,h-cable_hole-epaisseur])
			cube([l+10,20,cable_hole]);
	}
}

module hole(l,p,h) {
	translate([l/2,p,h-epaisseur-1]) {
		cylinder(epaisseur+2, 1.5, 1.5, $fn=32);
		cylinder(3,1.5+3,1.5, $fn=32);
	}
	translate([l/2,p,-1]) 
		cylinder(epaisseur+2, 5, 5, $fn=32);

}


