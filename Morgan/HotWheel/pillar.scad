
track_w=24;
track_w_inn=19;


line_track();


module line_track() {
	l=250;
	h = 8;
	translate([0,0,2.5])
		cube([35,l,5], true);
	translate([0,0,h/2])
		difference() {
			cube([18,l,h], true);
			/*scale([1,15,45])
				rotate([45,0,0])
					cube([60,1,1], true); //*/
		}
	translate([0,0,h])
		track_holder(l);
}


module pillar() {
	h = 90;
	b = 35;
	translate([0,0,2.5])
		cube([35,35,5], true);
	translate([0,0,h/2])
		difference() {
			cube([18,35,h], true);
			scale([1,15,45])
				rotate([45,0,0])
					cube([60,1,1], true); //*/
		}
	translate([0,0,h])
		track_holder(b);
}

module track_holder(l, center = true) {
	d=1.4;
	cube([track_w,l,d], center);
}