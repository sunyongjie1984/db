CREATE OR REPLACE PACKAGE BODY DEPARTMENT_UP
/*
| Generated by or retrieved from Qnxo - DO NOT MODIFY!
| Qnxo - "Get it right, do it fast" - www.qnxo.com
| Qnxo Universal ID: 5a47cf03-58e8-4963-9210-3278890d2424
| Created On: April     04, 2005 08:01:13 Created By: QNXO_DEMO
*/
IS
   -- Used in snapshots
   c_squote CONSTANT VARCHAR2(4) := '''';
   c_dquote CONSTANT VARCHAR2(6) := '''''';
   c_procname ALL_OBJECTS.OBJECT_NAME%TYPE := 'qnxo$snapshot$ins';
   -- Functions to convert variables into strings for snapshots
   FUNCTION replace_string (
      val_in IN VARCHAR2
     ,add_comma_in IN BOOLEAN := TRUE
   )
      RETURN VARCHAR2
   IS
      retval   VARCHAR2 (32767);
   BEGIN
      IF val_in IS NULL
      THEN
         retval := 'NULL';
      ELSIF INSTR (val_in, c_squote) > 0
      THEN
         retval := '''' || REPLACE (val_in, c_squote, c_dquote) || '''';
      ELSE
         retval := '''' || val_in || '''';
      END IF;
       IF add_comma_in
      THEN
         retval := retval || ',';
      END IF;
       RETURN retval;
   END;

   FUNCTION replace_string (val_in IN DATE,
       add_comma_in IN BOOLEAN := TRUE) RETURN VARCHAR2
    IS
       retval VARCHAR2(32767);
    BEGIN
       IF val_in IS NULL THEN retval := 'NULL';
       ELSE
          retval := 'TO_DATE('
           || STANDARD.TO_CHAR (val_in, 'YYYYMMDDHH24MISS')
           || ', ''YYYYMMDDHH24MISS'')';
       END IF;
       IF add_comma_in THEN retval := retval || ','; END IF;
       RETURN retval;
    END;

     FUNCTION replace_string (val_in IN NUMBER,
       add_comma_in IN BOOLEAN := TRUE) RETURN VARCHAR2
    IS
       retval VARCHAR2(32767);
    BEGIN
       IF val_in IS NULL THEN retval := 'NULL';
       ELSE retval := 'TO_CHAR(' || val_in || ')';
       END IF;
       IF add_comma_in THEN retval := retval || ','; END IF;
       RETURN retval;
    END;

   /* BLOB support is disabled until we can allow the users
      to specify whether they want this code to be used for
      Oracle8i (will not work) or above.
   FUNCTION replace_string (val_in IN BLOB, add_comma_in IN BOOLEAN := TRUE)
      RETURN VARCHAR2
   IS
      retval   VARCHAR2 (32767);
   BEGIN
      IF val_in IS NULL
      THEN
         retval := 'NULL';
      ELSE
         retval := 'TO_CHAR(' || UTL_RAW.cast_to_varchar2 (val_in) || ')';
      END IF;

      IF add_comma_in
      THEN
         retval := retval || ',';
      END IF;

      RETURN retval;
   END;
   */

   -- Display functionality
   FUNCTION to_char (
        rec_in IN DEPARTMENT_TP.DEPARTMENT_rt
      , delimiter_in IN VARCHAR2 := CHR(10) -- Carriage return
      )
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN LTRIM (NULL
         || delimiter_in || 'NAME = ' || rec_in.NAME
         || delimiter_in || 'LOC_ID = ' || STANDARD.TO_CHAR (rec_in.LOC_ID)
         || delimiter_in || 'CREATED_BY = ' || rec_in.CREATED_BY
         || delimiter_in || 'CREATED_ON = ' || STANDARD.TO_CHAR (rec_in.CREATED_ON)
         || delimiter_in || 'CHANGED_BY = ' || rec_in.CHANGED_BY
         || delimiter_in || 'CHANGED_ON = ' || STANDARD.TO_CHAR (rec_in.CHANGED_ON)
      , delimiter_in);
   END to_char;

    FUNCTION to_char (
      department_id_in IN DEPARTMENT_TP.DEPARTMENT_ID_t,
      delimiter_in IN VARCHAR2 := CHR(10) -- Carriage return
      )
      RETURN VARCHAR2
   IS
      l_rec DEPARTMENT_TP.DEPARTMENT_rt;
   BEGIN
      l_rec := DEPARTMENT_QP.onerow (
            department_id_in
            );
      RETURN DEPARTMENT_UP.to_char (l_rec, delimiter_in);
   END to_char;

    PROCEDURE display_row (
      department_id_in IN DEPARTMENT_TP.DEPARTMENT_ID_t,
      delimiter_in IN VARCHAR2 := CHR(10) -- Carriage return
      )
   IS
   BEGIN
      qd_runtime.pl (DEPARTMENT_UP.to_char (
            department_id_in,
            delimiter_in
            )
         );
   END display_row;

    PROCEDURE display_row (
        rec_in IN DEPARTMENT_TP.DEPARTMENT_rt
      , delimiter_in IN VARCHAR2 := CHR(10) -- Carriage return
      )
   IS
   BEGIN
      qd_runtime.pl (DEPARTMENT_UP.to_char (rec_in, delimiter_in));
   END display_row;

    PROCEDURE dump_to_file (
      loc_in IN VARCHAR2
    , file_in IN VARCHAR2
    , where_in IN VARCHAR2 := NULL
    , delimiter_in IN VARCHAR2 := '|'
    )
   IS
      fid UTL_FILE.FILE_TYPE;
      l_index PLS_INTEGER;
      line VARCHAR2(32767);
      l_DEPARTMENT DEPARTMENT_TP.DEPARTMENT_tc;
   BEGIN
      fid := UTL_FILE.FOPEN (loc_in, file_in, 'W', max_linesize => 32767);
      l_DEPARTMENT := DEPARTMENT_QP.allrows_by (NVL (where_in, '1=1'));
      l_index := l_DEPARTMENT.FIRST;
      WHILE (l_index IS NOT NULL)
      LOOP
         UTL_FILE.PUT_LINE (fid,
           to_char (l_DEPARTMENT(l_index), delimiter_in));
         l_index := l_DEPARTMENT.NEXT (l_index);
      END LOOP;
      UTL_FILE.FCLOSE (fid);
   END dump_to_file;
    PROCEDURE copy (
      -- Primary key to identify source row
      department_id_in IN DEPARTMENT_TP.DEPARTMENT_ID_t,
      -- New value parameters, overriding existing ones.
      NAME_nv IN DEPARTMENT_TP.NAME_t DEFAULT NULL,
      LOC_ID_nv IN DEPARTMENT_TP.LOC_ID_t DEFAULT NULL,
      -- Generated primary key value
      department_id_out IN OUT DEPARTMENT_TP.DEPARTMENT_ID_t,
      prefix_in IN VARCHAR2 DEFAULT NULL,
      suffix_in IN VARCHAR2 DEFAULT NULL
      )
   IS
      l_DEPARTMENT DEPARTMENT_TP.DEPARTMENT_rt;
      l_prefix ALL_OBJECTS.OBJECT_NAME%TYPE;
      l_suffix ALL_OBJECTS.OBJECT_NAME%TYPE;
   BEGIN
      l_DEPARTMENT := DEPARTMENT_QP.onerow (
         department_id_in
         );
      BEGIN
         l_prefix := prefix_in;
         l_suffix := suffix_in;
         l_DEPARTMENT.name := prefix_in || NVL (name_nv, l_DEPARTMENT.name) || suffix_in;
      EXCEPTION WHEN OTHERS THEN NULL;
      END;
      l_DEPARTMENT.LOC_ID := NVL (LOC_ID_nv, l_DEPARTMENT.LOC_ID);
       DEPARTMENT_CP.ins (
         name_in => l_DEPARTMENT.NAME,
         loc_id_in => l_DEPARTMENT.LOC_ID,
         department_id_out => department_id_out
         );
       -- Call the XP stub to do any additional, customized
      -- copy processing. Pass in the from ID info and the
      -- to ID info.
      BEGIN
        EXECUTE IMMEDIATE 'BEGIN DEPARTMENT_XP.copy (
                f_DEPARTMENT_ID => :FDEPARTMENT_ID,
                t_DEPARTMENT_ID => :TDEPARTMENT_ID,
                prefix_in => :prefix, suffix_in => :suffix); END;'
           USING
                department_id_in,
                department_id_out,
                l_prefix, l_suffix;
      EXCEPTION
         WHEN DUP_VAL_ON_INDEX
         THEN
             RAISE;
         WHEN OTHERS THEN NULL;
      END;
   END copy;
END DEPARTMENT_UP;
/
