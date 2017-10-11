using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class Menu
    {
        public int ID { get; set; }
        public string MenuName { get; set; }
        public int? ParentID { get; set; }
        public string Url { get; set; }
        public string Icon { get; set; }
    }

    public class MenuV2
    {
        public int ID { get; set; }
        public string MenuName { get; set; }
        public int? ParentID { get; set; }
        public string Url { get; set; }
        public string Icon { get; set; }
        public bool Checked { get; set; }
        public List<MenuV2> SubMenus { get; set; }
    }
}
