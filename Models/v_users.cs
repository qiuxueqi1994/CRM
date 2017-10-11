using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class v_users
    {
        /// <summary>
        /// 用户编号
        /// </summary>
        public int UserID { get; set; }
        /// <summary>
        /// 角色ID 
        /// </summary>
        public int? RoleID { get; set; }
        /// <summary>
        /// 登录名
        /// </summary>
        public string UserLName { get; set; }
        /// <summary>
        /// 登录密码
        /// </summary>
        public string UserLPWD { get; set; }
        /// <summary>
        /// 真实姓名
        /// </summary>
        public string UserName { get; set; }
        /// <summary>
        /// 姓名简称
        /// </summary>
        public string UserCode { get; set; }
        /// <summary>
        /// 角色名称
        /// </summary>
        public string RoleName { get; set; }
    }
}
