using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class ActivitysDAL
    {
        /// <summary>
        /// 加载与指定客户的交往记录
        /// </summary>
        public static List<Activitys> LoadByCusID(int cusID)
        {
            return BaseDAL.Select<Activitys>("select * from Activitys where CusID=@CusID", new SqlParameter("CusID", cusID));
        }

        public static int Insert(Activitys activity)
        {
            return BaseDAL.Insert(activity);
        }

        public static int Update(Activitys activity)
        {
            return BaseDAL.Update(activity);
        }

        public static int Remove(int id)
        {
            return BaseDAL.Delete<Activitys>(id);
        }

        public static Activitys Find(int id)
        {
            return BaseDAL.Find<Activitys>(id);
        }
    }
}
