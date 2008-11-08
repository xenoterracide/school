/**************************************************************
 * *** Date: Sat Nov  8 14:33:02 EST 2008
 * *** Name: Caleb Cushing
 * *** Purpose: convert lower to upper and vice versa
 * **************************************************************/
/*
 * This file contains modified works -
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import javax.swing.*;
import java.awt.*;

public class pe6 extends JFrame
{
	private JLabel StrInL, StrOutL;
	private JTextField UserInputR, SwappedCaseR;

    public static String swapCase(String str) {
        int strLen;
        if (str == null || (strLen = str.length()) == 0) {
            return str;
        }
        StringBuffer buffer = new StringBuffer(strLen);

        boolean whitespace = true;
        char ch = 0;
        char tmp = 0;

        for (int i = 0; i < strLen; i++) {
            ch = str.charAt(i);
            if (Character.isUpperCase(ch)) {
                tmp = Character.toLowerCase(ch);
            } else if (Character.isTitleCase(ch)) {
                tmp = Character.toLowerCase(ch);
            } else if (Character.isLowerCase(ch)) {
                if (whitespace) {
                    tmp = Character.toTitleCase(ch);
                } else {
                    tmp = Character.toUpperCase(ch);
                }
            } else {
                tmp = ch;
            }
            buffer.append(tmp);
            whitespace = Character.isWhitespace(ch);
        }
        return buffer.toString();
    }
	public pe6()
	{
		setTitle("swapCase");

		StrInL  = new JLabel("enter string: ", SwingConstants.LEFT);
		StrOutL = new JLabel("converted string: ", SwingConstants.LEFT);
		
		UserInputR   = new JTextField(10);
		SwappedCaseR = new JTextField(10);

		Container pane = getContentPane();
		pane.setLayout(new GridLayout(2, 1));

		pane.add(StrInL);
		pane.add(UserInputR);
		pane.add(StrOutL);
		pane.add(SwappedCaseR);

		setSize(400, 100);
		setVisible(true);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
	}
	public static void main(String[] args)
	{
		pe6 gui = new pe6();
	}
}
