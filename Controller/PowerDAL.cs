using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class PowerDAL
    {
        private static List<MenuV2> SelectSubPowers(int RoleID = 0, int ParentID = 0)
        {
            List<MenuV2> list = BaseDAL.Select<MenuV2>(string.Format(@"select m.*
,convert(bit, case when p.id is not null then 1 else 0 end) as Checked
,null SubMenus
from Menu m
left join Power p on p.RoleID={0} and m.ID=p.MenuID
where m.ParentID={1}", RoleID, ParentID));
            return list;
        }

        /// <summary>
        /// 根据角色ID查询其权限
        /// </summary>
        public static List<MenuV2> SelectPowers(int RoleID)
        {
            //查出一级菜单
            var menus = SelectSubPowers(RoleID);
            //循环查询二级菜单
            for (int i = 0; i < menus.Count; i++)
            {
                menus[i].SubMenus = SelectSubPowers(RoleID, menus[i].ID);
            }
            //返回结果
            return menus;
        }

        /// <summary>
        /// 更新权限
        /// </summary>
        public static bool UpdatePowers(int rid, int[] Powers)
        {
            try
            {
                //先删除原有权限
                BaseDAL.ExecuteNonQuery("delete Power where RoleID=" + rid);
                //添加新的权限
                foreach (var item in Powers)
                {
                    if (Convert.ToInt32(BaseDAL.ExecuteScalar("select count(*) from Power where RoleID=" + rid + " and MenuID=" + item)) == 0)
                        BaseDAL.ExecuteNonQuery("insert into Power (RoleID, MenuID) values (" + rid + ", " + item + ")");
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// 判断指定角色是否拥有指定菜单权限
        /// </summary>
        public static bool HasPower(int roleID, int menuID)
        {
            return Convert.ToInt32(BaseDAL.ExecuteScalar(string.Format("select count(*) from Power where RoleID={0} and MenuID={1}", roleID, menuID))) > 0;
        }
    }
}
