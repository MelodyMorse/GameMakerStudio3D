// Up Button
upButtonPressed = false;
upButtonWidth = 250;
upButtonHeight = 50;
upButtonX1 = 10;
upButtonY1 = 10;
upButtonX2 = upButtonX1 + upButtonWidth;
upButtonY2 = upButtonY1 + upButtonHeight;
upTextX = upButtonX1 + 5;
upTextY = upButtonY1 + 5;

// Down Button
downButtonPressed = false;
downButtonWidth = 250;
downButtonHeight = 50;
downButtonX1 = 10;
downButtonY1 = upButtonY2 + 10;
downButtonX2 = downButtonX1 + downButtonWidth;
downButtonY2 = downButtonY1 + downButtonHeight;
downTextX = downButtonX1 + 5;
downTextY = downButtonY1 + 5;

// Scrolling info
scrollStartIndex = 0;

outputX = 300;
outputY = 10;
outputLineHeight = 35;

// Test Output Array
// x = description
// y = pass status
testResultsCount = 0;
testResults[0,0] = "";
testResults[0,1] = noone;
