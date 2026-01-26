
w = 95;
p = 63;
//h = 4.8;
h = 7;
r = 4;

difference() {
	minkowski() {
		translate([0,0,-.5])
			cube([w-r*2,p-r*2, h-1], true);
		cylinder(1,r,r);
	}
	
  hole = (5.5+.5)/2;
  translate([w/2-8.3+hole, p/2-8.3+hole, 0])
	  cylinder(h+2,hole,hole, true, $fn=16);
  translate([w/2-8.3+hole, -(p/2-8.3+hole), 0])
	  cylinder(h+2,hole,hole, true, $fn=16);
  translate([-(w/2-8.3+hole), -(p/2-8.3+hole), 0])
	  cylinder(h+2,hole,hole, true, $fn=16);
  translate([-(w/2-8.3+hole), (p/2-8.3+hole), 0])
	  cylinder(h+2,hole,hole, true, $fn=16);
	cube([75.5,58,h+2], true);
	cube([82.5,43.5,h+2], true);

	translate([75.5/2,43.5/2,0])
		rotate([0,0,45])
			cube([5,5,h+2], true);
	translate([-75.5/2,43.5/2,0])
		rotate([0,0,45])
			cube([5,5,h+2], true);
	translate([-75.5/2,-43.5/2,0])
		rotate([0,0,45])
			cube([5,5,h+2], true);
	translate([75.5/2,-43.5/2,0])
		rotate([0,0,45])
			cube([5,5,h+2], true);

}


color("red")
	translate([60/2,-p/2,h/2])
		rotate([0,-90,0])
			linear_extrude(60)
				polygon([[0,0],[0,p],[25,15]]);
//	cube([82.5,43.5,5], true);