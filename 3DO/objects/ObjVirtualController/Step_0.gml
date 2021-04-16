if (player != -1 && instructions != -1)
{
	//show_debug_message("virtual controller step");
	if(ds_map_exists(instructions, frame_counter ))
	{
		var presses = ds_map_find_value(instructions, frame_counter);
		
		//for each item in presses
		for (i = 0; i < array_length(presses); i++)
		{
			var strings = SplitString(presses[i], " ")
			var press;
			//parse instruction
			switch (strings[0])
			{
				case "press":
					press = true;
					break;
				case "release":
					press = false;
					break;
			}
			//parse button
			switch(strings[1])
			{
				case "left":
				player.leftPressed = press;
				break;
				case "right":
				player.rightPressed = press;
				break;
				case "up":
				player.upPressed = press;
				break;
				case "down":
				player.downPressed = press;
				break;
			}
		}
	}
	frame_counter++;	
}
