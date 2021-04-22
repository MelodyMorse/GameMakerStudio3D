var sPos = WorldToScreenVector(pos);
x = sPos[0];
y = sPos[1];
var mosPos = ScreenToWorldVector([mouse_x, mouse_y])
lookVector = VectorFromTo(pos, mosPos );
lookNormal = NormalizedVector(lookVector);