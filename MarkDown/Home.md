# Markdown References

- [GitHub Guide Mastering Markdown](https://guides.github.com/features/mastering-markdown/)
- [Git Hub Help](https://help.github.com/categories/writing-on-github/)
- [Markdown Cheatsheet - adam-p@GitHub](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- [Élaboration et conversion de documents avec Markdown et Pandoc](http://enacit1.epfl.ch/markdown-pandoc/)
- [CommonMark : A strongly defined, highly compatible specification of Markdown](http://commonmark.org/help/)
- [Syntax Highlighting in Code Chunks](https://support.codebasehq.com/articles/tips-tricks/syntax-highlighting-in-markdown)
  bat (.bat, .cmd), splus (.S, .R), sql (.sql), python (.py, .pyw, ), xml, html, bash(.sh,.ksh,.bash,.ebuild,.eclass)
  , console (*.sh-session)
- https://en.support.wordpress.com/markdown-quick-reference/
- http://daringfireball.net/projects/markdown/basics
- https://gist.github.com/jonschlinkert/5854601


- HTML entities and symbols (works in markdown)
   - Greek Symbol (Html) : &Delta;, &beta; &alpha; &rArr; &hearts; &rarr; &rArr; &ne; &infin; &hArr; &sigma;

   `&Delta;, &beta; &alpha; &rArr; &hearts; &rarr; 	&rArr; &ne; &infin; &hArr; &sigma;`
   - https://www.w3schools.com/html/html_entities.asp
   - https://www.w3schools.com/html/html_symbols.asp
   - http://www.htmlhelp.com/reference/html40/entities/symbols.html

# Markdown Reference

Header 1
=========

Header 2
--------------

### Header 3
#### Header 4

## Emphasis
- _emphasis_ aka *italic* : `*italic* _italic_`
- Strong emphasis aka **bold** : `**bold**  __bold__`
- Combined **_italic & bold_** : `**_italic & bold_** `
- Strike through ~~Scratch this.~~ : `~~Scratch this.~~`

## Lines
___

`___, ---, ***`: three consecutive underscores, dashes or asterisks

## Lists
`-`, `*`, `1`

 * list 1
 * list 2
 * list 3

## Links
```
[link text](>URL>)
[link text][1]
[1]: <URL>
```
[TablesGenerator](http://www.tablesgenerator.com/markdown_tables)

[W3C][1]

[1]: https://www.w3schools.com/

## images
```
![alt text]([path to image])
```

![R Project](https://www.r-project.org/Rlogo.png)

Markdown Syntax Working on GitHub wiki
[[[https://jupyter.org/assets/main-logo.svg|alt="Jupyter logo"|height=150px|width=150px]]](https://jupyter.org)

### Using html
```html
<img src="smiley.gif" alt="Smiley face" height="42" width="42">
```

<p align="center">
  <img src="https://assets-cdn.github.com/images/modules/logos_page/Octocat.png" width="256" title="Github Logo">
</p>


## videos

<a href="http://www.youtube.com/watch?feature=player_embedded&v=Fs3PQTd-obA
" target="_blank"><img src="http://img.youtube.com/vi/Fs3PQTd-obA/0.jpg"
alt="Cap Sud Ouest Vallée d'Ossau - sur la route des lacs" width="240" height="180" border="10" /></a>

## emojis
@me :+1: This PR looks great - it's ready to merge! :shipit:
:kissing: :laughing: :neutral_face:

## Code and Syntax highlighting
The great thing about R Markdown is that we can embed R code within our markdown document. We embed
R using three tick marks and the letter r in curly braces:
```{r}
[R code]
```

inline code `r`

```js
javascript
```
supported language in codebase :
python
splus
sql
bat
bash
css

## Tables
Tables aren't part of the core Markdown spec, but they are part of GFM (GitHub Markdown) and Markdown Here supports them.

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3

## Tasks lists
- [ ] this is a complete item
- [x] this is an incomplete item



## Markdown Editors
- Markdown
- Pad 2
- MarkPad http://code52.org/DownmarkerWPF/
- https://superuser.com/questions/586177/how-to-use-markdown-in-notepad
- [Markdown Syntax Highlighting for Notepad++](https://github.com/Edditoria/markdown-plus-plus)
- [MarkdownViewerPlusPlus for Notepad++(https://github.com/nea/MarkdownViewerPlusPlus)
- [Atom - markdown-preview-plus](https://atom.io/packages/markdown-preview-plus)
- [Stackedit : In browser Markdown Editor](https://stackedit.io/)
- [Online Markdown Editor](http://dillinger.io/)


## Math Laxtex / MathML / Mathjax
   - http://www.sciweavers.org/free-online-latex-equation-editor
   - http://csrgxtu.github.io/2015/03/20/Writing-Mathematic-Fomulars-in-Markdown/
   - http://docs.mathjax.org/en/latest/tex.html#automatic-equation-numbering
   - https://www.codecogs.com/latex/eqneditor.php
   - MathML https://www.w3.org/Math/
   - MathJax https://www.mathjax.org/
