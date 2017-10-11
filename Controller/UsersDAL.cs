using Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class UsersDAL
    {
        /// <summary>
        /// 判断用户名密码是否正确
        /// </summary>
        public static Users Login(string name, string pwd)
        {

            return BaseDAL.Find<Users>("select * from Users where UserLName=@name and UserLPWD=@pwd",
                new SqlParameter("@name", name), new SqlParameter("@pwd", BitConverter.ToString(MD5.Create().ComputeHash(Encoding.Default.GetBytes(pwd)))));
        }

        /// <summary>
        /// 检查用户名是否存在
        /// </summary>
        public static bool IsLoginNameTrue(string name)
        {
            return Convert.ToInt32(BaseDAL.ExecuteScalar("select count(*) from Users where UserLName=@name", new SqlParameter("@name", name))) > 0;
        }

        /// <summary>
        /// 根据姓名模糊查询
        /// </summary>
        public static List<Users> LoadUsersByName(string nameCode)
        {
            List<Users> users = BaseDAL.Select<Users>("select top 10 * from Users where UserName like @nameCode or UserCode like @nameCode order by UserID desc", new SqlParameter("@nameCode", "%" + nameCode + "%"));
            foreach (var u in users)
                u.UserLPWD = "";
            return users;
        }

        public static PagingList<v_users> LoadUsersPaging(int pageSize, int pageIndex)
        {
            PagingList<v_users> ulist = BaseDAL.Paging<v_users>(pageSize, pageIndex);
            for (int i = 0; i < ulist.Data.Count; i++)
                ulist.Data[i].UserLPWD = string.Empty;    // 不返回密码
            return ulist;
        }

        public static int AddUser(Users u)
        {
            u.UserLPWD = BitConverter.ToString(MD5.Create().ComputeHash(Encoding.Default.GetBytes(u.UserLPWD)));
            return BaseDAL.Insert(u);
        }

        public static int UpdateUser(Users u)
        {
            if (string.IsNullOrWhiteSpace(u.UserLPWD))
                u.UserLPWD = BaseDAL.Find<Users>(u.UserID).UserLPWD;
            else
                u.UserLPWD = BitConverter.ToString(MD5.Create().ComputeHash(Encoding.Default.GetBytes(u.UserLPWD)));
            return BaseDAL.Update(u);
        }

        public static int RemoveUser(int uid)
        {
            return BaseDAL.Delete<Users>(uid);
        }

        /// <summary>
        /// 统计角色下共有多少个用户
        /// </summary>
        public static int CountUserByRole(int roleID)
        {
            return Convert.ToInt32(BaseDAL.ExecuteScalar("select count(*) from Users where roleid=" + roleID));
        }

        /// <summary>
        /// 检查密码是否正确
        /// </summary>
        public static int CheckOldPwd(string pwd, int userID)
        {
            return Convert.ToInt32(BaseDAL.ExecuteScalar("select count(*) from Users where UserID=@UserID and UserLPWD=@UserLPWD"
                , new SqlParameter("@UserID", userID), new SqlParameter("@UserLPWD", BitConverter.ToString(MD5.Create().ComputeHash(Encoding.Default.GetBytes(pwd))))));
        }

        /// <summary>
        /// 修改密码
        /// </summary>
        public static int UpdatePwd(string pwd, int userID)
        {
            Users u = BaseDAL.Find<Users>(userID);
            u.UserLPWD = BitConverter.ToString(MD5.Create().ComputeHash(Encoding.Default.GetBytes(pwd)));
            return BaseDAL.Update(u);
        }
    }
}
