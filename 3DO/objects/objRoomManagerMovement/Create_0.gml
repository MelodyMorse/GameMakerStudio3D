//instance_create_layer(0,0,"Instances", ObjPlayer2D);
global.origin = [room_width/2, room_height/2]
global.unit = 64;

p1 = [3, 4];
e1 = [1,2];


player = SpawnObject(p1, ObjPlayer2D);
enemy = SpawnObject(e1, objEnemy2D);

