CREATE OR REPLACE PACKAGE DEPARTMENT_QP
/*
| Generated by or retrieved from Qnxo - DO NOT MODIFY!
| Qnxo - "Get it right, do it fast" - www.qnxo.com
| Qnxo Universal ID: 1aa62bc9-ca69-4405-9a6d-a74fb4d1a7ce
| Created On: April     04, 2005 08:01:11 Created By: QNXO_DEMO
*/
IS
   -- Return a record for one row of data for a primary key
   FUNCTION onerow (
      department_id_in IN DEPARTMENT_TP.DEPARTMENT_ID_t
      )
   RETURN DEPARTMENT_TP.DEPARTMENT_rt;

   -- Return TRUE if a row exists for this primary key
   FUNCTION row_exists (
      department_id_in IN DEPARTMENT_TP.DEPARTMENT_ID_t
      )
   RETURN BOOLEAN;

   -- Return a cursor variable for one row of data for a primary key.
   FUNCTION onerow_CV (
      department_id_in IN DEPARTMENT_TP.DEPARTMENT_ID_t
      )
   RETURN DEPARTMENT_TP.DEPARTMENT_rc;
   -- Return all rows in a collection of records
   FUNCTION allrows RETURN DEPARTMENT_TP.DEPARTMENT_tc;

   -- Return all rows in collections for each column.
   PROCEDURE allrows (
      department_id_out OUT DEPARTMENT_TP.DEPARTMENT_ID_cc,
      name_out OUT DEPARTMENT_TP.NAME_cc,
      loc_id_out OUT DEPARTMENT_TP.LOC_ID_cc,
      created_by_out OUT DEPARTMENT_TP.CREATED_BY_cc,
      created_on_out OUT DEPARTMENT_TP.CREATED_ON_cc,
      changed_by_out OUT DEPARTMENT_TP.CHANGED_BY_cc,
      changed_on_out OUT DEPARTMENT_TP.CHANGED_ON_cc
   );

   -- Return all rows in table via ref cursor
   FUNCTION allrows_CV RETURN DEPARTMENT_TP.DEPARTMENT_rc;

   FUNCTION allrows_by_CV (
      where_clause_in IN VARCHAR2
     ,column_list_in IN VARCHAR2 DEFAULT NULL) RETURN DEPARTMENT_TP.weak_refcur;

   -- Close the specified cursor variable, only if it is open.
   PROCEDURE close_cursor (cursor_variable_in IN DEPARTMENT_TP.DEPARTMENT_rc);

   -- Hide calls to cursor attributes behind interface.
   FUNCTION cursor_is_open (cursor_variable_in IN DEPARTMENT_TP.weak_refcur) RETURN BOOLEAN;
   FUNCTION row_found (cursor_variable_in IN DEPARTMENT_TP.weak_refcur) RETURN BOOLEAN;
   FUNCTION row_notfound (cursor_variable_in IN DEPARTMENT_TP.weak_refcur) RETURN BOOLEAN;
   FUNCTION cursor_rowcount (cursor_variable_in IN DEPARTMENT_TP.weak_refcur) RETURN PLS_INTEGER;

   -- Use the LIMIT clause to BULK COLLECT N rows through the cursor variable
   -- The current contents of the collection will be deleted.
   FUNCTION fetch_rows (
      cursor_variable_in IN DEPARTMENT_TP.DEPARTMENT_rc
    , limit_in IN PLS_INTEGER DEFAULT 100
    )
      RETURN DEPARTMENT_TP.DEPARTMENT_tc;

   -- Allrows for specified where clause (using dynamic SQL)
   FUNCTION allrows_by (where_clause_in IN VARCHAR2)
      RETURN DEPARTMENT_TP.DEPARTMENT_tc;

   -- Return collection of all rows for primary key column DEPARTMENT_ID
   FUNCTION for_DEPARTMENT_ID (
      department_id_in IN DEPARTMENT_TP.DEPARTMENT_ID_t
   )
   RETURN DEPARTMENT_TP.DEPARTMENT_tc;

   -- Return ref cursor to all rows for primary key column DEPARTMENT_ID
   FUNCTION for_DEPARTMENT_ID_CV (
      department_id_in IN DEPARTMENT_TP.DEPARTMENT_ID_t
   )
   RETURN DEPARTMENT_TP.DEPARTMENT_rc;

   -- Return ref cursor to all rows for list of DEPARTMENT_ID values
   -- in format 'A,B,C,D', to be used in an IN list.
   FUNCTION in_DEPARTMENT_ID_CV (
      list_in IN VARCHAR2
   )
   RETURN DEPARTMENT_TP.weak_refcur;


   -- Return a record for one row by I_DEPARTMENT_NAME value
   FUNCTION or_I_DEPARTMENT_NAME (
      name_in IN DEPARTMENT_TP.NAME_t
      )
      RETURN DEPARTMENT_TP.DEPARTMENT_rt
      ;

   -- Return a cursor variable for one row by I_DEPARTMENT_NAME value
   FUNCTION or_I_DEPARTMENT_NAME_CV (
      name_in IN DEPARTMENT_TP.NAME_t
      )
      RETURN DEPARTMENT_TP.DEPARTMENT_rc
      ;

   -- Return the primary key value for this unique index value
   FUNCTION pky_I_DEPARTMENT_NAME (
      name_in IN DEPARTMENT_TP.NAME_t
      )
      RETURN DEPARTMENT_TP.DEPARTMENT_ID_t
      ;

   -- Number of rows for this I_DEPARTMENT_NAME value
   FUNCTION num_I_DEPARTMENT_NAME (
      name_in IN DEPARTMENT_TP.NAME_t
      )
      RETURN PLS_INTEGER;

   -- Returns TRUE if at least one row exists for this I_DEPARTMENT_NAME value
   FUNCTION ex_I_DEPARTMENT_NAME (
      name_in IN DEPARTMENT_TP.NAME_t
      )
      RETURN BOOLEAN;

   -- Return a collection of all rows for FK_DEPT_LOC value
   FUNCTION ar_FK_DEPT_LOC (
      loc_id_in IN DEPARTMENT_TP.LOC_ID_t
      )
      RETURN DEPARTMENT_TP.DEPARTMENT_tc;

   -- Return a cursor variable of all rows for FK_DEPT_LOC value
   FUNCTION ar_FK_DEPT_LOC_CV (
      loc_id_in IN DEPARTMENT_TP.LOC_ID_t
      )
      RETURN DEPARTMENT_TP.DEPARTMENT_rc;

   -- Return a cursor variable of all rows based on IN list of values
   FUNCTION in_FK_DEPT_LOC_CV (
      loc_id_in IN VARCHAR2
      )
      RETURN DEPARTMENT_TP.weak_refcur;

   PROCEDURE ar_FK_DEPT_LOC (
      loc_id_in IN DEPARTMENT_TP.LOC_ID_t,
      department_id_out OUT DEPARTMENT_TP.DEPARTMENT_ID_cc,
      name_out OUT DEPARTMENT_TP.NAME_cc,
      loc_id_out OUT DEPARTMENT_TP.LOC_ID_cc,
      created_by_out OUT DEPARTMENT_TP.CREATED_BY_cc,
      created_on_out OUT DEPARTMENT_TP.CREATED_ON_cc,
      changed_by_out OUT DEPARTMENT_TP.CHANGED_BY_cc,
      changed_on_out OUT DEPARTMENT_TP.CHANGED_ON_cc
      );

   -- Returns TRUE if at least one row exists for this FK_DEPT_LOC value
   FUNCTION ex_FK_DEPT_LOC (
      loc_id_in IN DEPARTMENT_TP.LOC_ID_t
      )
      RETURN BOOLEAN;

   -- Number of rows for this FK_DEPT_LOC value
   FUNCTION num_FK_DEPT_LOC (
      loc_id_in IN DEPARTMENT_TP.LOC_ID_t
      )
      RETURN PLS_INTEGER;

   -- Number of rows in table
   FUNCTION tabcount (where_clause_in IN VARCHAR2 := NULL)
      RETURN PLS_INTEGER;
   -- Number of rows for this primary key value
   FUNCTION pkycount (
      department_id_in IN DEPARTMENT_TP.DEPARTMENT_ID_t
      )
      RETURN PLS_INTEGER;

   -- Returns TRUE if at least one row exists for this where clause
   FUNCTION ex_DEPARTMENT (
      where_clause_in IN VARCHAR2 := NULL)
   RETURN BOOLEAN;

   -- Returns TRUE if at least one row exists for this primary key
   FUNCTION ex_pky (
      department_id_in IN DEPARTMENT_TP.DEPARTMENT_ID_t
      )
   RETURN BOOLEAN;
END DEPARTMENT_QP;
/



/*======================================================================
| Supplement to the fifth edition of Oracle PL/SQL Programming by Steven
| Feuerstein with Bill Pribyl, Copyright (c) 1997-2009 O'Reilly Media, Inc. 
| To submit corrections or find more code samples visit
| http://oreilly.com/catalog/9780596514464/
*/