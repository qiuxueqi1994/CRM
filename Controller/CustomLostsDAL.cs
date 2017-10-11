using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class CustomLostsDAL
    {
        /// <summary>
        /// 检查流失报警
        /// </summary>
        private static void Lost()
        {
            BaseDAL.ExecuteNonQuery("exec p_lost");
        }

        /// <summary>
        /// 分页查询所有客户
        /// </summary>
        public static PagingList<v_customlosts> LoadCustomlostsPaging(int pageSize, int pageIndex)
        {
            Lost();
            return BaseDAL.Paging<v_customlosts>(pageSize, pageIndex);
        }

        /// <summary>
        /// 确认客户流失
        /// </summary>
        public static int SaveCLReason(string clReason, int clID)
        {
            CustomLosts cl = BaseDAL.Find<CustomLosts>(clID);
            cl.CLReason = clReason;
            cl.CLEnterDate = DateTime.Now;
            cl.CLState = 3;
            if (BaseDAL.Update(cl) > 0)
                return CustomersDAL.CusLost(cl.CusID.Value);
            return 0;
        }

        /// <summary>
        /// 更改状态为暂缓
        /// </summary>
        public static int UpdateStateTo2(int clID)
        {
            return BaseDAL.ExecuteNonQuery("update CustomLosts set CLState=2 where CLID=" + clID);
        }

        /// <summary>
        /// 查询指定客户流失原因
        /// </summary>
        public static string SelectClReason(int clID)
        {
            return Convert.ToString(BaseDAL.ExecuteScalar("select CLReason from CustomLosts where CLID=" + clID));
        }
    }
}
