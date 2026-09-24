include <../../lib/screew.scad>;


//tournevis_facom_T30();
clef_cliquet_facom();

module clef_cliquet_facom() {
	x1=-35/2;
	x2= 26/2;
	difference() {
		union() {
			translate([x1,0,0]) {
				r = 19;
				h = 22+2; //22
				cylinder(h,(r-4)/2,(r-4)/2,$fn=64);
				translate([0,0,h])
					hull() {
						cylinder(2,(r-4)/2,(r-4)/2,$fn=64);
						translate([0,3,0])
							cylinder(2,(r-4)/2,(r-4)/2,$fn=64);
					}
			}
			translate([x2,0,0]) {
				r = 13;
				h = 17+2; 
				cylinder(h,(r-4)/2,(r-4)/2,$fn=64);
				translate([0,0,h])
					hull() {
						cylinder(2,(r-4)/2,(r-4)/2,$fn=64);
						translate([0,3,0])
							cylinder(2,(r-4)/2,(r-4)/2,$fn=64);
					}
			}
			hull() {
				r=18;
				translate([x1, 0,-4]) cylinder(4,r/2,r/2,$fn=64);
				translate([x1,15,-4]) cylinder(4,r/2,r/2,$fn=64);
				translate([x2,15,-4]) cylinder(4,r/2,r/2,$fn=64);
				translate([x2, 0,-4]) cylinder(4,r/2,r/2,$fn=64);
			} 
		}
		translate([x1,15,0])
			rotate([180,0,0])
				screew();
		translate([x2,15,0])
			rotate([180,0,0])
				screew();
	}
	
}

module tournevis_facom_T30() {
	d=21;
	h=15;
	ep_y = 8;
	ep_x = 2;
	ep_griffe = 4;
	difference() {
		cube([d+ep_x*2,d+ep_y*2,h], center=true);
		cylinder(h+10, d/2,d/2, $fn=32, center = true);
		translate([-20,-40-ep_griffe,-20])
			cube(40);
		translate([0,d/2+1,0])
			rotate([-90,0,0])
				screew();
	}
}