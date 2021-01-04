
# Tools
- ScreenShot Tool : **GreenShot**, LightScrenn (PortableApps), Wisdom-soft ScreenHunter, GadWin PrintScreen, 
- Color picker http://www.picpick.org/en/
- Win Merge
   - plugins : 7-zip plugin (2010-10-28) Dllbuild0028, xdocplugin : compare excel, word, power-point and some more files (v1.0.6.d tested against WinMerge 2.8.6)
- Beyond Compare
- Diffpdf Portable
- IcoFX (PortableApps)
- MacroCreator (PortableApps) : automate repetitive tasks

# File Explorer
- [FreeCommander](http://freecommander.com/fr/description/). Existe en PortableApps
- QDir, Explorer++, Xplorer2, Better Explorer
- Windows Explorer : `C:\Windows\explorer.exe %ActivDir%`

# File Transfer / Sync
- WinSCP
- FileZilla
   - `FileZilla.exe -a %ActivDir%`
- [SyncBack](http://www.syncback.fr/)
- [curl](https://ec.haxx.se/curl/curl-does)
- [wget](https://www.gnu.org/software/wget/)
   - [wget for windows](http://gnuwin32.sourceforge.net/packages/wget.htm)
   - [How to use wget](https://builtvisible.com/download-your-website-with-wget/)

# Decent Console on Windows
- [Cmder](http://cmder.net/) : Portable, Multi-tabs, GIT support (git-for-windows). Derived from ConEmu
- [ConEmu](https://conemu.github.io/) : Windows console emulator.
- [MobaXterm](https://mobaxterm.mobatek.net/): Enhanced terminal for Windows with X11 server, tabbed SSH client, network tools and much more
   - `MobaXterm_Personal_10.2.exe -openfolder %ActivDir%`

# Network
- PuTTY telnet/SSH Client (PortableApps dispo)
   - KiTTY
- [BitWise (SSH client and server for Windows)](https://www.bitvise.com/)
- Microsoft Network Monitor 3
- [WireShark](https://www.wireshark.org/) widely-used network protocol analyzer

# Notepad ++ 
- https://notepad-plus-plus.org/
- [Guide Pratique Npp sur DVP.com](http://nliautaud.developpez.com/tutoriels/web/notepadplusplus-guide-pratique)

## Tips
- https://www.cathrinewilhelmsen.net/2012/05/16/notepad-remove-duplicates-remove-blank-lines-and-sort-data-in-one-operation/
- https://superuser.com/questions/361116/can-i-use-notepad-to-selectivelly-merge-two-text-files

## Run menu (F5) and Shortcuts
- http://docs.notepad-plus-plus.org/index.php/Defining_User_Commands
- shortcuts.xml 
   - `<Command name="Cmder" Ctrl="yes" Alt="no" Shift="no" Key="82">D:\PortableApps\cmder\Cmder.exe /START &quot;$(CURRENT_DIRECTORY)&quot;</Command>`

## Used Defined Languages
http://sourceforge.net/apps/mediawiki/notepad-plus/?title=User_Defined_Language_Files

- JSON
- SPARQL
- Markdown (https://github.com/Edditoria/markdown-plus-plus) : Tested on Notepad++ v7.2.2 windows 10
- SAS

## Plugins
- http://docs.notepad-plus-plus.org/index.php/Plugin_Central

### Best plugins available through Plugin Manager (more plugins on the x86 version)
* Combine [ScoutSoft](http://www.scout-soft.com/combine/)
* Compare -- FAIL Npp6.9.2 > use compare 1.5.6.2 (ComparePlugin.v1.5.6.2.bin.zip [SourceForge](https://sourceforge.net/projects/npp-compare))
   * Compare v2.0 from Plugin Manager [GitHub](GitHub https://github.com/jsleroy/compare-plugin)
* Customize Toolbar [Npp6.9.2 - v4.0] [SourceForge](https://sourceforge.net/projects/npp-customize/files/?source=navbar)
* HTML-tag [Npp6.9.2 - v1.0.0.0 32bit [SourceForge](https://sourceforge.net/projects/npp-plugins/files/HTMLTag/HTMLTag%20plugin%20v1.0.0/) ]
* JSON viewer
* MultiClipboard
* NppExec > (F6) python "$(FULL_CURRENT_PATH)"
* RunMe > Usefull to open a shell or an explorer from current file
* PyNPP
* NppRegExTractor
* Quick color picker+ [Npp6.9.2 - v2.0] [GitHub NppCP](GitHub https://github.com/nulled666/nppqcp/)
* Color Picker (DonRowlett) [SourceForge](https://sourceforge.net/projects/npp-colorpicker/files/?source=navbar)
   * Color Picker Clone : Color Picker -- Easy Color Picker (1.2 Simon Steinberger) -- ColorPicker_bin_1_2.zip  [PixaBay](http://pixabay.com/de/blog/posts/notepad-colorpicker-plugin-25/)
* RegRexPlace
* XML tools
* XpatherizerNPP


### Best plugins to download
* RegEx Helper -- KO on 6.9 - use latest version nppRegEx.dll
* NppHorizontalRuler
* MarkdownViewerPlusPlus [GitHub MarkdownViewer++](https://github.com/nea/MarkdownViewerPlusPlus)

### Default Plugins
* Converter
* MIME Tools
* NppExport
* Plugin Manager - removed from Baseline since >v7.3.3 - available on [GitHub](https://github.com/bruderstein/nppPluginManager/releases)

### Not used anymore
* PythonScript
* NppFTP [v0.26.3 Unicode] [GitHub NppFTP](Unicode GitHub http://ashkulz.github.io/NppFTP)
* DSpellCheck
* LightExplorer
* ? Zend Coding (python)
* ? CSSExplore
* Html Color 1.0.6.80 Campulka Jiri (easy color more global tool)
* TextFX (text manipulation)
* Color picker
   * http://npp.campulka.net/
   * http://pixabay.com/en/blog/posts/notepad-colorpicker-plugin-25/

# IDE
- JetBrains IntelliJ Java IDEs
- Oracle JDeveloper
- NetBeans
- [Atom : A hackable text editor. Git/GitHub tool](https://atom.io/)

# VI
* https://www.cs.colostate.edu/helpdocs/vi.html
* [Learning the VI editor / vi Reference (WikiBooks)](https://en.wikibooks.org/wiki/Learning_the_vi_Editor/vi_Reference)
* https://pangea.stanford.edu/computing/unix/editing/viquickref.pdf
* http://vim.wikia.com/wiki/Vim_Tips_Wiki
* http://free-electrons.com/doc/legacy/command-line/vi_memento.pdf
* http://tnerual.eriogerg.free.fr/vimqrc.html VIM
* [VIM Cheat Sheet for programmers](http://michael.peopleofhonoronly.com/vim/)
* http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html
   * http://www.viemu.com/vi-vim-cheat-sheet.gif


`<esc>` : Escape key
`<enter>` : Enter key or Return key
`<bs>` : BackSpace key
`<del>` : Delete key
`<ctrl>` : Control key
`<sp>` : Space bar

### vi Modes
* command mode :Anything in this mode is interpreted as an editing command. Pressing <esc> terminates a partially executed command.
* input mode : Anytime the commands (aAiIoOcCsSR) under the Text Insertion, Deletion, Change, or Substitute sections are executed, it automatically puts the vi in the input mode. 
Pressing <esc> exits input mode and returns to command mode.

### Entering vi
- `$vi filename`
- `$vi -R filename` read-only mode
- `$view filename` read-only mode
- `$vi -r filename` recover filename
- Entering Command Mode	 `<esc>`
- save `:w` filename

### Ending vi
- `:q` quit, vi may prompt if you need to save
- `:wq` or `:x` or `ZZ` saves ant quit
- `:q!<enter>` quit without saving

### Write
`:w newname <enter>` write to newname

`:[#]w newname <enter>` write from # (line number) to end of buffer into newname

`:w! oldname<enter>` write to oldname

`:[#]w! oldname<enter>` write from # to end of buffer to oldname

`:w<enter>`	write buffer to lastname

### Set
`:set all` show list of parameter options

`:set showmode`	display INSERT MODE in insert mode

`:set noshowmode` turn off INSERT MODE message

`:set number`: display line numbers

`:set nonumber`: turn off line numbers

`:set list`: display line-endings
`:set nolist`

### Search/Replace
`:s/ss/rs` search/replace string on current line (ss=search string, rs = replacement string)

`:[#]s/srch/rplc` search/replace line number #

`:[n,m]s/srch/rplc` search/replace from line n through line m (n = beginning line number, m = ending line number)

`:f` display filename, current line number, etc.

### Cursor Movement
`<cursor move command> # spaces/lines/paragraphs` (# being 1,2,3,...)

`k`	up one line, `j` down one line
`<sp>` or `l` to right one space, `h` to left one space

`<enter>` or `)` to start of next line
`-` or `(` 	to start of previous line

`}` to start of next paragraph
`{`	to start of previous paragraph

`w`	to start of next word
`W`	to next blank delimited word
`b`	to first letter of previous word
`B`	to previous blank delimited word

`H`	to screen top left corner (home)
`M`	to screen middle left
`L`	to screen bottom left corner


### Paging
`<ctrl>D` scroll down half page

`<ctrl>F` page down 21 of 24 lines

`<ctrl>U` scroll up half page

`<ctrl>B` page up 21 of 24 lines

`#G` go to implicit line number

### Text Insertion/Deletion
(Enter Input Mode)
`<esc>`	exit input mode

`i`	to insert text before cursor

`I`	to insert text before first nonblank on the line

`a`	to add text after the cursor

`A`	to add text to the end of the line

`o`	to open a text line below cursor

`O`	to open a text line above cursor

`<del>` or `<bs>` back over text erasing characters

### Copy/Move Text
`yy` yank line (copy to buffer)

`#yy` yank # lines

`P`	put yanked/deleted lines before cursor

`p`	put yanked/deleted lines after cursor

`u`	undo last set of line changes

### Delete
`dd`	delete line and copy to buffer

`#dd`	delete # lines and copy to buffer

`d0` or dw	to start/end of word

`d#w`	to end of #th word

`dB` or `dW`	to start/end of blank delimited word

`d#B`	to start of #th previous blank delimited word

`d(, d)`	to start/end of sentence

`d#(`	to start of #th previous sentence

`d#)`	to end of #th previous sentence

`d{` or `d}`	to start/end of paragraph

`d#{`	to start of #th preceding paragraph

`d#}`	to end of #th paragraph

`dH` or `dL`	through first/last line on screen

`d1G` or `dG`	through start/end of work buffer

### Change
`cc` change current line

`#cc` change # lines starting with current line

`cb` or `cw` to start/end of word

`c#w` to end of #th word

`cB` or `cW` to start/end of blank delimited word

`c#B` to start of #th previous blank delimited word

`c(, c)` to start/end of sentence

`c#(` to start of #th previous sentence

`c#)` to end of #th sentence

`c{` or c}	to start/end of paragraph

`c#{` to start of #th preceding paragraph

`c#}` to end of #th paragraph

`<ctrl>L`	redraw screen: replace @ symbols

### Search/Find
`/s<enter>` search forward for sting "s"
`
?s<enter>` search backward for sting "s"
 
`n` move to next occurrence of search string), `N` in opposite direction
   
`/s1\/s2<enter>` use "\" to quote "/" within a string

`/^s` find next line starting with "s"

`/s$` find next line ending with "s"

`/s1.s2<enter>` find string with any single character at specified point

`/s1cccs2<enter>`	find string with any number of arbitrary characters "c" at the specified point in the string

`/s1\.s2<enter>` use "\" to quote "." within the search string

`/s[^ch1ch2...chn]`	find next occurrence of string "s" followed by any character other than ch1, ch2, ... chn

`/s[ch1-chn]` find string followed by any character within specified range of characters

