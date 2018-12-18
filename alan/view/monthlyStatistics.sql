/*
江苏省重点物流企业运行情况监控（月报） ul_JSSZDWLQYYXQKJK_YB_  IJSYB_XXB1
江苏仓储指数调查（月报）               ul_JSCCZSDC_YB_         IJSYB_XXB
公路物流运价采集表（月报）             ul_GLWLYJCJB_YB_        IGLYB_XXB
江苏仓库价格指数调查（月报）           ul_JSCKJGZSDC_YB_       IJSYB_XXB2
物流企业经营情况（季报）               ul_WLQYJYQK_JB_         IWLJB_XXB
企业物流状况（年报）                   ul_QYWLZK_NB_           IQYNB_XXB
物流企业经营情况（年报）               ul_WLQYJYQK_NB_         IWLNB_XXB

*/
create view v_wlzb_tj as 
SELECT DISTINCT JB.BBMC,
                JB.BBLX,
                JB.BBQ,
                JB.DQ,
                COUNT(NVL(JB.DQ, '江苏省')) OVER(PARTITION BY JB.DQ) YBS,
                --(select count(*) from ul_JSSZDWLQYYXQKJK_YB_ where btype = 0) ybs,
                SUM(CASE
                      WHEN JB.SPZT = '10' THEN
                       1
                      WHEN JB.SPZT = '20' THEN
                       1
                      WHEN JB.SPZT = '30' THEN
                       1
                      WHEN JB.SPZT = '40' THEN
                       1
                      ELSE
                       0
                    END) OVER(PARTITION BY JB.BBQ) YBS_DSP,
                SUM(CASE
                      WHEN JB.SPZT = '60' THEN
                       1
                      ELSE
                       0
                    END) OVER(PARTITION BY JB.BBQ) YBS_SPTG,
                SUM(CASE
                      WHEN JB.SPZT = '50' THEN
                       1
                      ELSE
                       0
                    END) OVER(PARTITION BY JB.BBQ) YBS_SPBTG,
                COUNT(NVL(JB.DQ, '江苏省')) OVER(PARTITION BY JB.DQ) - COUNT(JB.TBQY) OVER(PARTITION BY JB.BBQ) WSB
  FROM (SELECT '江苏省重点物流企业运行情况监控' BBMC,
               Y.USERNAME QYMC,
               '月报' BBLX,
               X.SF SF,
               X.SH || X.X DQ,
               CASE
                 WHEN X1.A7 IS NULL AND X1.USERNAME_ IS NOT NULL THEN
                  '10'
                 ELSE
                  X1.A7
               END SPZT,
               X1.USERNAME_ TBQY,
               X1.BBQ_ BBQ
          FROM UL_JSSZDWLQYYXQKJK_YB_ Y
          LEFT JOIN BIZUSER.ZWXT_QYJBXX X
            ON X.QYDM = Y.USERID
          LEFT JOIN GT.E_UROP_JG J
            ON X.ZGLSJDM = J.NBBM
          LEFT JOIN IJSYB_XXB1 X1
            ON X1.USERID_ = Y.USERID
         WHERE Y.BTYPE = 0) JB
UNION ALL
SELECT DISTINCT JB.BBMC,
                JB.BBLX,
                JB.BBQ,
                JB.DQ,
                COUNT(NVL(JB.DQ, '江苏省')) OVER(PARTITION BY JB.DQ) YBS,
                --(select count(*) from ul_JSSZDWLQYYXQKJK_YB_ where btype = 0) ybs,
                SUM(CASE
                      WHEN JB.SPZT = '10' THEN
                       1
                      WHEN JB.SPZT = '20' THEN
                       1
                      WHEN JB.SPZT = '30' THEN
                       1
                      WHEN JB.SPZT = '40' THEN
                       1
                      ELSE
                       0
                    END) OVER(PARTITION BY JB.BBQ) YBS_DSP,
                SUM(CASE
                      WHEN JB.SPZT = '60' THEN
                       1
                      ELSE
                       0
                    END) OVER(PARTITION BY JB.BBQ) YBS_SPTG,
                SUM(CASE
                      WHEN JB.SPZT = '50' THEN
                       1
                      ELSE
                       0
                    END) OVER(PARTITION BY JB.BBQ) YBS_SPBTG,
                COUNT(NVL(JB.DQ, '江苏省')) OVER(PARTITION BY JB.DQ) - COUNT(JB.TBQY) OVER(PARTITION BY JB.BBQ) WSB
  FROM (SELECT '江苏仓储指数调查' BBMC,
               Y.USERNAME QYMC,
               '月报' BBLX,
               X.SF SF,
               X.SH || X.X DQ,
               CASE
                 WHEN X1.A7 IS NULL AND X1.USERNAME_ IS NOT NULL THEN
                  '10'
                 ELSE
                  X1.A7
               END SPZT,
               X1.USERNAME_ TBQY,
               X1.BBQ_ BBQ
          FROM UL_JSCCZSDC_YB_ Y
          LEFT JOIN BIZUSER.ZWXT_QYJBXX X
            ON X.QYDM = Y.USERID
          LEFT JOIN GT.E_UROP_JG J
            ON X.ZGLSJDM = J.NBBM
          LEFT JOIN IJSYB_XXB X1
            ON X1.USERID_ = Y.USERID
         WHERE Y.BTYPE = 0) JB
