using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class ChancesDAL
    {
        /// <summary>
        /// 分页加载未分配销售机会信息
        /// </summary>
        public static PagingList<Chances> PadingSaleChance(int pageSize, int pageIndex)
        {
            return BaseDAL.Paging<Chances>(pageSize, pageIndex, "ChanState=1");
        }

        /// <summary>
        /// 添加新的销售机会信息
        /// </summary>
        public static int InsertSaleChance(Chances chance)
        {
            chance.ChanCreateDate = DateTime.Now;
            chance.ChanState = 1;
            return BaseDAL.Insert(chance);
        }

        /// <summary>
        /// 修改未分配销售机会信息
        /// </summary>
        public static int UpdateSaleChance(Chances chance)
        {
            Chances old = BaseDAL.Find<Chances>(chance.ChanID);
            old.ChanName = chance.ChanName;
            old.ChanLinkMan = chance.ChanLinkMan;
            old.ChanLinkTel = chance.ChanLinkTel;
            old.ChanTitle = chance.ChanTitle;
            old.ChanDesc = chance.ChanDesc;
            old.ChanRate = chance.ChanRate;
            return BaseDAL.Update(old);
        }

        /// <summary>
        /// 分页加载销售机会分配信息
        /// </summary>
        public static PagingList<v_chances> PadingSaleAllot(int pageSize, int pageIndex, string chanName, string chanLinkMan, string chanCreateManName, string chanDueManName)
        {
            SqlParameter[] pars = new SqlParameter[]{
                new SqlParameter("@ChanName", "%"+chanName+"%"),
                new SqlParameter("@ChanLinkMan", "%"+chanLinkMan+"%"),
                new SqlParameter("@ChanCreateManName", "%"+chanCreateManName+"%"),
                new SqlParameter("@ChanDueManName", "%"+chanDueManName+"%")
            };
            return BaseDAL.Paging<v_chances>(pageSize, pageIndex, "ChanState in (1,2) and ChanName like @ChanName and ChanLinkMan like @ChanLinkMan and ChanCreateManName like @ChanCreateManName and ChanDueManName like @ChanDueManName", pars);
        }

        /// <summary>
        /// 分配人
        /// </summary>
        public static int UpdateChanDueMan(int? chanDueMan, int chanID)
        {
            Chances ch = BaseDAL.Find<Chances>(chanID);
            if(chanDueMan == null)
            {
                ch.ChanState = 1;
                ch.ChanDueDate = null;
                ch.ChanDueMan = null;
            }
            else
            {
                ch.ChanState = 2;
                ch.ChanDueDate = DateTime.Now;
                ch.ChanDueMan = chanDueMan;
            }

            return BaseDAL.Update(ch);
        }

        /// <summary>
        /// 分页加载已分配销售机会信息
        /// </summary>
        public static PagingList<Chances> PadingSaleManager(int pageSize, int pageIndex)
        {
            return BaseDAL.Paging<Chances>(pageSize, pageIndex, "ChanState>1");
        }
    }
}
