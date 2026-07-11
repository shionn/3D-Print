largeur_original = 90;
epaisseur_original = 8;
hauteur_original = 352;

interrupteur_hole = 30;
epaisseur_top = 18;
epaisseur_down = 8;
renfort_top_1 = 160;

hauteur_cut = 155;
angle_cut = -25;

screen_w = 95.4;
screen_p = 63.4;
screen_h = 4.6;
screen_r = 4;

screen_position = 240;

/*translate([-100,0,0])
	base(epaisseur_original);//*/

// Top
translate([0,epaisseur_down-epaisseur_top,0]) {
	union() {
		difference() {
			base(epaisseur_top);
			translate([0,epaisseur_top-epaisseur_down,hauteur_cut])
				rotate([0,90-angle_cut,0])
					translate([0, 0, -100])
						cube(1000);
			translate([0,-1,hauteur_cut-15])
				rotate([0,90-angle_cut,0])
					translate([0, 0, -100])
						cube(1000);
			translate([largeur_original/2, -1, screen_position])
				rotate([90,90,0])
					screen_hole();
		}
		translate([5,2,renfort_top_1])
			cube([largeur_original-5*2,epaisseur_top-2, 2]);
		translate([4,2,300])
			cube([largeur_original-4*2,epaisseur_top-2, 2]);
		//ecran
		translate([largeur_original/2, 0, screen_position])
			rotate([-90,90,0])
				screen();

		translate([largeur_original/2-27/2,3+1.5,renfort_top_1-3])
			cylinder(3,2.8/2,2.8/2, $fn=32);
		translate([largeur_original/2+27/2,3+1.5,renfort_top_1-3])
			cylinder(3,2.8/2,2.8/2, $fn=32);
	}
}


//screen();

// down
/*translate([100,0,0]) {
	difference() {
		union() {
			base(epaisseur_down);
			difference()  {
				union() {
					translate([0,0,hauteur_cut-16])
						cube([2,epaisseur_down,15+1]);
					translate([largeur_original-2,0,hauteur_cut-60])
						cube([2,epaisseur_down,20]);
				}
				translate([0,-1,hauteur_cut-15])
					rotate([0,90-angle_cut,0])
						translate([0, 0, -100])
							cube(1000);
			}
		}
		//interrupteur
		translate([largeur_original/2,-1,largeur_original/2*sqrt(2)])
			rotate([-90,0,0])
				cylinder(4,interrupteur_hole/2,interrupteur_hole/2,$fn=128);
		//trou lumiere
		translate([4,2,-1])
			cube([largeur_original-8, epaisseur_down, 4]); 
		// cut
		translate([0,-1,hauteur_cut])
			rotate([0,-angle_cut,0])
				translate([-100, 0, 0])
					cube(1000);
	}
	//connecteur
	translate([2,2,hauteur_cut-10])
		cube([2, epaisseur_down-2, 18]);
	//connecteur
	translate([largeur_original-4,2,hauteur_cut-50])
		cube([2, epaisseur_down-2, 18]);
	//renfort
	translate([4,2,100])
		cube([largeur_original-4*2,epaisseur_down-2, 2]);
	translate([4,2,15])
		cube([largeur_original-4*2,epaisseur_down-2, 2]);
	translate([largeur_original/2-27/2,3+1.5,15-2.5])
		rotate([90,0,0])
			cylinder(3,2.8/2,2.8/2, $fn=32);
	translate([largeur_original/2+27/2,3+1.5,15-2.5])
		rotate([90,0,0])
			cylinder(3,2.8/2,2.8/2, $fn=32);
}//*/

module base(epaisseur) {
	round = 2;
	difference() {
		translate([round,round,round])
			minkowski() {
				cube([largeur_original-round*2, epaisseur-round, hauteur_original-round*2]);
				rotate([90,0,0])
					sphere(round,round,round,center=false, $fn=32);
			}
		translate([0,epaisseur,0])
			cube([largeur_original, 5, hauteur_original]);
		translate([2,2,2])
			cube([largeur_original-4, epaisseur, hauteur_original-4]);
	}
	translate([19.5,2,28.8]) screw_post(epaisseur);
	translate([largeur_original-18.6,2,20.7]) screw_post(epaisseur);
	translate([19.5,2,176]) screw_post(epaisseur);
	translate([largeur_original-18.6,2,153]) screw_post(epaisseur);
	translate([36.5,2,hauteur_original-37.5]) screw_post(epaisseur);
	translate([largeur_original-16,2,hauteur_original-37.5]) screw_post(epaisseur);
}


module screw_post(epaisseur) {
	rotate([-90,0,0])
		difference() {
			cylinder(epaisseur-2, 3, 3,$fn=32);
			cylinder(epaisseur, 1.5, 1.5,$fn=32);
		}
}

module screen() {
	translate([0,0,screen_h/2])
		difference() {
			cube([screen_w+10, screen_p+10,screen_h], true);
			screen_hole();
		}
	translate([0,0,screen_h])
		screen_frame_screew();//*/
}

module screen_hole() {
		minkowski() {
			cube([screen_w-screen_r*2,screen_p-screen_r*2, screen_h+10], true);
			cylinder(1,screen_r,screen_r,$fn=32);
		}
}

module screen_frame_screew() {
	w = screen_w+10;
	p = screen_p+10;
	h = 6;
	
	hole_r = (5.5+.5)/2;
	hole_x = 95/2-8.3+hole_r;
	hole_y = 63/2-8.3+hole_r;
	
	translate([0,0,h/2]) 
		difference() {
			cube([w, p, h], true);
			
			translate([hole_x, hole_y, 0])
				cylinder(h+2,hole_r,hole_r, true, $fn=32);
			translate([hole_x, -hole_y, 0])
				cylinder(h+2,hole_r,hole_r, true, $fn=32);
			translate([-hole_x, -hole_y, 0])
				cylinder(h+2,hole_r,hole_r, true, $fn=32);
			translate([-hole_x, hole_y, 0])
				cylinder(h+2,hole_r,hole_r, true, $fn=32);
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