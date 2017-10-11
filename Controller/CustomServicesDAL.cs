using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class CustomServicesDAL
    {
        /// <summary>
        /// 新建服务
        /// </summary>
        public static int InsertService(CustomServices cusser, int createID)
        {
            cusser.CSState = 1;
            cusser.CSCreateDate = DateTime.Now;
            cusser.CSCreateID = createID;
            return BaseDAL.Insert(cusser);
        }

        /// <summary>
        /// 分页查询新建的服务
        /// </summary>
        public static PagingList<v_CustomServices> LoadServiceAllotPaging(int pageSize, int pageIndex)
        {
            return BaseDAL.Paging<v_CustomServices>(pageSize, pageIndex, "CSState in (1,2)");
        }

        /// <summary>
        /// 更改分配人
        /// </summary>
        public static int UpdateCSDueMan(int? csDueID, int csID)
        {
            CustomServices cs = BaseDAL.Find<CustomServices>(csID);
            if (csDueID == null)
            {
                cs.CSState = 1;
                cs.CSDueID = null;
                cs.CSDueDate = null;
            }
            else
            {
                cs.CSState = 2;
                cs.CSDueID = csDueID;
                cs.CSDueDate = DateTime.Now;
            }

            return BaseDAL.Update(cs);
        }

        /// <summary>
        /// 分页查询已分配的服务
        /// </summary>
        public static PagingList<v_CustomServices> LoadServiceDisposePaging(int pageSize, int pageIndex, int CSDueID)
        {
            return BaseDAL.Paging<v_CustomServices>(pageSize, pageIndex, "CSState=2 and CSDueID=" + CSDueID);
        }

        /// <summary>
        /// 查询指定数据
        /// </summary>
        public static v_CustomServices LoadServiceByID(int csID)
        {
            return BaseDAL.Find<v_CustomServices>(csID);
        }

        /// <summary>
        /// 录入服务处理，等待客户回应
        /// </summary>
        public static int SaveCSDeal(string csDeal, int csID)
        {
            SqlParameter[] pars = new SqlParameter[] { 
                new SqlParameter("@CSDeal", csDeal), 
                new SqlParameter("@CSDealDate", DateTime.Now), 
                new SqlParameter("@CSID", csID)
            };
            return BaseDAL.ExecuteNonQuery("update CustomServices set CSDeal=@CSDeal,CSDealDate=@CSDealDate,CSState=3 where CSID=@CSID", pars);
        }

        /// <summary>
        /// 分页查询已处理的服务
        /// </summary>
        public static PagingList<v_CustomServices> LoadServiceResultPaging(int pageSize, int pageIndex, int CSDueID)
        {
            return BaseDAL.Paging<v_CustomServices>(pageSize, pageIndex, "CSState=3 and CSDueID=" + CSDueID);
        }

        /// <summary>
        /// 录入处理结果，以及客户满意度，服务归档
        /// </summary>
        public static int SaveCSResult(string csResult, int csSatisfy, int csID)
        {
            SqlParameter[] pars = new SqlParameter[] { 
                new SqlParameter("@CSResult", csResult), 
                new SqlParameter("@CSSatisfy", csSatisfy), 
                new SqlParameter("@CSID", csID)
            };
            return BaseDAL.ExecuteNonQuery("update CustomServices set CSResult=@CSResult,CSSatisfy=@CSSatisfy,CSState=4 where CSID=@CSID", pars);
        }

        /// <summary>
        /// 分页查询已归档的服务
        /// </summary>
        public static PagingList<v_CustomServices> LoadServiceDetailPaging(int pageSize, int pageIndex, string cusName, string STID)
        {
            string whereSql = "CUSName like @CUSName and STID like @STID and CSState=4";
            SqlParameter[] pars = new SqlParameter[] { 
                new SqlParameter("@CUSName", "%"+cusName+"%"), 
                new SqlParameter("@STID", "%"+STID+"%") 
            };
            return BaseDAL.Paging<v_CustomServices>(pageSize, pageIndex, whereSql, pars);
        }
    }
}
