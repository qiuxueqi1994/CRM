using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace View
{
    /// <summary>
    /// Menu 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class Menu : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        public List<MenuV2> LoadMenus()
        {
            //得到当前登陆人
            Users u = Session["user"] as Users;
            if (u == null) return null;
            if (u.RoleID == null) return null;
            //查询当前登陆人的所属角色的权限
            return Controller.PowerDAL.SelectPowers(u.RoleID.Value);
        }
    }
}
