include <../../lib/screew.scad>;


tournevis_facom_T30();

module tournevis_facom_T30() {
	d=21;
	h=15;
	ep_y = 4;
	ep_x = 2;
	difference() {
		cube([d+ep_x*2,d+ep_y*2,h], center=true);
		cylinder(h+10, d/2,d/2, $fn=32, center = true);
		translate([-20,-40-4,-20])
			cube(40);
		translate([0,d/2+1,0])
			rotate([-90,0,0])
				screew();
	}
}