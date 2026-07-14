
//l= 805/4 -4;
l = 200;
p = 200;
h = 150;
wall = 2;

hole = 10;

difference() {
	cube([l,p,h]);
	translate([wall,wall,wall]) 
		cube([l-wall*2, p-wall*2,h]);

	for(x=[10:hole+2:l]) 
		for(y=[15:hole+2:h-10]) {
			translate([x,0,y])
				rotate([-90,0,0])
					cylinder(15,hole/2,hole/2,$fn=32,true);
			
		}
}


