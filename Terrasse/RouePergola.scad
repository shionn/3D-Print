
base();
translate([(54-20)/2,0,0])
	axed_wheels();

module base() {
	l = 54;
	w = 20;
	p = 4;
	hole = 7.5;
	
	translate([0,0,-.5])
		difference() {
			minkowski() {
				cube([l-w+1,1,p-1], center = true);
				cylinder(1,(w-1)/2,(w-1)/2, $fn=63);
			}
			translate([(l-w)/2,0,-4])
				cylinder(10, (hole/2+1), (hole/2+1), $fn=64);
			translate([-(l-w)/2,0,-4])
				cylinder(10, hole/2, hole/2, $fn=64);
		}
};

module axed_wheels() {
	axe = 13.5;
	r = 8;
	cylinder(axe, r/2, r/2, $fn=32, true);
	translate([0,0,axe/2])
		wheel();
	translate([0,0,-axe/2])
		wheel();
}

module wheel() {
	d = 21;
	e = 7;
	r = (d-e+1)/2;
	minkowski() {
		cylinder(1,r,r, $fn=64);
		sphere((e-1)/2, $fn=32);
	}
}

