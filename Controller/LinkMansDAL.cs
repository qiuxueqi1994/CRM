using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class LinkMansDAL
    {
        /// <summary>
        /// 查询指定客户公司下的所有联系人信息
        /// </summary>
        public static List<LinkMans> LoadByCusID(int cusID)
        {
            return BaseDAL.Select<LinkMans>("select * from LinkMans where CusID=@CusID", new SqlParameter("CusID", cusID));
        }


        public static int Insert(LinkMans linkMan)
        {
            return BaseDAL.Insert(linkMan);
        }

        public static int Update(LinkMans linkMan)
        {
            return BaseDAL.Update(linkMan);
        }

        public static int Remove(int id)
        {
            return BaseDAL.Delete<LinkMans>(id);
        }

        public static LinkMans Find(int id)
        {
            return BaseDAL.Find<LinkMans>(id);
        }
    }
}
