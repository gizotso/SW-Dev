# Regular expressions in Oracle SQL

- `REGEXP_SUBSTR(s1, pattern1 <, p1> <, n1>  <, m1>)`
   - p1, n1 : num, default to 1. 
   - m1 : one or more of the match parameter text literals
   - Searches within s1 for any string that matches the pattern defined in pattern1. Start looking at position p1 in the string. Looks for the n1’th occurrence of the pattern. 
   - Output : char string representing the matched pattern found within s1 that matched pattern1.
- `REGEXP_INSTR(s1, pattern1 <, p1> <, n1>  <,opt1> <, m1>))`
   - opt1 : num (0 (default) or 1) 
   - Output : num value representing the location of the pattern within the source string. If opt1=1, then it returns the location of the 1st position after the pattern.
- `REGEXP_REPLACE (s1, pattern1 <,rep1>  <, p1> <, o1>  <, m1>)`
   - rep1 : string, default to null. 
   - o1 : num, default to 0.
   - Replaces o1 occurrences of pattern1 within s1 with rep1 starting at position p1 within s1.
- `REGEXP_LIKE (s1, pattern1 <, m1>)`
   - Compares the pattern represented in pattern1 with the string in s1 and determines if there a match. 
   - Output : Boolean. True if the pattern finds a match, false if it does not. (Note : does not use the wildcard operator that LIKE uses)

Regular expression functions/condition perform the match in accordance with the instructions specified by match parameter text literal(s) specified in m1.

match parameter
- `'i'` : case insensitive matching, `'c'` case sensitive  matching
- `'n'` : allows the any-character pattern (.) to match the newline character
- `'m'` : treats the source string as multiple lines. Oracle interprets ^ and $ as the start and end, respectively, of any line anywhere in the source string, rather than only at the start or end of the entire source string. If you omit this parameter, Oracle treats the source string as a single line.
Any occurences of the anchor characters (^and $) are assumed to be the start and the end of lines within the string. Without it, the source char string is assumed to be one line of text.
- 'x' : Ignores whitespace characters.

## POSIX Character Class

| POSIX Character class | … character                                   | Char ranges  |
|-----------------------|-----------------------------------------------|--------------|
| [:alnum:]             | Alphanum                                      |              |
| [:alpha:]             | Alphabetic                                    |              |
| [:space:]             |                                               |              |
| [:blank:]             | Blank space                                   |              |
| [:cntrl:]             | Control (non-printing)                        |              |
| [:digit:]             | Numeric                                       | [0-9], [1-9] |
| [:graph:]             | [:punct:] + [:upper:] + [:lower:] + [:digit:] |              |
| [:lower:]             | Uppercase alphabetic                          | [A-Z]        |
| [:print:]             | Lowercase alphabetic                          | [a-z]        |
| [:print:]             | Printable                                     |              |
| [:punct:]             | Punctuation                                   |              |
| [:xdigit:]            | Valid hexdecimal                              |              |

## REGEXP_SUBSTR Examples
```sql
-- 2nd lowercase letter : 'n'
SELECT regexp_substr('Winter is Coming  !', '[a-z]', 1, 2) FROM dual;

-- 2nd number (multiple digits)
SELECT REGEXP_SUBSTR ('2, 51, and 10 are numbers in this example', '\d+', 2) FROM dual;

-- 2nd word : 'is'
SELECT regexp_substr('Winter is Coming  !', '[[:alpha:]]+', 1, 2) FROM dual;

-- 3rd word and following space : 'Coming '
SELECT REGEXP_SUBSTR ('Winter is Coming !', '(\S*)(\s)', 1, 3) FROM dual;
-- extract all non-whitespace characters as specified by (\S*) and then the first whitespace character as specified by (\s)
-- \S: matches a non-whitespace character.
-- \s: Matches a whitespace character.

-- 2nd value of a delimited list (2nd occurrence of a string that doesn’t have a ';' included)
SELECT REGEXP_SUBSTR('2012/03/11;Jean;Green', '[^;]+', 1, 2) FROM dual;
```

```sql
-- extract enclosed in parentheses () one or more digits with an optional preceeding '+'
SELECT REGEXP_SUBSTR('Help desk: (+33) 0110203040', '\(\+?[[:digit:]]+\)') FROM dual;
```

```sql
SELECT regexp_substr('un, dos, tres','[^,]+',1,level) regexp_substr
FROM dual
  CONNECT BY level<=regexp_count('un, dos, tres', ',')+1;
```


## REGEXP_REPLACE Examples
```sql
-- replace multiple symbols by one char
SELECT REGEXP_REPLACE('Chapter1 ................. Introduction to SQL', '[.]+', '-') TOC from dual
```

```sql
-- add single quotes to each matched delimited pattern
SELECT REGEXP_REPLACE('titi,toto,tata', '([^,]+)', '''\1''')
from dual;
-- > 'titi','toto','tata'
```

```sql
-- match (word)_(word)_(number) and re-order matched sub-expressions							 
SELECT REGEXP_REPLACE('fopa_acpa_1' ,'([[:alnum:]]+)_([[:alnum:]]+)_([[:digit:]]+)'
                       ,'\2-\1') regexp from dual;
-- > acpa-fopa
-- match 2nd pattern (word delimited by '_')
SELECT REGEXP_SUBSTR('fopa_acpa_1' ,'[^_]+', 1, 2) from dual;  
```sql

