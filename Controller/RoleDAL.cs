using Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class RoleDAL
    {
        public static PagingList<Role> LoadRolePaging(int pageSize, int pageIndex)
        {
            return BaseDAL.Paging<Role>(pageSize, pageIndex);
        }

        public static List<Role> LoadRole()
        {
            return BaseDAL.SelectAll<Role>();
        }

        public static int AddRole(Role r)
        {
            return BaseDAL.Insert(r);
        }

        public static int UpdateRole(Role r)
        {
            return BaseDAL.Update(r);
        }

        public static int RemoveRole(int rid)
        {
            return BaseDAL.Delete<Role>(rid);
        }
    }
}
