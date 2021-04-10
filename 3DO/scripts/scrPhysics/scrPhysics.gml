// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CalculateAcceleration(velocityStart, velocityFinish, deltaSeconds){
	var a = (velocityFinish - velocityStart) / deltaSeconds;
	return a;
}