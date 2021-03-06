CREATE OR REPLACE PACKAGE BODY EMPLOYEE_UP
/*
| Generated by or retrieved from Qnxo - DO NOT MODIFY!
| Qnxo - "Get it right, do it fast" - www.qnxo.com
| Qnxo Universal ID: 5a47cf03-58e8-4963-9210-3278890d2424
| Created On: April     04, 2005 07:31:58 Created By: QNXO_DEMO
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
        rec_in IN EMPLOYEE_TP.EMPLOYEE_rt
      , delimiter_in IN VARCHAR2 := CHR(10) -- Carriage return
      )
      RETURN VARCHAR2
   IS
   BEGIN
      RETURN LTRIM (NULL
         || delimiter_in || 'LAST_NAME = ' || rec_in.LAST_NAME
         || delimiter_in || 'FIRST_NAME = ' || rec_in.FIRST_NAME
         || delimiter_in || 'MIDDLE_INITIAL = ' || rec_in.MIDDLE_INITIAL
         || delimiter_in || 'JOB_ID = ' || STANDARD.TO_CHAR (rec_in.JOB_ID)
         || delimiter_in || 'MANAGER_ID = ' || STANDARD.TO_CHAR (rec_in.MANAGER_ID)
         || delimiter_in || 'HIRE_DATE = ' || STANDARD.TO_CHAR (rec_in.HIRE_DATE)
         || delimiter_in || 'SALARY = ' || STANDARD.TO_CHAR (rec_in.SALARY)
         || delimiter_in || 'COMMISSION = ' || STANDARD.TO_CHAR (rec_in.COMMISSION)
         || delimiter_in || 'DEPARTMENT_ID = ' || STANDARD.TO_CHAR (rec_in.DEPARTMENT_ID)
         || delimiter_in || 'EMPNO = ' || STANDARD.TO_CHAR (rec_in.EMPNO)
         || delimiter_in || 'ENAME = ' || rec_in.ENAME
         || delimiter_in || 'CREATED_BY = ' || rec_in.CREATED_BY
         || delimiter_in || 'CREATED_ON = ' || STANDARD.TO_CHAR (rec_in.CREATED_ON)
         || delimiter_in || 'CHANGED_BY = ' || rec_in.CHANGED_BY
         || delimiter_in || 'CHANGED_ON = ' || STANDARD.TO_CHAR (rec_in.CHANGED_ON)
      , delimiter_in);
   END to_char;

    FUNCTION to_char (
      employee_id_in IN EMPLOYEE_TP.EMPLOYEE_ID_t,
      delimiter_in IN VARCHAR2 := CHR(10) -- Carriage return
      )
      RETURN VARCHAR2
   IS
      l_rec EMPLOYEE_TP.EMPLOYEE_rt;
   BEGIN
      l_rec := EMPLOYEE_QP.onerow (
            employee_id_in
            );
      RETURN EMPLOYEE_UP.to_char (l_rec, delimiter_in);
   END to_char;

    PROCEDURE display_row (
      employee_id_in IN EMPLOYEE_TP.EMPLOYEE_ID_t,
      delimiter_in IN VARCHAR2 := CHR(10) -- Carriage return
      )
   IS
   BEGIN
      qd_runtime.pl (EMPLOYEE_UP.to_char (
            employee_id_in,
            delimiter_in
            )
         );
   END display_row;

    PROCEDURE display_row (
        rec_in IN EMPLOYEE_TP.EMPLOYEE_rt
      , delimiter_in IN VARCHAR2 := CHR(10) -- Carriage return
      )
   IS
   BEGIN
      qd_runtime.pl (EMPLOYEE_UP.to_char (rec_in, delimiter_in));
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
      l_EMPLOYEE EMPLOYEE_TP.EMPLOYEE_tc;
   BEGIN
      fid := UTL_FILE.FOPEN (loc_in, file_in, 'W', max_linesize => 32767);
      l_EMPLOYEE := EMPLOYEE_QP.allrows_by (NVL (where_in, '1=1'));
      l_index := l_EMPLOYEE.FIRST;
      WHILE (l_index IS NOT NULL)
      LOOP
         UTL_FILE.PUT_LINE (fid,
           to_char (l_EMPLOYEE(l_index), delimiter_in));
         l_index := l_EMPLOYEE.NEXT (l_index);
      END LOOP;
      UTL_FILE.FCLOSE (fid);
   END dump_to_file;
    PROCEDURE copy (
      -- Primary key to identify source row
      employee_id_in IN EMPLOYEE_TP.EMPLOYEE_ID_t,
      -- New value parameters, overriding existing ones.
      LAST_NAME_nv IN EMPLOYEE_TP.LAST_NAME_t DEFAULT NULL,
      FIRST_NAME_nv IN EMPLOYEE_TP.FIRST_NAME_t DEFAULT NULL,
      MIDDLE_INITIAL_nv IN EMPLOYEE_TP.MIDDLE_INITIAL_t DEFAULT NULL,
      JOB_ID_nv IN EMPLOYEE_TP.JOB_ID_t DEFAULT NULL,
      MANAGER_ID_nv IN EMPLOYEE_TP.MANAGER_ID_t DEFAULT NULL,
      HIRE_DATE_nv IN EMPLOYEE_TP.HIRE_DATE_t DEFAULT NULL,
      SALARY_nv IN EMPLOYEE_TP.SALARY_t DEFAULT NULL,
      COMMISSION_nv IN EMPLOYEE_TP.COMMISSION_t DEFAULT NULL,
      DEPARTMENT_ID_nv IN EMPLOYEE_TP.DEPARTMENT_ID_t DEFAULT NULL,
      EMPNO_nv IN EMPLOYEE_TP.EMPNO_t DEFAULT NULL,
      ENAME_nv IN EMPLOYEE_TP.ENAME_t DEFAULT NULL,
      -- Generated primary key value
      employee_id_out IN OUT EMPLOYEE_TP.EMPLOYEE_ID_t,
      prefix_in IN VARCHAR2 DEFAULT NULL,
      suffix_in IN VARCHAR2 DEFAULT NULL
      )
   IS
      l_EMPLOYEE EMPLOYEE_TP.EMPLOYEE_rt;
      l_prefix ALL_OBJECTS.OBJECT_NAME%TYPE;
      l_suffix ALL_OBJECTS.OBJECT_NAME%TYPE;
   BEGIN
      l_EMPLOYEE := EMPLOYEE_QP.onerow (
         employee_id_in
         );
      l_EMPLOYEE.LAST_NAME := NVL (LAST_NAME_nv, l_EMPLOYEE.LAST_NAME);
      l_EMPLOYEE.FIRST_NAME := NVL (FIRST_NAME_nv, l_EMPLOYEE.FIRST_NAME);
      l_EMPLOYEE.MIDDLE_INITIAL := NVL (MIDDLE_INITIAL_nv, l_EMPLOYEE.MIDDLE_INITIAL);
      l_EMPLOYEE.JOB_ID := NVL (JOB_ID_nv, l_EMPLOYEE.JOB_ID);
      l_EMPLOYEE.MANAGER_ID := NVL (MANAGER_ID_nv, l_EMPLOYEE.MANAGER_ID);
      l_EMPLOYEE.HIRE_DATE := NVL (HIRE_DATE_nv, l_EMPLOYEE.HIRE_DATE);
      l_EMPLOYEE.SALARY := NVL (SALARY_nv, l_EMPLOYEE.SALARY);
      l_EMPLOYEE.COMMISSION := NVL (COMMISSION_nv, l_EMPLOYEE.COMMISSION);
      l_EMPLOYEE.DEPARTMENT_ID := NVL (DEPARTMENT_ID_nv, l_EMPLOYEE.DEPARTMENT_ID);
      l_EMPLOYEE.EMPNO := NVL (EMPNO_nv, l_EMPLOYEE.EMPNO);
      l_EMPLOYEE.ENAME := NVL (ENAME_nv, l_EMPLOYEE.ENAME);
       EMPLOYEE_CP.ins (
         last_name_in => l_EMPLOYEE.LAST_NAME,
         first_name_in => l_EMPLOYEE.FIRST_NAME,
         middle_initial_in => l_EMPLOYEE.MIDDLE_INITIAL,
         job_id_in => l_EMPLOYEE.JOB_ID,
         manager_id_in => l_EMPLOYEE.MANAGER_ID,
         hire_date_in => l_EMPLOYEE.HIRE_DATE,
         salary_in => l_EMPLOYEE.SALARY,
         commission_in => l_EMPLOYEE.COMMISSION,
         department_id_in => l_EMPLOYEE.DEPARTMENT_ID,
         empno_in => l_EMPLOYEE.EMPNO,
         ename_in => l_EMPLOYEE.ENAME,
         employee_id_out => employee_id_out
         );
       -- Call the XP stub to do any additional, customized
      -- copy processing. Pass in the from ID info and the
      -- to ID info.
      BEGIN
        EXECUTE IMMEDIATE 'BEGIN EMPLOYEE_XP.copy (
                f_EMPLOYEE_ID => :FEMPLOYEE_ID,
                t_EMPLOYEE_ID => :TEMPLOYEE_ID,
                prefix_in => :prefix, suffix_in => :suffix); END;'
           USING
                employee_id_in,
                employee_id_out,
                l_prefix, l_suffix;
      EXCEPTION
         WHEN DUP_VAL_ON_INDEX
         THEN
             RAISE;
         WHEN OTHERS THEN NULL;
      END;
   END copy;
END EMPLOYEE_UP;
/



/*======================================================================
| Supplement to the fifth edition of Oracle PL/SQL Programming by Steven
| Feuerstein with Bill Pribyl, Copyright (c) 1997-2009 O'Reilly Media, Inc. 
| To submit corrections or find more code samples visit
| http://oreilly.com/catalog/9780596514464/
*/