```sql
-- change delimiter
SELECT regexp_replace('un,deux,trois', '(,|$)', '&') from dual;
-- > un&deux&trois& 
```

```sql
-- remove unnecessary multiple blank spaces
SELECT REGEXP_REPLACE('FBI    935 Pennsylvania Avenue, NW   Washington, D.C.',
                     '( ){2,}', ' ') "adress"
FROM DUAL;
```

```sql
-- Check number (value string 1024char)
REGEXP_LIKE(value, '^-?\d+(\.\d+)?$', '')
```

```sql
--add spaces btw each char  
SELECT REGEXP_REPLACE('France', '(.)', '\1 ') "REGEXP_REPLACE" FROM dual;
-- > F r a n c e 
```

```
WITH my_str AS (SELECT 
   '#ARCHIVED: 2016/12/20;#REASON:TICKET 001067; #SRC_PATH:/Dossiers utilisateur/TOTO/' t
FROM dual)
SELECT
-- avec regexp_replace
 regexp_replace(t, '#ARCHIVED:\s?([^;]+).*','\1') archived
,regexp_replace(t, '.*#REASON:([^;]+).*'  ,'\1') reason
,regexp_replace(t, '.*#SRC_PATH:([^;]+).*'  ,'\1') src_path
-- avec regexp_substr
,substr(regexp_substr(t, '[^;]+',1, 1), 11) archived2
 ,  regexp_substr(t, '[^;]+',1, 2) reason2
 ,  regexp_substr(t, '[^;]+',1, 3) src_path2
FROM my_str
;
```

### select multiple sub expressions
```sql
WITH ddl_prod AS(
SELECT '
  CREATE TABLE "PRODUCT" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"CODE" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"CREATION_DATE" DATE, 
	"COLOR" VARCHAR2(20 CHAR), 
	"WEIGHT" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  TABLESPACE "TABBIG" ;' ddl_prod
  FROM dual)
SELECT regexp_replace( ddl_prod, '(.*\) ).*' , '\1', 1, 0, 'n') ddl_1
,      regexp_replace( ddl_prod, '(.*\) ).*(TABLESPACE.*;)' , '\2', 1, 0, 'n') ddl_2
,      regexp_replace( ddl_prod, '(.*\) ).*(TABLESPACE.*;)' , '\1\2', 1, 0, 'n') ddl_2
FROM ddl_mat;
-- ddl_1: CREATE TABLE "PRODUCT (...)
-- ddl_2: TABLESPACE "TABBIG" ;
```

```sql
WITH ddl_mat_view AS(
SELECT '
    CREATE MATERIALIZED VIEW "PDWH"."VIEW_PRODUCT" ("PRODUCT_NAME", "NAME", "DESCRIPTION", "STATUS")
  ORGANIZATION HEAP PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT)
  TABLESPACE "TABSPE" 
  BUILD IMMEDIATE
  USING INDEX 
  REFRESH FORCE ON DEMAND
  USING DEFAULT LOCAL ROLLBACK SEGMENT
  DISABLE QUERY REWRITE
  AS (
SELECT
   p.ID as PRODUCT_ID,
   p.name as PRODUCT_NAME,
   p.LIBELLE as DESCRIPTION,
   p.STATUS,
FROM PRODUCT p
LEFT JOIN GHS_TMD_DATA tmd ON m.id = tmd.mat_id
WHERE p.TYPE=''ALLOWED''
)
 ' ddl_mat_view
  FROM dual)
SELECT 
 regexp_substr(ddl_mat_view,'CREATE MATERIALIZED VIEW[^\)]+\)') ddl_line1
,regexp_substr(ddl_mat_view ,'TABLESPACE \S\w+\S') ddl_tabspace -- TABLESPACE "TABSPE"
,regexp_substr(ddl_mat_view ,'TABLESPACE "\w+"') ddl_tabspace2 -- TABLESPACE "TABSPE"
,regexp_replace(ddl_mat_view,'.*(TABLESPACE \S?\w+\S?).*' ,'\1', 1,1,'n') ddl_tabspace3
,regexp_replace(ddl_mat_view,'\s*(CREATE MATERIALIZED VIEW[^\)]+\)).*(TABLESPACE \S\w+\S).*( AS \([^\)]+\))\s*' ,'\1 \2 \3', 1, 1, 'n') ddl_view_mat
FROM ddl_mat_view;
-- CREATE MATERIALIZED VIEW ... ("..", "..", ..., "..")
-- TABLESPACE "TABSPE"
-- AS ( ... )
```

## REGEXP_LIKE Examples
```sql
REGEXP_LIKE(email, '^([[:alnum:]]+)@[[:alnum:]]+.(com|net|org|edu|gov)$
```

# References
- Doc Oracle
   - https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions131.htm
- http://psoug.org/snippet/Regular-Expressions--Regexp-Cheat-Sheet_856.htm
- http://www.dba-oracle.com/t_regexp_replace.htm
- [regexp_replace() on Oracle doc](https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions130.htm)
- TechOntheNet
   - https://www.techonthenet.com/oracle/functions/regexp_substr.php
   - https://www.techonthenet.com/oracle/functions/regexp_replace.php
- http://www.dba-oracle.com/t_regular_expressions.htm