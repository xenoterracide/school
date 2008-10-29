/**************************************************************
 * *** Date: Wed Oct 29 01:32:12 EDT 2008
 * *** Name: Caleb Cushing
 * *** Purpose: allow users to enter 1-4 or a-e
 * **************************************************************/

import java.util.*;

public class a3
{
	static Scanner console = new Scanner(System.in);

	public static void main(String[] args)
	{

		String input;
		char char1;

		System.out.println("enter a number between 1-4 OR the letters a-e: ");
		input = console.next();
		
		char1 = input.charAt(0);

		switch(char1)
		{
		case '1':
		case '2':
		case '3':
		case '4':
		case 'a':
		case 'b':
		case 'c':
		case 'd':
		case 'e': 
			System.out.println("Congratulations you entered: " + input);
			break;
		default:
			System.out.println(
				"Sorry you entered an invalid character: " + input);
			break;
		}
	}
}
