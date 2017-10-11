using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class PlansDAL
    {
        /// <summary>
        /// 加载全部的销售计划信息
        /// </summary>
        /// <returns></returns>
        public static List<Plans> LoadByChanID(int chanID)
        {
            return BaseDAL.Select<Plans>("select * from Plans where ChanID=@ChanID"
                , new SqlParameter("@ChanID", chanID));
        }

        /// <summary>
        /// 添加销售计划
        /// </summary>
        public static int InsertPlanContent(int chanID, string planContent)
        {
            if (string.IsNullOrEmpty(planContent))
                throw new Exception("计划内容为空");
            Plans p = new Plans()
            {
                ChanID = chanID,
                PlanContent = planContent,
                PlanDate = DateTime.Now
            };
            return BaseDAL.Insert(p);
        }

        /// <summary>
        /// 得到失败原因
        /// </summary>
        public static string GetChanError(int chanID)
        {
            Chances chan = BaseDAL.Find<Chances>(chanID);
            return chan == null ? string.Empty : chan.ChanError;
        }

        /// <summary>
        /// 更新销售机会的状态
        /// </summary>
        public static int UpdateChanState(int chanID, int chanState, string chanError, int userID)
        {
            if (chanState != 3 && chanState != 4)
                throw new Exception("状态只能是3（成功）或4（失败）");
            if (chanState == 4 && string.IsNullOrEmpty(chanError))
                throw new Exception("必须填写失败原因！");
            //找到销售机会
            var Chan = BaseDAL.Find<Chances>(chanID);
            if (Chan == null) return 0;

            //更新状态
            Chan.ChanState = chanState;
            Chan.ChanError = chanError;
            int count = BaseDAL.Update(Chan);

            // 如果是成功
            if (chanState == 3 && count > 0)
            {
                //添加新客户
                //UserID = 当前登陆人的ID
                Customers c = new Customers() { 
                    UserID = userID,
                    CusName = Chan.ChanName,
                    CusDate = DateTime.Now,
                    CusState = 1
                };
                BaseDAL.Insert(c);
            }
            return count;
        }

        /// <summary>
        /// 更新计划的执行结果
        /// </summary>
        public static int UpdatePlan(int planID, string planResult)
        {
            Plans p = BaseDAL.Find<Plans>(planID);
            if (p == null) return 0;
            p.PlanResult = planResult;
            p.PlanResultDate = DateTime.Now;
            return BaseDAL.Update(p);
        }
    }
}
