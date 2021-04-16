// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CalculateAcceleration(velocityStart, velocityFinish, deltaSeconds){
	var a = (velocityFinish - velocityStart) / deltaSeconds;
	return a;
}
function TimeToVelocity(velocityInitial, velocityFinal, acceleration)
{
	var dVel = velocityFinal - velocityInitial; 
	var time = dVel / acceleration;
	return time;
}

function DistanceToVelocityGivenTime(velocityInitial, velocityFinal, time)
{
	var vAvg = (velocityInitial + velocityFinal) / 2;
	var dist = vAvg * time;
	return dist;
}

function DistanceToVelocityGivenAcceleration(velocityInitial, velocityFinal, acceleration)
{
	var vAvg = (velocityInitial + velocityFinal) / 2;
	var time = TimeToVelocity(velocityInitial, velocityFinal, acceleration);
	var dist = vAvg * time;
	return dist;
}