
gap = .3;

//translate([-100,0,0])
	straight(207);

//translate([-65,0,0])
//	corner(80,80,20,20);

module corner(l1 = 20, l2 = 20, l1topadd = 20, l2topadd = 20) {
	translate([0,0,0])
		difference() {
			union() {
				end_left(l1*2);
				rotate([0,0,90])
					end_right(l2*2);
			}
			screew_hole();
			translate([l2-25,0,0])
				screew_hole();
			translate([0,-l1+25,0])
				screew_hole();
		}			
	
	color("red")
		translate([-35,35,0])
			union() {
				cover_left(l1*2+l1topadd*2);
				rotate([0,0,90])
					cover_right(l2*2+l2topadd*2);
			}
}

module straight(l = 100) {
	translate([-10,0,0])
		difference() {
			base(l);
			translate([0, l/2-25, 0])
				screew_hole();
			translate([0, -l/2+25, 0])
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
		cylinder(4,2/2,10/2,$fn=32);	
}	

module end_left(l=40) {
	difference() {
		base(l);
		rotate([0,0,45])
			translate([0,-15,-1])
				cube(500);
	}
}	

module cover_left(l=40) {
	difference() {
		cover(l);
		rotate([0,0,45])
			translate([0,-15,-1])
				cube(500);
	}
}	

module end_right(l=40) {
	difference() {
		base(l);
		rotate([0,0,45])
			translate([-15,0,-1])
				cube(500);
	}
}	

module cover_right(l=40) {
	difference() {
		cover(l);
		rotate([0,0,45])
			translate([-15,0,-1])
				cube(500);
	}
}	

