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
    /// CustomerService 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class CustomerService : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        public List<ServiceType> LoadServiceType()
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 10)) return null;
            return BaseDAL.SelectAll<ServiceType>();
        }

        [WebMethod(EnableSession = true)]
        public List<customers> Loadcustomers()
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 10)) return null;
            return BaseDAL.Select<customers>("select * from customers where CusState=1");
        }

        [WebMethod(EnableSession = true)]
        public int InsertService(CustomServices cusser)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 10)) return -1001;
            return CustomServicesDAL.InsertService(cusser, (Session["user"] as Users).UserID);
        }

        [WebMethod(EnableSession = true)]
        public PagingList<v_CustomServices> LoadServiceAllotPaging(int pageSize, int pageIndex)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 11)) return null;
            return CustomServicesDAL.LoadServiceAllotPaging(pageSize, pageIndex);
        }

        [WebMethod(EnableSession = true)]
        public int UpdateCSDueMan(int? csDueID, int csID)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 11)) return -1001;
            return CustomServicesDAL.UpdateCSDueMan(csDueID, csID);
        }

        [WebMethod(EnableSession = true)]
        public List<Users> LoadChanDueManNameList(string nameCode)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 11)) return null;
            return UsersDAL.LoadUsersByName(nameCode);
        }

        [WebMethod(EnableSession = true)]
        public PagingList<v_CustomServices> LoadServiceDisposePaging(int pageSize, int pageIndex)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 12)) return null;
            return CustomServicesDAL.LoadServiceDisposePaging(pageSize, pageIndex, (Session["user"] as Users).UserID);
        }

        [WebMethod(EnableSession = true)]
        public v_CustomServices LoadServiceByID(int csID)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 12)) return null;
            return CustomServicesDAL.LoadServiceByID(csID);
        }

        [WebMethod(EnableSession = true)]
        public int SaveCSDeal(string csDeal, int csID)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 12)) return -1001;
            return CustomServicesDAL.SaveCSDeal(csDeal, csID);
        }

        [WebMethod(EnableSession = true)]
        public PagingList<v_CustomServices> LoadServiceResultPaging(int pageSize, int pageIndex)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 13)) return null;
            return CustomServicesDAL.LoadServiceResultPaging(pageSize, pageIndex, (Session["user"] as Users).UserID);
        }

        [WebMethod(EnableSession = true)]
        public int SaveCSResult(string csResult, int csSatisfy, int csID)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 13)) return -1001;
            return CustomServicesDAL.SaveCSResult(csResult, csSatisfy, csID);
        }

        [WebMethod(EnableSession = true)]
        public PagingList<v_CustomServices> LoadServiceDetailPaging(int pageSize, int pageIndex, string cusName, string STID)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 14)) return null;
            return CustomServicesDAL.LoadServiceDetailPaging(pageSize, pageIndex, cusName, STID);
        }
    }
}
