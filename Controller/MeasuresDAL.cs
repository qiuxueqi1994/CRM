using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class MeasuresDAL
    {
        /// <summary>
        /// 查询指定客户的暂缓措施
        /// </summary>
        public static List<Measures> LoadByCLID(int clID)
        {
            return BaseDAL.Select<Measures>("select * from Measures where CLID=" + clID);
        }

        /// <summary>
        /// 插入指定客户的暂缓措施细节
        /// </summary>
        public static int Insert(string meDesc, int clID)
        {
            Measures me = new Measures()
            {
                CLID = clID,
                MeDate = DateTime.Now,
                MeDesc = meDesc
            };
            return BaseDAL.Insert(me);
        }

    }
}
