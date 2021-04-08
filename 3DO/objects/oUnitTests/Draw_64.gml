if (testResultsCount < 1)
	return;

var color = draw_get_color();

// Draw Up Button
draw_set_color(c_white);
draw_button(upButtonX1, upButtonY1, upButtonX2, upButtonY2, !upButtonPressed);
draw_set_color(c_black);
var tx = upTextX;
var ty = upTextY;
if upButtonPressed
{
	tx += 2;
	ty += 2;
}
draw_text_transformed(tx, ty, "Scroll Up", 2, 2 , 0);

// Draw Down Button
draw_set_color(c_white);
draw_button(downButtonX1, downButtonY1, downButtonX2, downButtonY2, !downButtonPressed);
draw_set_color(c_black);
var tx = downTextX;
var ty = downTextY;
if downButtonPressed
{
	tx += 2;
	ty += 2;
}
draw_text_transformed(tx, ty, "Scroll Down", 2, 2 , 0);

// Print results
var outputLine = outputY;
for (var i = scrollStartIndex; i < array_height_2d(testResults); i++)
{
	if (testResults[i,1])
	{
		draw_set_color(c_lime);
		draw_text_transformed(outputX, outputLine, "PASSED: " + testResults[i,0], 2, 2, 0);
	}
	else
	{
		draw_set_color(c_red);
		draw_text_transformed(outputX, outputLine, "FAILED: " + testResults[i,0], 2, 2, 0);
	}
	outputLine += outputLineHeight;
}

// Return original draw color
draw_set_color(color);