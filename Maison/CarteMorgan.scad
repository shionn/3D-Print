l = 63;
h = 88;

e = 2.5;
r = 2.5;

minkowski() {
	cube([h,l,e-1], true);
	cylinder(1,r/2,r/2, true, $fn=16);
}

color("white") {
	translate([0,l/2-5,e/2])
		linear_extrude(1)
			text("20 minutes avec", 6 , "DejaVu Sans", halign="center", valign="top");

	translate([0,5,e/2])
		linear_extrude(1)
			text("PAPA !", 17, "DejaVu Sans:style=Condensed Bold", halign="center", valign="center", spacing=1);

}

/*color("red") {
	translate([-h/2+15,-l/2+15,e/2]) {
		difference() {
			cylinder(1,10,10, $fn=32);
			translate([0,0,-1])
				cylinder(3,9,9, $fn=32);
		}
		difference() {
			cylinder(1,10,10, $fn=32);
			translate([-15,-15,-1])
				cube([15,30,3]);
			rotate([0,0,-120])
				translate([0,-15,-1])
					cube([15,30,3]);
		}
	}
}*/

color("yellow") {
	translate([0,-18,e/2])
		linear_extrude(1)
			scale(.05)
				offset(delta=1)
					import("dice.svg", center=true);
	translate([29,-18,e/2])
		linear_extrude(1)
			scale(.025)
				offset(delta=1)
					import("vecteezy_brick-outline-icon_12802525.svg", center=true);
	translate([-29,-18,e/2])
		linear_extrude(1)
			scale(.015)
				offset(delta=1)
					import("vecteezy_badminton-vector-icon-design_21290731.svg", center=true);
}

