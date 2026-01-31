
w = 95;
p = 63;
//h = 4.8;
h = 7;
r = 4;

angle = 45;

rotate([0,-angle,0])
  translate([w/2,0,h/2])
		frame();

s = 40;
e = 68;

/*color("red")
	translate([0,p/2,0])
		rotate([90,0,0])
			linear_extrude(p)
				polygon([[s*cos(angle),0],[e*cos(angle),0],[e*cos(angle),e*cos(angle)],[s*cos(angle),s*cos(angle)]]);*/

color("green")
	translate([0,-15,0])
		rotate([90,0,0])
			linear_extrude(6)
				polygon([[0,0],[w*cos(angle),0],[w*cos(angle),w*cos(angle)]]);

color("green")
	translate([0,15+6,0])
		rotate([90,0,0])
			linear_extrude(6)
				polygon([[0,0],[w*cos(angle),0],[w*cos(angle),w*cos(angle)]]);

translate([0,-15,0])
	cube([w*cos(angle),30,4]);

translate([w*cos(angle)-6,-15,0])
	cube([6,30,30]);
	
/*	translate([60/2,-p/2,h/2])
		rotate([0,-90,0])
			linear_extrude(60)
				polygon([[0,0],[0,p],[25,15]]);*/
//	cube([82.5,43.5,5], true);

module frame() {
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
}