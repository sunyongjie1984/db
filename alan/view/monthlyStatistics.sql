/*
����ʡ�ص�������ҵ���������أ��±��� ul_JSSZDWLQYYXQKJK_YB_  IJSYB_XXB1
���ղִ�ָ�����飨�±���               ul_JSCCZSDC_YB_         IJSYB_XXB
��·�����˼۲ɼ����±���             ul_GLWLYJCJB_YB_        IGLYB_XXB
���ղֿ�۸�ָ�����飨�±���           ul_JSCKJGZSDC_YB_       IJSYB_XXB2
������ҵ��Ӫ�����������               ul_WLQYJYQK_JB_         IWLJB_XXB
��ҵ����״�����걨��                   ul_QYWLZK_NB_           IQYNB_XXB
������ҵ��Ӫ������걨��               ul_WLQYJYQK_NB_         IWLNB_XXB

*/
create view v_wlzb_tj as 
select distinct jb.bbmc,
                jb.bblx,
                jb.bbq,
                jb.dq,
                count(nvl(jb.dq, '����ʡ')) over(partition by jb.dq) ybs,
                --(select count(*) from ul_JSSZDWLQYYXQKJK_YB_ where btype = 0) ybs,
                sum(case
                      when jb.spzt = '10' then
                       1
                      when jb.spzt = '20' then
                       1
                      when jb.spzt = '30' then
                       1
                      when jb.spzt = '40' then
                       1
                      else
                       0
                    end) over(partition by jb.bbq) ybs_dsp,
                sum(case
                      when jb.spzt = '60' then
                       1
                      else
                       0
                    end) over(partition by jb.bbq) ybs_sptg,
                sum(case
                      when jb.spzt = '50' then
                       1
                      else
                       0
                    end) over(partition by jb.bbq) ybs_spbtg
  from (SELECT '����ʡ�ص�������ҵ����������' bbmc,
               y.username qymc,
               '�±�' bblx,
               x.sf sf,
               x.sh || x.x dq,
               case
                 when x1.a7 is null and x1.username_ is not null then
                  '10'
                 else
                  x1.a7
               end spzt,
               x1.username_ tbqy,
               x1.bbq_ bbq
          FROM ul_JSSZDWLQYYXQKJK_YB_ y
          LEFT JOIN bizuser.zwxt_qyjbxx x
            ON x.qydm = y.userid
          LEFT JOIN IJSYB_XXB1 x1
            ON x1.userid_ = y.userid
         WHERE y.btype = 0) jb
union all
select distinct jb.bbmc,
                jb.bblx,
                jb.bbq,
                jb.dq,
                count(nvl(jb.dq, '����ʡ')) over(partition by jb.dq) ybs,
                --(select count(*) from ul_JSSZDWLQYYXQKJK_YB_ where btype = 0) ybs,
                sum(case
                      when jb.spzt = '10' then
                       1
                      when jb.spzt = '20' then
                       1
                      when jb.spzt = '30' then
                       1
                      when jb.spzt = '40' then
                       1
                      else
                       0
                    end) over(partition by jb.bbq) ybs_dsp,
                sum(case
                      when jb.spzt = '60' then
                       1
                      else
                       0
                    end) over(partition by jb.bbq) ybs_sptg,
                sum(case
                      when jb.spzt = '50' then
                       1
                      else
                       0
                    end) over(partition by jb.bbq) ybs_spbtg
  from (SELECT '���ղִ�ָ������' bbmc,
               y.username qymc,
               '�±�' bblx,
               x.sf sf,
               x.sh || x.x dq,
               case
                 when x1.a7 is null and x1.username_ is not null then
                  '10'
                 else
                  x1.a7
               end spzt,
               x1.username_ tbqy,
               x1.bbq_ bbq
          FROM ul_JSCCZSDC_YB_ y
          LEFT JOIN bizuser.zwxt_qyjbxx x
            ON x.qydm = y.userid
          LEFT JOIN IJSYB_XXB x1
            ON x1.userid_ = y.userid
         WHERE y.btype = 0) jb
union all
select distinct jb.bbmc,
                jb.bblx,
                jb.bbq,
                jb.dq,
                count(nvl(jb.dq, '����ʡ')) over(partition by jb.dq) ybs,
                --(select count(*) from ul_JSSZDWLQYYXQKJK_YB_ where btype = 0) ybs,
                sum(case
                      when jb.spzt = '10' then
                       1
                      when jb.spzt = '20' then
                       1
                      when jb.spzt = '30' then
                       1
                      when jb.spzt = '40' then
                       1
                      else
                       0
                    end) over(partition by jb.bbq) ybs_dsp,
                sum(case
                      when jb.spzt = '60' then
                       1
                      else
                       0
                    end) over(partition by jb.bbq) ybs_sptg,
                sum(case
                      when jb.spzt = '50' then
                       1
                      else
                       0
                    end) over(partition by jb.bbq) ybs_spbtg
  from (SELECT '��·�����˼۲ɼ���' bbmc,
               y.username qymc,
               '�±�' bblx,
               x.sf sf,
               x.sh || x.x dq,
               case
                 when x1.a7 is null and x1.username_ is not null then
                  '10'
                 else
                  x1.a7
               end spzt,
               x1.username_ tbqy,
               x1.bbq_ bbq
          FROM ul_GLWLYJCJB_YB_ y
          LEFT JOIN bizuser.zwxt_qyjbxx x
            ON x.qydm = y.userid
          LEFT JOIN IGLYB_XXB x1
            ON x1.userid_ = y.userid
         WHERE y.btype = 0) jb
union all
select distinct jb.bbmc,
                jb.bblx,
                jb.bbq,
                jb.dq,
                count(nvl(jb.dq, '����ʡ')) over(partition by jb.dq) ybs,
                --(select count(*) from ul_JSSZDWLQYYXQKJK_YB_ where btype = 0) ybs,
                sum(case
                      when jb.spzt = '10' then
                       1
                      when jb.spzt = '20' then
                       1
                      when jb.spzt = '30' then
                       1
                      when jb.spzt = '40' then
                       1
                      else
                       0
                    end) over(partition by jb.bbq) ybs_dsp,
                sum(case
                      when jb.spzt = '60' then
                       1
                      else
                       0
                    end) over(partition by jb.bbq) ybs_sptg,
                sum(case
                      when jb.spzt = '50' then
                       1
                      else
                       0
                    end) over(partition by jb.bbq) ybs_spbtg
  from (SELECT '���ղֿ�۸�ָ������' bbmc,
               y.username qymc,
               '�±�' bblx,
               x.sf sf,
               x.sh || x.x dq,
               case
                 when x1.a7 is null and x1.username_ is not null then
                  '10'
                 else
                  x1.a7
               end spzt,
               x1.username_ tbqy,
               x1.bbq_ bbq
          FROM ul_JSCKJGZSDC_YB_ y
          LEFT JOIN bizuser.zwxt_qyjbxx x
            ON x.qydm = y.userid
          LEFT JOIN IJSYB_XXB2 x1
            ON x1.userid_ = y.userid
         WHERE y.btype = 0) jb;
 