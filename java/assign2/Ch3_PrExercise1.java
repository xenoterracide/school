/**************************************************************
 * *** Date: 10/22/2008
 * *** Name: Caleb Cushing
 * *** Purpose:
 * **************************************************************/

import java.util.*;
import java.io.*;

public class Ch3_PrExercise1
{
	public static void main(String[] args)
		throws FileNotFoundException
	{
		Scanner inFile =
			new Scanner(new FileReader("inData.txt"));
		PrintWriter outFile =
			new PrintWriter("outData.dat");

		int num1, num2, num3, num4, sum, prod;
		String str1;
		char char1, char2;

	/* num1 is the first integer to be added num2 is the second, etc */
		num1  = inFile.nextInt();
		num2  = inFile.nextInt();
		str1 = inFile.next();
		num3 = inFile.nextInt();
		num4 = inFile.nextInt();

		sum   = num1 + num2;
		prod  = num3 * num4;

		/* this ugly little piece of code finds our single character in the 
		 * string and makes it a char. then we cast it to an int add 1 to find 
		 * the next ascii code and convert back to a char */
		char1 = str1.charAt(0);
		char2 = (char)((int)char1 + 1);


		outFile.println("The num of " + num1 + " and " + num2 +" = " + sum +".");
		outFile.println("The character that comes after " + char1 +
			" in the Unicode set is " + char2 + ".");
		outFile.println("The numuct of" + num3 + " and " + num4 +" = " + prod +".");

		inFile.close();
		outFile.close();
	}
}
