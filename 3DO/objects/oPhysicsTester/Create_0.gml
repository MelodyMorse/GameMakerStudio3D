var testName = "Calculate Acceleration 1"
var expected = 20;
var msg = "not run";
var col = c_black;

//set up

//test
var result = CalculateAcceleration(0, 60, 3);

if (expected == result)
{
	col = c_green;
	msg = "test passed"
}
else if (expected != result)
{
	col = c_red;
	msg = "test failed"
}
show_debug_message("Test: " + testName + ". expected: " + string(expected) + " result: " + string(result) + ". " + msg);