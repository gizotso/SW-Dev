# Regular Expressions Summary

/pattern/ <i (ignore case | g (global) |m (multiline)>

| Pattern       | Description                                                   |
| ------------- |---------------------------------------------------------------|
| .             |Any :  Matches any single character except a newline (\n)      |
| *&hArr;{0, }  |0 or more                                                      |
| +&hArr;{1, }  |1 or more (at least)                                           |
| ?&hArr;{0, 1} |optional (0 or 1 time)                                         |
| \d            |matches a digit </br> \D : non digit &hArr; [^0-9]             |
| \w            |word character &hArr; [a-zA-Z0-9_] </br> \W non word           |
| \b            |word boundary between a word character and a non-word character|
| \s            |Matches a character classified as whitespace &hArr;[ \r\t\n\f] </br> \S non whitespace char  &hArr; /[^ \r\t\n\f]/|
| [abc]         |A character class--matches any one of the 3 characters listed  |
| [^abc]        |Matches a character that is not in the class                   |
| [a-zA-Z]+     |any word made of letters                                       |
| **^**         |starts with                                                    |
| **$**         |ends with                                                      |
| (abc)         | selector : act as memory storing matched pattern in the var $1|


# Examples

| Reg Exp             | Matches                                                                                                |
|---------------------|--------------------------------------------------------------------------------------------------------|
| .*                  | any string                                                                                             |
| [1-9][0-9]{3}       | any integer between 1000 and 9999                                                                      |
| h[1-4]              | h1, h2, h3, h4                                                                                         |
| (c\|s)at            | cat or sat                                                                                             |
| [t\|fr]ed           | ted or fred                                                                                            |
| [t\|f]?ed           | ed, ted or fed                                                                                         |
| go+gle              | gogle , google,gooogle, …                                                                              |
| [abc]{1,3}          | a, b, c, aa, ab, ac, ba, bb, bc, ca, cb, cc, abc, abb, ...                                             \
| a(ab)*b             | strings starting with a "a", followed by any number of ab, ended with a "b" </br> ab, aabb, ababb, ... |
| \s{2,}              | multiple Spaces                                                                                        |
| [\w_]+@\w+.(com\|fr)| Mail allowing a word "@" domain .com or .fr </br> bb_loup@hotmail.fr, toto@yopmail.com, ...            |
| /^.*(log).*$/gm     | Whole line of text that contains log                                                                   |
| .*(\.sql|\.ctl)     | line of text that contains .sql or .ctl                                                                |
| (.*)/.*$            | match rppt and last part of a path : /db/data/scripts/script.sql \1 = /db/data/scripts                 |

Find special chars (é, ...)
[^"'0-9a-zA-Z_.:,;$&#\-\s\t\r\n()<=>?!/*|@+%\[\]]

# References
* Online Tool to learn, build & test Regular Expressions : http://regexr.com
* DebuggEx : https://www.debuggex.com/r/WyytEzoGZRuFKFFQ (JavaScript, Python, PCRE)
* http://www.regular-expressions.info/ 
* Microsoft Ref : https://msdn.microsoft.com/en-us/library/az24scfc.aspx
* http://nliautaud.developpez.com/tutoriels/web/notepadplusplus-guide-pratique/expressions-regulieres/ 
* https://gist.github.com/ramons03/6152802 
* http://www.rexegg.com/
* word boundary : https://stackoverflow.com/questions/7605198/how-does-b-work-when-using-regular-expressions
