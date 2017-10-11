using Controller;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace View.services
{
    /// <summary>
    /// Sale 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class Sale : System.Web.Services.WebService
    {
        #region SaleChance
        [WebMethod(EnableSession = true)]
        public PagingList<Chances> LoadSalePading(int pageIndex, int pageSize)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 5)) return null;
            return ChancesDAL.PadingSaleChance(pageSize, pageIndex);
        }

        [WebMethod(EnableSession = true)]
        public Chances Find(int chanID)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 5)) return null;
            return BaseDAL.Find<Chances>(chanID);
        }

        [WebMethod(EnableSession = true)]
        public int Insert(Chances chance)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 5)) return -1001;
            chance.ChanCreateMan = (Session["user"] as Users).UserID;
            return ChancesDAL.InsertSaleChance(chance);
        }

        [WebMethod(EnableSession = true)]
        public int UpdatePart(Chances chance)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 5)) return -1001;
            return ChancesDAL.UpdateSaleChance(chance);
        }

        [WebMethod(EnableSession = true)]
        public int Remove(int chanID)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 5)) return -1001;
            return BaseDAL.Delete<Chances>(chanID);
        } 
        #endregion

        #region SaleAllot
        [WebMethod(EnableSession = true)]
        public PagingList<v_chances> LoadSaleAllotPading(int pageSize, int pageIndex, string chanName, string chanLinkMan, string chanCreateManName, string chanDueManName)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 6)) return null;
            return ChancesDAL.PadingSaleAllot(pageSize, pageIndex, chanName, chanLinkMan, chanCreateManName, chanDueManName);
        }

        [WebMethod]
        public List<Users> LoadChanDueManNameList(string nameCode)
        {
            return UsersDAL.LoadUsersByName(nameCode);
        }

        [WebMethod(EnableSession = true)]
        public int UpdateChanDueMan(int? chanDueMan, int chanID)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 6)) return -1001;
            return ChancesDAL.UpdateChanDueMan(chanDueMan, chanID);
        }
        #endregion

        #region SaleManager
        [WebMethod(EnableSession = true)]
        public PagingList<Chances> LoadSaleManagerPading(int pageIndex, int pageSize)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 7)) return null;
            return ChancesDAL.PadingSaleManager(pageSize, pageIndex);
        } 

        [WebMethod(EnableSession = true)]
        public List<Plans> LoadPlansByChanID(int chanID)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 7)) return null;
            return PlansDAL.LoadByChanID(chanID);
        }

        [WebMethod(EnableSession = true)]
        public int InsertPlanContent(int chanID, string planContent)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 7)) return -1001;
            return PlansDAL.InsertPlanContent(chanID, planContent);
        }

        [WebMethod(EnableSession = true)]
        public int UpdatePlan(int planID, string planResult)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 7)) return -1001;
            return PlansDAL.UpdatePlan(planID, planResult);
        }

        [WebMethod(EnableSession = true)]
        public int UpdateChanState(int chanID, int chanState, string chanError)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 7)) return -1001;
            return PlansDAL.UpdateChanState(chanID, chanState, chanError, (Session["user"] as Users).UserID);
        }

        #endregion
    }
}
