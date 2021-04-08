// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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
			
			if(string_length(subStr) > 0)
			{
				//add substring to list
				arr[arrIndex] = subStr;
				arrIndex++;
				//clear substring
				subStr = "";
			}
		}
	}
		if(string_length(subStr) > 0)
		{
			arr[arrIndex] = subStr;
		}
	return arr;
}

