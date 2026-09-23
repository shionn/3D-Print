

module screew() {
	color("yellow") {
		cylinder(20, 4/2, 4/2, $fn=32);
		cylinder(4, 8/2, 0, $fn=32);
		translate([0,0,-4])
			cylinder(4, 8/2, 8/2, $fn=32);
	}
}