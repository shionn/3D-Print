
l_20=55+5;
l_10=42+5;

l= max(l_20, l_10);

wall=2;
difference() {
	cube([l+wall*2,l_20*2+l_10*2+wall*5,85]);
	translate([wall,wall,wall]) {
		cube([l,l_10,90]);
		translate([0,l_10+wall,0])
			cube([l,l_10,90]);
		translate([0,l_10*2+wall*2,0])
			cube([l,l_20,90]);
		translate([0,l_10*2+l_20+wall*3,0])
			cube([l,l_20,90]);
	}
}
