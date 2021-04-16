/// @function SplitString(str, divider)
/// @description takes a string and a character, splits the string into substrings wherever that character occurs in the string, and returns an array of the substrings 
/// @param str String to split
/// @param divider Character that indicates at what place the string will be split 
function SplitString(str, divider){
	
	
	var len = string_length(str);
	
	var subStr = "";
	var arrIndex = 0;
	var arr;
	for (var i = 1; i <= len; i++)
	{
		var char = string_char_at(str, i);
		if (char != divider)
		{
			//add char to substring
			subStr += char;
		}
		else
		{
			//ensure substring is not empty. 
			if(string_length(subStr) > 0)
			{
				//add substring to array
				arr[arrIndex] = subStr;
				arrIndex++;
				//clear substring
				subStr = "";
			}
		}
	}
		//Add final substring to array
		if(string_length(subStr) > 0)
		{
			arr[arrIndex] = subStr;
		}
	return arr;
}

