

wood_w = 10+1;
wood_p = wood_w;

wall = .8;

difference() {
	cube([wood_w*10+wall*11, wood_p+wall*2,115*2/3]);
	for (x = [0:9]) {
		translate([wall+wood_w*x+wall*x, wall, wall*2])
			cube([wood_w, wood_p, 100]);
	}
}