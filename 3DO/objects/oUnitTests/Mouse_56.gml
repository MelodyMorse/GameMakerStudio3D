if (upButtonPressed)
{
	scrollStartIndex--;
	if (scrollStartIndex < 0)
		scrollStartIndex = 0;

	upButtonPressed = false;
}

if (downButtonPressed)
{
	scrollStartIndex++;
	if (scrollStartIndex >= testResultsCount)
		scrollStartIndex = testResultsCount;
	downButtonPressed = false;
}