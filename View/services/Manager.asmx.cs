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
    /// Manager 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class Manager : System.Web.Services.WebService
    {

        #region Users
        [WebMethod(EnableSession = true)]
        public PagingList<v_users> LoadUsersPaging(int pageSize, int pageIndex)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 15)) return null;
            return UsersDAL.LoadUsersPaging(pageSize, pageIndex);
        }

        [WebMethod(EnableSession = true)]
        public int AddUser(Users u)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 15)) return -1001;
            return UsersDAL.AddUser(u);
        }

        [WebMethod(EnableSession = true)]
        public int UpdateUser(Users u)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 15)) return -1001;
            return UsersDAL.UpdateUser(u);
        }

        [WebMethod(EnableSession = true)]
        public int RemoveUser(int uid)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 15)) return -1001;
            if ((Session["user"] as Users).UserID == uid) return -2;
            return UsersDAL.RemoveUser(uid);
        }
        #endregion

        #region Role

        [WebMethod(EnableSession = true)]
        public PagingList<Role> LoadRolePaging(int pageSize, int pageIndex)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 16)) return null;
            return RoleDAL.LoadRolePaging(pageSize, pageIndex);
        }

        [WebMethod(EnableSession = true)]
        public List<Role> LoadRole()
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 15)) return null;
            return RoleDAL.LoadRole();
        }

        [WebMethod(EnableSession = true)]
        public int AddRole(Role r)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 16)) return -1001;
            return RoleDAL.AddRole(r);
        }

        [WebMethod(EnableSession = true)]
        public int UpdateRole(Role r)
        {
            if (Session["user"] == null) return -1000;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 16)) return -1001;
            return RoleDAL.UpdateRole(r);
        }

        [WebMethod(EnableSession = true)]
        public string RemoveRole(int rid)
        {
            if (Session["user"] == null) return -1000 + "";
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 16)) return -1001 + "";
            int userCount = UsersDAL.CountUserByRole(rid);
            return userCount > 0 ? userCount.ToString() : (RoleDAL.RemoveRole(rid) > 0 ? "true" : "false");
        }

        #endregion

        #region Power
        [WebMethod(EnableSession = true)]
        public List<MenuV2> LoadPowers(int RoleID)
        {
            if (Session["user"] == null) return null;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 17)) return null;
            return PowerDAL.SelectPowers(RoleID);
        }

        [WebMethod(EnableSession = true)]
        public bool UpdatePowers(int RoleID, int[] Powers)
        {
            if (Session["user"] == null) return false;
            if (!PowerDAL.HasPower((Session["user"] as Users).RoleID.Value, 17)) return false;
            return PowerDAL.UpdatePowers(RoleID, Powers);
        }
        #endregion
    }
}
