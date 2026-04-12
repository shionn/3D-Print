
top_r = 53/2;
top_h = 4;
base_r = 70/2+2;
base_h = 8;

esp_l = 35;
esp_w = 26;
esp_hole = (36.5 + 32)/2;


translate([0,0,base_h+top_h/2])
	difference() {
		cylinder(top_h,top_r,top_r,true, $fn=64);
		translate([0,0,-top_h]) {
			rotate([0,0,-35]) {
				translate([esp_hole/2,0,0])
					cylinder(3,1,1, $fn=16);
				translate([-esp_hole/2,0,0])
					cylinder(3,1,1, $fn=16);
			}
		}
		/*translate([0,0,-5])
			cylinder(top_h+1,top_r-2,top_r-2,true, $fn=64);*/
	}

translate([0,0,base_h/2]) 
	difference() {
		cylinder(base_h,base_r,base_r,true, $fn=64);
		// passage cable led
		translate([-base_r+3,-10/2,base_h/2-3])
			cube([15,10,4]);
		// cable usb
		translate([base_r-15,-13/2,-6])
			cube([20,13,9]);
		// trou
		cylinder(10,top_r-2,top_r-2,true, $fn=64);
		translate([0,0,-4])
			cylinder(base_h,base_r-2,base_r-2,true, $fn=64);
	}

translate([100,0, -1]) 
	difference() {
		union() {
			cylinder(2,base_r,base_r,true, $fn=64);
			translate([0,0,2])
				cylinder(2,base_r-2,base_r-2,true, $fn=64);
		}
	
		translate([0,-13/2,1])
			cube([40,13,8]);
	}


translate([-100,0, 34]) 
	difference() {
		sphere(45, $fn=64);
		sphere(44, $fn=64);
		translate([0,0,-50-25.5])
			cube(100, true);
	}
