
x = 115;
y = 42;
z = 13;
e = 2;
b = 5;

points = [
	[0,0,0],
	[x,0,0],
	[x,y,0],
	[0,y,0],
	[0-5,0-5,z],
	[x+5,0-5,z],
	[x+5,y+5,z],
	[0-5,y+5,z]
];

points2 = [
	[0-e,0-e,0-e],
	[x+e,0-e,0-e],
	[x+e,y+e,0-e],
	[0-e,y+e,0-e],
	[0-5-e,0-5-e,z-e],
	[x+5+e,0-5-e,z-e],
	[x+5+e,y+5+e,z-e],
	[0-5-e,y+5+e,z-e]
];

polygons = [
	[0,3,2,1],
	[4,5,6,7],
	[0,1,5,4],
	[1,2,6,5],
	[2,3,7,6],
	[3,0,4,7]
];
difference() {
	polyhedron(points2, polygons);
	polyhedron(points, polygons);
}
