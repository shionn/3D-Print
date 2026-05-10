

boxW = 50;
boxH = 80;

topH = 10;
bottomH = 10;

rext = 6;
rlock = 2;
rturn = 2.2;
rlen = 10;
lockgap = .2;

translate ([0,0,0]) {
	
	// rotule
	translate([boxW+rext/2, 10+rlen+lockgap, topH+lockgap])
		rotate([-90,0,0])
			difference() {
				cylinder(rlen,rext/2,rext/2, $fn=16);
				translate([0,0,-1])
					cylinder(rlen+2,rturn/2,rturn/2, $fn=16);
			}
	translate([boxW+rext/2, boxH-10-rlen-lockgap, topH+lockgap])
		rotate([90,0,0])
			difference() {
				cylinder(rlen,rext/2,rext/2, $fn=16);
				translate([0,0,-1])
					cylinder(rlen+2,rturn/2,rturn/2, $fn=16);
			}

	difference() {
		minkowski() {
			cube([boxW,boxH,15]);
			sphere(2, $fn=16);
		}
		// supprimer l'arrondi inferieur15
		translate([-10,-10,topH])
			cube([boxW+20,boxH+20,30]);
		// trou
		translate([0,0,0])
			cube([boxW, boxH, 30]);
		// trou rotule
		translate([boxW+rext/2-lockgap, 10-lockgap, topH-lockgap])
			rotate([-90,0,0])
				cylinder(rlen+lockgap*2,rext/2,rext/2, $fn=16);
		translate([boxW+rext/2-lockgap, boxH-10+lockgap, topH-lockgap])
			rotate([90,0,0])
				cylinder(rlen+lockgap*2,rext/2,rext/2, $fn=16);
				
	}
} //*/

translate ([boxW+20,0,0]) {
	// rotule
	translate([-rext/2, 10, bottomH+lockgap])
		rotate([-90,0,0])
			difference() {
				cylinder(rlen,rext/2,rext/2, $fn=16);
				translate([0,0,-1])
					cylinder(rlen+2,rlock/2,rlock/2, $fn=16);
			}
	translate([-rext/2, boxH-10, bottomH+lockgap])
		rotate([90,0,0])
			difference() {
				cylinder(rlen,rext/2,rext/2, $fn=16);
				translate([0,0,-1])
					cylinder(rlen+2,rlock/2,rlock/2, $fn=16);
			}

	difference() {
		minkowski() {
			cube([boxW,boxH,15]);
			sphere(2, $fn=16);
		}
		// supprimer l'arrondi superieur
		translate([-10,-10,bottomH])
			cube([boxW+20,boxH+20,30]);
		// trou
		cube([boxW, boxH, 30]);
		// trou rotule
		translate([-rext/2+lockgap, rlen+ 10, topH-lockgap])
			rotate([-90,0,0])
				cylinder(rlen+lockgap*2,rext/2,rext/2, $fn=16);
		translate([-rext/2+lockgap, boxH-10 -rlen, topH-lockgap])
			rotate([90,0,0])
				cylinder(rlen+lockgap*2,rext/2,rext/2, $fn=16);
	}
}//*/