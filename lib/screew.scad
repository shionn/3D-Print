
//screew();

module screew(r=4, len=20, hole_len=4) {
	color("yellow") {
		cylinder(len, r/2, r/2, $fn=32);
		cylinder(r, r*2/2, 0, $fn=32);
		translate([0,0,-hole_len])
			cylinder(hole_len, r*2/2, r*2/2, $fn=32);
	}
}