include <../../lib/screew.scad>;


//tournevis_facom_T30();
//clef_cliquet_facom();
//mini_clef_cliquet_facom();

flat_keys();

module flat_keys() {
	crochet_ep = 2;
	crochet_h = 3;
	base_r = 21/2;
	base_h = 13;
	base_p = 4;
	keys = [ 
		[  7, 15.7,  7.5, 1],
		[  8, 17.2,  8.9, 0],
		[  9, 19.2,  9.0, 0],
		[ 10, 20.9, 10.6, 0],
		[ 11, 23.5, 11.1, 1],
		[ 12, 26.0, 12.0, 0],
		[ 13, 28.2, 13.5, 0],
		[ 14, 29.6, 13.2, 1],
		[ 15, 32.0, 14.1, 0],
		[ 16, 33.6, 15.3, 0],
		[ 17, 36.0, 15.5, 1],
		[ 18, 38.9, 16.8, 1],
		[ 19, 40.5, 18.2, 0],
		[ 20, 41.6, 18.4, 1],
		[ 21, 43.1, 19.3, 0],
		[ 22, 45.0, 18.4, 1],
		[ 23, 47.9, 20.3, 0],
		[ 24, 49.1, 21.2, 1],
	];
	
	module key_holder(i, end = 0) {
		h =  keys[i][2]+3;
		r = (keys[i][0]-3)/2;
		x =  keys[i][1];
		cylinder(h,r,r, $fn=32);
		translate([0,0,h]) 
						color("red")
			hull() {
				cylinder(crochet_ep,r,r, $fn=32);
				translate([0,3,0])
					cylinder(crochet_ep,r,r, $fn=32);
			}
		if (i>end) 
			translate([x,0,0])
				key_holder(i-1, end);
	}
	
	module base(i, end = 0) {
		x =  keys[i][1];
		cylinder(base_p,base_r,base_r,$fn=32);
		translate([0,base_h,0])
			cylinder(base_p,base_r,base_r,$fn=32);
		if (i>end) 
			translate([x,0,0])
				base(i-1, end);
	}
	
	module screews(i, end = 0) {
		x =  keys[i][1];
		do_screew = keys[i][3];
		if (do_screew) 
			translate([0,base_h+5,0])
				rotate([180,0,0])
					screew();
		if (i>end) 
			translate([x,0,0])
				screews(i-1, end);
	}
	
	module one_key_holder(start, end) {
		difference() {
			union() {
				key_holder(start-7, end-7);
				translate([0,0,-base_p])
					hull()
						base(start-7, end-7);
			}
			screews(start-7, end-7);
		}
	}
	
	one_key_holder(17, 7);
	translate([0,base_h*3,0])
		one_key_holder(22, 18);
}


module mini_clef_cliquet_facom() {
	keys = [	[14,8.9, 0],
						[13,8.5, 33],
						[12,8.2, 33+30],
						[11,7.7, 33+30+28],
						[10,7.3, 33+30+28+25],
						[8,6.5,  33+30+28+25+24]];//*/

	difference() {
		union() {
			for (i=[0:5]) {
				key=keys[i];
				r=(key[0]-3)/2;
				h=key[1]+2;
				//x= for (j=[j-1:0:-1]) each [k, ;
				translate([key[2],0,0]) {
					cylinder(h,r,r,$fn=32);
					translate([0,0,h]) 
						hull() {
							cylinder(2,r,r,$fn=32);
							translate([0,2,0]) cylinder(2,r,r,$fn=32);
						}
				}
			}
			hull() {
				r = 16/2;
				translate([0,0,-4]) cylinder(4,r,r,$fn=32);
				translate([keys[5][2],0,-4]) cylinder(4,r,r,$fn=32);
				translate([keys[5][2],15,-4]) cylinder(4,r,r,$fn=32);
				translate([0,15,-4]) cylinder(4,r,r,$fn=32);
			}
		}
		translate([0,15,0]) rotate([180,0,0]) screew();
		translate([keys[5][2],15,0]) rotate([180,0,0]) screew();
	}
}

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