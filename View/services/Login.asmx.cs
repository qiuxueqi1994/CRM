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
    /// Login 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class Login : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        public Users LoginTo(string name, string pwd)
        {
            Users u = UsersDAL.Login(name, pwd);
            if (u != null)
            {
                u.UserLPWD = "";
                Session["user"] = u;
            }
            return u;
        }

        [WebMethod(EnableSession = true)]
        public void Logout()
        {
            Session["user"] = null;
        }

        [WebMethod]
        public bool IsLoginNameTrue(string name)
        {
            return UsersDAL.IsLoginNameTrue(name);
        }
    }
}