UNION ALL
SELECT DISTINCT JB.BBMC,
                JB.BBLX,
                JB.BBQ,
                JB.DQ,
                COUNT(NVL(JB.DQ, '江苏省')) OVER(PARTITION BY JB.DQ) YBS,
                --(select count(*) from ul_JSSZDWLQYYXQKJK_YB_ where btype = 0) ybs,
                SUM(CASE
                      WHEN JB.SPZT = '10' THEN
                       1
                      WHEN JB.SPZT = '20' THEN
                       1
                      WHEN JB.SPZT = '30' THEN
                       1
                      WHEN JB.SPZT = '40' THEN
                       1
                      ELSE
                       0
                    END) OVER(PARTITION BY JB.BBQ) YBS_DSP,
                SUM(CASE
                      WHEN JB.SPZT = '60' THEN
                       1
                      ELSE
                       0
                    END) OVER(PARTITION BY JB.BBQ) YBS_SPTG,
                SUM(CASE
                      WHEN JB.SPZT = '50' THEN
                       1
                      ELSE
                       0
                    END) OVER(PARTITION BY JB.BBQ) YBS_SPBTG,
                COUNT(NVL(JB.DQ, '江苏省')) OVER(PARTITION BY JB.DQ) - COUNT(JB.TBQY) OVER(PARTITION BY JB.BBQ) WSB
  FROM (SELECT '公路物流运价采集表' BBMC,
               Y.USERNAME QYMC,
               '月报' BBLX,
               X.SF SF,
               X.SH || X.X DQ,
               CASE
                 WHEN X1.A7 IS NULL AND X1.USERNAME_ IS NOT NULL THEN
                  '10'
                 ELSE
                  X1.A7
               END SPZT,
               X1.USERNAME_ TBQY,
               X1.BBQ_ BBQ
          FROM UL_GLWLYJCJB_YB_ Y
          LEFT JOIN BIZUSER.ZWXT_QYJBXX X
            ON X.QYDM = Y.USERID
          LEFT JOIN GT.E_UROP_JG J
            ON X.ZGLSJDM = J.NBBM
          LEFT JOIN IGLYB_XXB X1
            ON X1.USERID_ = Y.USERID
         WHERE Y.BTYPE = 0) JB
UNION ALL
SELECT DISTINCT JB.BBMC,
                JB.BBLX,
                JB.BBQ,
                JB.DQ,
                COUNT(NVL(JB.DQ, '江苏省')) OVER(PARTITION BY JB.DQ) YBS,
                --(select count(*) from ul_JSSZDWLQYYXQKJK_YB_ where btype = 0) ybs,
                SUM(CASE
                      WHEN JB.SPZT = '10' THEN
                       1
                      WHEN JB.SPZT = '20' THEN
                       1
                      WHEN JB.SPZT = '30' THEN
                       1
                      WHEN JB.SPZT = '40' THEN
                       1
                      ELSE
                       0
                    END) OVER(PARTITION BY JB.BBQ) YBS_DSP,
                SUM(CASE
                      WHEN JB.SPZT = '60' THEN
                       1
                      ELSE
                       0
                    END) OVER(PARTITION BY JB.BBQ) YBS_SPTG,
                SUM(CASE
                      WHEN JB.SPZT = '50' THEN
                       1
                      ELSE
                       0
                    END) OVER(PARTITION BY JB.BBQ) YBS_SPBTG,
                COUNT(NVL(JB.DQ, '江苏省')) OVER(PARTITION BY JB.DQ) - COUNT(JB.TBQY) OVER(PARTITION BY JB.BBQ) WSB
  FROM (SELECT '江苏仓库价格指数调查' BBMC,
               Y.USERNAME QYMC,
               '月报' BBLX,
               X.SF SF,
               X.SH || X.X DQ,
               CASE
                 WHEN X1.A7 IS NULL AND X1.USERNAME_ IS NOT NULL THEN
                  '10'
                 ELSE
                  X1.A7
               END SPZT,
               X1.USERNAME_ TBQY,
               X1.BBQ_ BBQ
          FROM UL_JSCKJGZSDC_YB_ Y
          LEFT JOIN BIZUSER.ZWXT_QYJBXX X
            ON X.QYDM = Y.USERID
          LEFT JOIN GT.E_UROP_JG J
            ON X.ZGLSJDM = J.NBBM
          LEFT JOIN IJSYB_XXB2 X1
            ON X1.USERID_ = Y.USERID
         WHERE Y.BTYPE = 0) JB;
