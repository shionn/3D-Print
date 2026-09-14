
barre_w = 10;
barre_p = 3;

espace = 2;

p = barre_p*5+espace*4;

card();

module card() {
	color("gray")
		minkowski() {
			cube([barre_w*3+espace*8,p*2+espace*7,1]);
			cylinder(1,espace, espace, $fn=32, center=false);
		}
	for (y = [0:1])
		for(x = [0:2]) {
			translate([espace*x*3+barre_w*x+espace,espace*y*4+p*y+espace, 1])
				batterie((1-y)*3+x);
		}
}


/*
translate([0,-40,0])
	for(i = [0:5])
		translate([barre_w*2*i, 0,0])
			batterie(i);
//*/


module batterie(count) {
	minkowski() {
		cube([barre_w,p,1]);
		cylinder(1,espace, espace, $fn=32, center=false);
	}

	translate([barre_w/2,p+espace,1])
		cube([5,4,2], center=true);

	if (count>=1) 
		color("red") 
			for (i= [0:count-1]) 
				translate([0,i*barre_p+i*espace,2])
					cube([barre_w, barre_p,1]);
}