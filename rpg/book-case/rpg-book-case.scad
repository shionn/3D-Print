
book_l = 150;
book_h = 215;
book_p = 20;

box_l = book_l + 2;
box_h = book_h + 2;
box_p = book_p;

lock_ext_r = 6;
lock_int_r1 = 2.1;
lock_int_r2 = 2.2;
lock_gap = .2;
lock_len = 20;

card_l = 64;
card_h = 90;

box_gap = .2;

/*translate([book_l+20,0,0]) {
	w = card_h;
	p = card_l*2+2;
	h = 35;
		
	difference() {
		minkowski() {
			cube([w,p,h]);
			sphere(2, $fn=32);
		}
		translate([-5, -5, h])
			cube([w+10, p+10, 10]);
		cube([card_h, card_l, h+5]);
		translate([0, card_l+2, 0])
			cube([card_h, card_l, h+5]);
		translate([card_h+1, card_l/2, h/2])
			cube([4, card_l/3, h+5], true);
		translate([card_h+1, card_l+2+card_l/2, h/2])
			cube([4, card_l/3, h+5], true);
	}
}//*/

translate([book_l+card_h+40,20,0]) {
	token_r = 30/2;
	difference() {
		minkowski() {
			cylinder(1,token_r, token_r,$fn=64);
			sphere(1,$fn=16);
		}
		//dessin
		translate([0,0,1.95])
			color("red")
				linear_extrude(2) {
					scale(.065)
						import("147686-607d8b.svg", center=true);
				}
	}

}

/*translate([10,0,0]) {
	
	// rotule
	translate([-lock_ext_r/2, 10, box_p+lock_gap])
		rotate([-90,0,0])
			difference() {
				cylinder(lock_len,lock_ext_r/2,lock_ext_r/2, $fn=16);
				translate([0,0,-1])
					cylinder(lock_len+2,lock_int_r1/2,lock_int_r1/2, $fn=16);
			}
	translate([-lock_ext_r/2, box_h-10, box_p+lock_gap])
		rotate([90,0,0])
			difference() {
				cylinder(lock_len,lock_ext_r/2,lock_ext_r/2, $fn=16);
				translate([0,0,-1])
					cylinder(lock_len+2,lock_int_r1/2,lock_int_r1/2, $fn=16);
			}

	// box
	difference() {
		minkowski() {
			cube([box_l, box_h, box_p]);
			sphere(2, $fn=32);
		}
		translate([-5, -5, box_p])
			cube([box_l+10, box_h+10,10]);

		// trou rotule
		translate([-lock_ext_r/2+lock_gap, lock_len+ 10, box_p-lock_gap])
			rotate([-90,0,0])
				cylinder(lock_len+lock_gap*2,lock_ext_r/2,lock_ext_r/2, $fn=16);
		translate([-lock_ext_r/2+lock_gap, box_h-10 -lock_len, box_p-lock_gap])
			rotate([90,0,0])
				cylinder(lock_len+lock_gap*2,lock_ext_r/2,lock_ext_r/2, $fn=16);
		
		// trou deck box
		deck_hole_l = card_h+4+box_gap;
		deck_hole_h = card_l*2+2+2+2+box_gap;
		translate([1,box_h-deck_hole_h-1,0])
			cube([deck_hole_l, deck_hole_h,box_p+5]);
		
		// trou crayon
		pen_hole_l = (book_l-deck_hole_l-2-2)/2;
		translate([book_l-pen_hole_l+1,1,0])
			cube([pen_hole_l, book_h, box_p+5]);
		translate([book_l-pen_hole_l*2-1,1,0])
			cube([pen_hole_l, book_h, box_p+5]);
		
		// trou token
		token_hole_l = deck_hole_l;
		token_hole_h = book_h-deck_hole_h-2;
		translate([1,1,0])
			cube([token_hole_l, token_hole_h, box_p+5]);
		
  }
}//*/

/*translate([-book_l-10,0,0]) {
	// rotule
	translate([box_l+lock_ext_r/2, 10+lock_len+lock_gap, box_p+lock_gap ])
		rotate([-90,0,0])
			difference() {
				cylinder(lock_len,lock_ext_r/2,lock_ext_r/2, $fn=16);
				translate([0,0,-1])
					cylinder(lock_len+2,lock_int_r2/2,lock_int_r2/2, $fn=16);
			}
	translate([box_l+lock_ext_r/2, box_h-10-lock_len-lock_gap, box_p+lock_gap])
		rotate([90,0,0])
			difference() {
				cylinder(lock_len,lock_ext_r/2,lock_ext_r/2, $fn=16);
				translate([0,0,-1])
					cylinder(lock_len+2,lock_int_r2/2,lock_int_r2/2, $fn=16);
			}

	difference() {
		minkowski() {
			cube([box_l, box_h, box_p]);
			sphere(2, $fn=32);
		}
		translate([-5, -5, box_p])
			cube([box_l+10, box_h+10,10]);
		// trou livre
		translate([1,1,0])
			cube([book_l, book_h, box_p+5]);
		// trou rotule
		translate([box_l+lock_ext_r/2-lock_gap, 10-lock_gap, box_p-lock_gap])
			rotate([-90,0,0])
				cylinder(lock_len+lock_gap*2,lock_ext_r/2,lock_ext_r/2, $fn=16);
		translate([box_l+lock_ext_r/2-lock_gap, box_h-10+lock_gap, box_p-lock_gap])
			rotate([90,0,0])
				cylinder(lock_len+lock_gap*2,lock_ext_r/2,lock_ext_r/2, $fn=16);

	} 
}//*/

