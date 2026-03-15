
gap = .3;

translate([-100,0,0])
	straight(150);

translate([-65,0,0])
	corner();

module corner(l1 = 40, l2 = 40) {
	translate([0,-15,0])
		difference() {
			union() {
				end_left(l1);
				rotate([0,0,90])
					end_right(l2);
			}
			screew_hole();
		}			
	
	color("red")
		translate([0,35,0])
			union() {
				cover_left(l1+20);
				rotate([0,0,90])
					cover_right(l2+20);
			}
}

module straight(l = 100) {
	translate([-10,0,0])
		difference() {
			base(l);
			translate([0, l/2-20, 0])
				screew_hole();
			translate([0, -l/2+20, 0])
				screew_hole();
		}
	color("red")
		translate([10,0, 0])
			cover(l);
}

module base(l = 10) {
	rotate([90,0,0])
		translate([0,0, -l/2])
			linear_extrude(l) {
				polygon([[7,0], [7,1], [8,2], [7.5,5], [6.5,5], [6,2],
					[-6,2], [-6.5,5], [-7.5,5], [-8,2], [-7,1], [-7,0] ]);
			}
}

module cover(l = 10) {
	rotate([90,0,0])
		translate([0, 0, -l/2])
			linear_extrude(l) {
				polygon([[7.5,5], [8,2], [7+gap,1], [7+gap,0.3], [8.5,0], [9.5,0], [9.5,4], [8.5,6], 
					[-8.5,6], [-9.5,4], [-9.5,0], [-8.5,0], [-7-gap,0.3], [-7-gap,1], [-8,2], [-7.5,5]  ]);
			}
}

module screew_hole() {
	translate([0,0,-1])
		cylinder(4,2/2,10/2,$fn=16);	
}	

module end_left(l=40) {
	difference() {
		base(l);
		rotate([0,0,45])
			translate([0,-15,-1])
				cube(50);
	}
}	

module cover_left(l=40) {
	difference() {
		cover(l);
		rotate([0,0,45])
			translate([0,-15,-1])
				cube(50);
	}
}	

module end_right(l=40) {
	difference() {
		base(l);
		rotate([0,0,45])
			translate([-15,0,-1])
				cube(50);
	}
}	

module cover_right(l=40) {
	difference() {
		cover(l);
		rotate([0,0,45])
			translate([-15,0,-1])
				cube(50);
	}
}	

