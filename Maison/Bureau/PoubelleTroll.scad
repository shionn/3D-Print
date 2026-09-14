wall = 1.2;
diameter1 = 154;
diameter2 = 164;

h=10;
top_h=2;

/*cylinder(h, diameter2/2+wall, diameter2/2+wall, $fn=128);
translate([0,0,-wall])
	cylinder(h+wall*2, diameter1/2+wall, diameter1/2+wall, $fn=128);
*/

difference() {
	cylinder(h, diameter2/2+wall, diameter2/2+wall, $fn=128);
	translate([0,0,top_h])
		hole();
	translate([0,0,-1])
		cylinder(h+2, diameter1/2-wall, diameter1/2-wall, $fn=128);
}

module hole() {
	difference() {
		cylinder(h, diameter2/2, diameter2/2, $fn=128);
		translate([0,0,-wall])
			cylinder(h+wall*2, diameter1/2, diameter1/2, $fn=128);
	}
}