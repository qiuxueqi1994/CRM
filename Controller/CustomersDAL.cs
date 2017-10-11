using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class CustomersDAL
    {
        /// <summary>
        /// 分页查询
        /// </summary>
        public static PagingList<V_Customers> LoadPaging(int pageSize, int pageIndex, string cusID, string cusName)
        {
            string whereSql = "CusState=1 and CusID like @cusid and CusName like @cusname";
            SqlParameter[] pars = new SqlParameter[] { 
                new SqlParameter("@cusid", "%"+cusID+"%"),
                new SqlParameter("@cusname", "%"+cusName+"%")
            };
            return BaseDAL.Paging<V_Customers>(pageSize, pageIndex, whereSql, pars);
        }

        /// <summary>
        /// 查询指定客户的信息
        /// </summary>
        public static V_Customers LoadCustomerByID(int cusID)
        {
            return BaseDAL.Find<V_Customers>(cusID);
        }

        /// <summary>
        /// 修改未流失客户的资料
        /// </summary>
        public static int Update(Customers cus)
        {
            cus.CusState = 1; //只有未流失的客户才有修改，所以无论怎样改，都是1
            return BaseDAL.Update(cus);
        }

        /// <summary>
        /// 客户流失
        /// </summary>
        public static int CusLost(int cusID)
        {
            return BaseDAL.ExecuteNonQuery("update Customers set CusState=2 where CusID=" + cusID);
        }
    }
}
