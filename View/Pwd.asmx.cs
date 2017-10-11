using Controller;
using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace View
{
    /// <summary>
    /// Pwd 的摘要说明
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // 若要允许使用 ASP.NET AJAX 从脚本中调用此 Web 服务，请取消注释以下行。 
    [System.Web.Script.Services.ScriptService]
    public class Pwd : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        public int CheckOldPwd(string pwd)
        {
            if(Session["user"] == null) return -1000;
            return UsersDAL.CheckOldPwd(pwd, (Session["user"] as Users).UserID);
        }

        [WebMethod(EnableSession = true)]
        public int UpdatePwd(string pwd)
        {
            if (Session["user"] == null) return -1000;
            return UsersDAL.UpdatePwd(pwd, (Session["user"] as Users).UserID);
        }
    }
}
