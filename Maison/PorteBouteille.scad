



difference() {
	base();
	bottle();
	translate([0,66/2,140])
		rotate([-90,0,0])
			screew();
	translate([0,66/2,30])
		rotate([-90,0,0])
			screew();
}


module base() {
	grap = 2;
	translate([-35,0-grap, -3]) {
		cube([70,40+grap,175]);
		translate([35,+grap,0])
			cylinder(5,70/2,70/2, $fn=32);
	}
}	

module bottle() {
	color("red") {
		cylinder(164,66/2,66/2, $fn=32);
		cylinder(168,27/2,27/2, $fn=32);
		translate([0,0,168])
			cylinder(2,33/2,33/2, $fn=32);
		translate([0,0,170])
			cylinder(15,29/2,29/2, $fn=32);
	}
}

module screew() {
	color("yellow") {
		cylinder(20, 4/2, 4/2, $fn=32);
		cylinder(4, 8/2, 0, $fn=32);
		translate([0,0,-4])
			cylinder(4, 8/2, 8/2, $fn=32);
	}
}