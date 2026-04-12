
count = 6;

l=60;
p=40;

wall=2;

difference() {
	cube([l+wall*2,p*count+wall*count+wall,120]);
	for (y=[0:count-1]) 
		translate([wall, wall+wall*y+ p*y, wall])
			cube([l,p,120]);
	
}