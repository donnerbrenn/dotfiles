
=LET(
 tabs; A:A;
expression; "(?i)(Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d{2,4}";
FILTER(tabs;REGEXMATCH(tabs;expression)))

