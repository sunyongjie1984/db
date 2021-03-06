CREATE OR REPLACE PACKAGE aa_types
IS
   TYPE boolean_aat IS TABLE OF BOOLEAN
    INDEX BY PLS_INTEGER;
 
   TYPE date_aat IS TABLE OF DATE
    INDEX BY PLS_INTEGER;
 
   TYPE integer_aat IS TABLE OF INTEGER
    INDEX BY PLS_INTEGER;
 
   TYPE pls_integer_aat IS TABLE OF PLS_INTEGER
    INDEX BY PLS_INTEGER;
 
   TYPE PLS_integer_aat IS TABLE OF PLS_INTEGER
    INDEX BY PLS_INTEGER;
 
   TYPE natural_aat IS TABLE OF NATURAL
    INDEX BY PLS_INTEGER;
 
   TYPE positive_aat IS TABLE OF POSITIVE
    INDEX BY PLS_INTEGER;
 
   TYPE number_aat IS TABLE OF NUMBER
    INDEX BY PLS_INTEGER;
 
   TYPE maxdbvarchar2_aat IS TABLE OF VARCHAR2(4000)
    INDEX BY PLS_INTEGER;
 
   TYPE maxvarchar2_aat IS TABLE OF VARCHAR2(32767)
    INDEX BY PLS_INTEGER;
 
   TYPE identifier_aat IS TABLE OF VARCHAR2(30)
    INDEX BY PLS_INTEGER;
 
   TYPE utl_file_aat IS TABLE OF UTL_FILE.FILE_TYPE
    INDEX BY PLS_INTEGER;
 
   TYPE xml_aat IS TABLE OF XML_TYPE
    INDEX BY PLS_INTEGER;
 
   TYPE clob_aat IS TABLE OF CLOB
    INDEX BY PLS_INTEGER;
 
   TYPE blob_aat IS TABLE OF BLOB
    INDEX BY PLS_INTEGER;
END aa_types;
/



/*======================================================================
| Supplement to the fifth edition of Oracle PL/SQL Programming by Steven
| Feuerstein with Bill Pribyl, Copyright (c) 1997-2009 O'Reilly Media, Inc. 
| To submit corrections or find more code samples visit
| http://oreilly.com/catalog/9780596514464/
*/
