/*
 * Copyright 2007-2009 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.assetloader.parsers {

/**
 * {@code MultilineString} allows to access all lines of a string seperatly.
 *
 * <p>To not have to deal with different forms of line breaks (Windows/Apple/Unix)
 * {@code MultilineString} automatically standarizes them to the {@code \n} character.
 * So the passed-in {@code string} will always get standardized.
 *
 * <p>If you need to access the orignal {@code string} you can use
 * {@code getOriginalString}.
 *
 * @author Martin Heidegger, Christophe Herreman
 * @version 1.0
 */
internal class MultilineString {

    /** Character code for the WINDOWS line break. */
    private static const WIN_BREAK:String = String.fromCharCode(13) + String.fromCharCode(10);

    /** Character code for the APPLE line break. */
    private static const MAC_BREAK:String = String.fromCharCode(13);

    /** Original content without standardized line breaks. */
    private var _original:String;

    /** Separation of all lines for the string. */
    private var _lines:Array;

    /**
     * Constructs a new MultilineString.
     */
    public function MultilineString(string:String) {
        _original = string;
        _lines = string.split(WIN_BREAK).join("\n").split(MAC_BREAK).join("\n").split("\n");
    }

    /**
     * Returns the original used string (without line break standarisation).
     *
     * @return the original used string
     */
    public function get originalString():String {
        return _original;
    }

    /**
     * Returns a specific line within the {@code MultilineString}.
     *
     * <p>It will return {@code undefined} if the line does not exist.
     *
     * <p>The line does not contain the line break.
     *
     * <p>The counting of lines startes with {@code 0}.
     *
     * @param line number of the line to get the content of
     * @return content of the line
     */
    public function getLine(line:uint):String {
        return _lines[line];
    }

    /**
     * Returns the content as array that contains each line.
     *
     * @return content split into lines
     */
    public function get lines():Array {
        return _lines.concat();
    }

    /**
     * Returns the amount of lines in the content.
     *
     * @return amount of lines within the content
     */
    public function get numLines():uint {
        return _lines.length;
    }

}
}