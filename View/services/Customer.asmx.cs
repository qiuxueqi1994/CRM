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
    /// Customer 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class Customer : System.Web.Services.WebService
    {
        #region Customer

        [WebMethod(EnableSession = true)]
        public PagingList<V_Customers> LoadCustomerPage(int pageSize, int pageIndex, string cusID, string cusName)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 8)) return null;
            return CustomersDAL.LoadPaging(pageSize, pageIndex, cusID, cusName);
        }

        [WebMethod(EnableSession = true)]
        public V_Customers LoadCustomerByID(int cusID)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 8)) return null;
            return CustomersDAL.LoadCustomerByID(cusID);
        }


        [WebMethod(EnableSession = true)]
        public int UpdateCustomer(Customers cus)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 8)) return -1001;
            return CustomersDAL.Update(cus);
        }
        #endregion

        #region LinkMans
        [WebMethod(EnableSession = true)]
        public List<LinkMans> LoadLinkMans(int cusID)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 8)) return null;
            return LinkMansDAL.LoadByCusID(cusID);
        }

        [WebMethod(EnableSession = true)]
        public int InsertLinkMan(LinkMans linkMan)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 8)) return -1001;
            return LinkMansDAL.Insert(linkMan);
        }

        [WebMethod(EnableSession = true)]
        public LinkMans FindLinkMan(int id)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 8)) return null;
            return LinkMansDAL.Find(id);
        }

        [WebMethod(EnableSession = true)]
        public int UpdateLinkMan(LinkMans linkMan)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 8)) return -1001;
            return LinkMansDAL.Update(linkMan);
        }

        [WebMethod(EnableSession = true)]
        public int DeleteLinkMan(int id)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 8)) return -1001;
            return LinkMansDAL.Remove(id);
        }
        #endregion

        #region Activitys
        [WebMethod(EnableSession = true)]
        public List<Activitys> LoadActivitys(int cusID)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 8)) return null;
            return ActivitysDAL.LoadByCusID(cusID);
        }

        [WebMethod(EnableSession = true)]
        public int InsertActivity(Activitys activity)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 8)) return -1001;
            return ActivitysDAL.Insert(activity);
        }

        [WebMethod(EnableSession = true)]
        public Activitys FindActivity(int id)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 8)) return null;
            return ActivitysDAL.Find(id);
        }

        [WebMethod(EnableSession = true)]
        public int UpdateActivity(Activitys activity)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 8)) return -1001;
            return ActivitysDAL.Update(activity);
        }

        [WebMethod(EnableSession = true)]
        public int DeleteActivity(int id)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 8)) return -1001;
            return ActivitysDAL.Remove(id);
        }
        #endregion

        #region Customlosts
        [WebMethod(EnableSession = true)]
        public PagingList<v_customlosts> LoadCustomlostsPaging(int pageSize, int pageIndex)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 9)) return null;
            return CustomLostsDAL.LoadCustomlostsPaging(pageSize, pageIndex);
        }

        [WebMethod(EnableSession = true)]
        public List<Measures> LoadMeasures(int clID)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 9)) return null;
            return MeasuresDAL.LoadByCLID(clID);
        }

        [WebMethod(EnableSession = true)]
        public int InsertMeasures(string meDesc, int clID, int state)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 9)) return -1001;
            if (state == 1) CustomLostsDAL.UpdateStateTo2(clID);
            return MeasuresDAL.Insert(meDesc, clID);
        }

        [WebMethod(EnableSession = true)]
        public int SaveCLReason(string clReason, int clID)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 9)) return -1001;
            return CustomLostsDAL.SaveCLReason(clReason, clID);
        }

        [WebMethod]
        public string SelectClReason(int clID)
        {
            return CustomLostsDAL.SelectClReason(clID);
        }
        #endregion

    }
}
