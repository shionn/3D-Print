

boxW = 150;
boxH = 210;
bookW = 126;
bookH = 179;

topH = 18/2;
bottomH = 18/2;

rext = 6;
rlock = 2.1;
rturn = 2.2;
lockgap = .2;
rlen = 20;

magnet_hole = 2.5+.1;


// 2.3 / 6 glisse bien
// 2.2 / 6 glisse bien
// 2.0 / 6 rentre en force
// 2.1 /4 rentre en force parfois
//r = 2.2; re = 6;

/*translate ([-20,0,0])
difference() {
	cylinder(20,re/2,re/2, $fn=16);
	translate([0,0,-1])
		cylinder(32,r/2,r/2, $fn=16);
} //*/

/*translate ([20,0,0]) {
	
	// rotule
	translate([boxW+rext/2, 10+rlen+lockgap, topH+lockgap ])
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
	// magnet
	translate([magnet_hole+.01,magnet_hole+.01,0]) 
		difference() {
			cylinder(topH, magnet_hole+2, magnet_hole+2, $fn=16);
			translate([0,0,topH-2-.1])
				cylinder(topH+1, magnet_hole, magnet_hole,  $fn=16);
		}
	translate([magnet_hole+.01,boxH- magnet_hole-.01,0]) 
		difference() {
			cylinder(topH, magnet_hole+2, magnet_hole+2, $fn=16);
			translate([0,0,topH-2-.1])
				cylinder(topH+1, magnet_hole, magnet_hole,  $fn=16);
		}

	difference() {
		minkowski() {
			cube([boxW,boxH,15]);
			sphere(2, $fn=32);
		}
		// supprimer l'arrondi inferieur15
		translate([-10,-10,topH])
			cube([boxW+20,boxH+20,30]);
		// trou livre
		translate([boxW-bookW-1,0,0])
			cube([bookW, bookH, 30]);
		// trou des
		translate([boxW-bookW-1,bookH+2,0]) {
			w = (bookW-2)/2;
			h = boxH - bookH - 2;
			cube([w, h, 30]);
			translate([w+2,0,0])
				cube([w, h, 30]);
		}
		// trou crayon
		translate([0, 0,0]) 
			cube([boxW-2-bookW-1, boxH, 30]);
		// trou rotule
		translate([boxW+rext/2-lockgap, 10-lockgap, topH-lockgap])
			rotate([-90,0,0])
				cylinder(rlen+lockgap*2,rext/2,rext/2, $fn=16);
		translate([boxW+rext/2-lockgap, boxH-10+lockgap, topH-lockgap])
			rotate([90,0,0])
				cylinder(rlen+lockgap*2,rext/2,rext/2, $fn=16);
		
		
		//dessin
		color("red")
		translate([boxW/2,boxH,-1.95])
			rotate([0,180,0]) 
				linear_extrude(1) {
					translate([0,-20,0])
						text("Un livre dont", 8.5, "DejaVu Sans:style=Condensed Bold", halign="center");
					translate([0,-42,0])
						text("VOUS", 20, "DejaVu Sans:style=Condensed Bold", halign="center");
					translate([0,-66,0])
						text("êtes", 20, "DejaVu Sans:style=Condensed Bold", halign="center");
					translate([-55,-95,0])
						text("le", 8.5, "DejaVu Sans:style=Condensed Bold", halign="center");
					translate([0,-95,0])
						text("HÉROS", 20, "DejaVu Sans:style=Condensed Bold", halign="center");
					translate([0,-150,0])
						scale(.25)
							import("dice.svg", center=true);
				}
			
	}
} //*/

/*translate ([200,0,0]) {
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

	// magnet
	translate([boxW-magnet_hole-.01,magnet_hole+.01,0]) 
		difference() {
			cylinder(topH, magnet_hole+2, magnet_hole+2, $fn=16);
			translate([0,0,topH-2-.1])
				cylinder(topH+1, magnet_hole, magnet_hole,  $fn=16);
		}
	translate([boxW-magnet_hole-.01, boxH-magnet_hole-.01,0]) 
		difference() {
			cylinder(topH, magnet_hole+2, magnet_hole+2, $fn=16);
			translate([0,0,topH-2-.1])
				cylinder(topH+1, magnet_hole, magnet_hole,  $fn=16);
		}

	difference() {
		minkowski() {
			cube([boxW,boxH,15]);
			sphere(2, $fn=32);
		}
		// supprimer l'arrondi superieur
		translate([-10,-10,bottomH])
			cube([boxW+20,boxH+20,30]);
		// trou livre
		translate([1,0,0])
			cube([bookW, bookH, 30]);
		// trou des
		translate([1,bookH+2,0]) {
			w = (bookW-2)/2;
			h = boxH - bookH - 2;
			cube([w, h, 30]);
			translate([w+2,0,0])
				cube([w, h, 30]);
		}
		// trou crayon
		translate([bookW+2+1, 0,0]) 
			cube([boxW-2-bookW-1, boxH, 30]);
		// trou rotule
		translate([-rext/2+lockgap, rlen+ 10, topH-lockgap])
			rotate([-90,0,0])
				cylinder(rlen+lockgap*2,rext/2,rext/2, $fn=16);
		translate([-rext/2+lockgap, boxH-10 -rlen, topH-lockgap])
			rotate([90,0,0])
				cylinder(rlen+lockgap*2,rext/2,rext/2, $fn=16);
	}
}//*/

translate([-20-bookW,0,0]) {
	difference() {
		cube([bookW, bookH, 1]);
		
		hletter = 12;
		wtop = (bookW-2*4)/3;
		htop = 50;
		for (i = [0:2]) {
			translate([i*wtop+i*2+2,bookH-htop-hletter,-1])
				cube([wtop,htop,3]);
		}
		wbot = (bookW-2*3)/2;
		hbotl =bookH-htop-hletter*2-2;
		translate([2,2,-1])
			cube([wbot, hbotl,3]); 
		hbotr = (bookH-htop-hletter*4-2)/3;
		for (i = [0:2]) {
			translate([wbot+2*2, i*hbotr+hletter*i+2,-1])
				cube([wbot,hbotr,3]);
		}
		
		fsize= hletter-5;
		translate([0,0,1-.05]) {
			linear_extrude(1) {
				translate([wtop/2+2,bookH-hletter/2,0])
					text("Habi.",fsize,"DejaVu Sans:style=Condensed Bold",halign="center", valign="center");
				translate([wtop*3/2+2*2,bookH-hletter/2,0])
					text("Endu.",fsize,"DejaVu Sans:style=Condensed Bold",halign="center", valign="center");
				translate([wtop*5/2+2*3,bookH-hletter/2,0])
					text("Chance",fsize,"DejaVu Sans:style=Condensed Bold",halign="center", valign="center");
				translate([wbot/2+2,hbotl+hletter/2+2,0])
					text("Equip.",fsize,"DejaVu Sans:style=Condensed Bold",halign="center", valign="center");
				translate([wbot*3/2+2*2,hbotr+hletter/2+2,0])
					text("Ration",fsize,"DejaVu Sans:style=Condensed Bold",halign="center", valign="center");
				translate([wbot*3/2+2*2,hbotr*2+hletter*3/2+2,0])
					text("Potion",fsize,"DejaVu Sans:style=Condensed Bold",halign="center", valign="center");
				translate([wbot*3/2+2*2,hbotr*3+hletter*5/2+2,0])
					text("Or",fsize,"DejaVu Sans:style=Condensed Bold",halign="center", valign="center");
			}
		}
	}
	
}