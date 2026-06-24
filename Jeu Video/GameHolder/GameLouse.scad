
card_l = 34;
card_h = 4.5;
card_p = 35;

difference() {
	minkowski() {
		translate([1,1,1])
			cube([125-2,137-2,8-2]);
		sphere(1,$fn=64);
	}
	
	for(i=[0:2]) {
		x = (i+1)*(125-card_l*3)/4 + i*card_l;
		translate([x,2,.8])
			rotate([16,0,0])
				cardridge();
		translate([x,22,.8])
			rotate([16,0,0])
				cardridge();
		translate([x,42,.8])
			rotate([16,0,0])
				cardridge();
		translate([x,62,.8])
			rotate([16,0,0])
				cardridge();
		translate([x,82,.8])
			rotate([16,0,0])
				cardridge();
		translate([x,102,.8])
			rotate([16,0,0])
				cardridge();
		translate([x+card_l/2-11,2,.8])
			cube([22,125.1,10]);
	}

}

/*color("red") {
	x = (125-card_l*3)/4 ;
		translate([x,2,.8])
			rotate([16,0,0])
				cardridge();
		translate([x,102,.8])
			rotate([16,0,0])
				cardridge();
} //*/

module cardridge() {
			cube([card_l, card_p, card_h]);
			translate([card_l, 27, 0])
				cube([2.5,card_p-27,card_h]);

}	