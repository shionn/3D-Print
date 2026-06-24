
w = 110;
l = 160;
h = 1;
relief = .4;
r = 10;


difference() {
	translate([r,r,0])
		minkowski() {
			cube([w-2*r,l-2*r,h]);
			cylinder(h,r,r, $fn=64);
		}
	
	translate([100,140,-1])
		linear_extrude(1.05)
			rotate([0,180,0])
				text("Avec tous nos", 7, "Deja Serif", halign="left" );
	translate([100,130,-1])
		linear_extrude(1.05)
			rotate([0,180,0])
				text("Voeux de bonheurs", 7, "Deja Serif", halign="left");
	translate([10,30,-1])
		linear_extrude(1.05)
			rotate([0,180,0])
				text("Justine", 7, "Deja Serif", halign="right");
	translate([10,20,-1])
		linear_extrude(1.05)
			rotate([0,180,0])
				text("Ludovic", 7, "Deja Serif", halign="right");
	translate([10,10,-1])
		linear_extrude(1.05)
			rotate([0,180,0])
				text("Morgan", 7, "Deja Serif", halign="right");
	/*translate([w/2,100,h*2-.1])
		linear_extrude(1)
			scale(.5)
				import("wedding-relationships-couple-marry-svgrepo-com.svg", center=true);
	translate([w/2,30,h*2-.1])
		linear_extrude(1)
			text("Game Over", 10, "DejaVu Sans:style=Condensed Bold",halign="center");*/
}

color("red") {
	translate([w/2,100,h*2])
		linear_extrude(relief)
			scale(.5)
				offset(delta=0.001)
					import("wedding-relationships-couple-marry-svgrepo-com.svg", center=true);
	translate([w/2,20,h*2])
		linear_extrude(relief)
			text("Game Over", 12, "DejaVu Sans:style=Condensed Bold",halign="center");
}
