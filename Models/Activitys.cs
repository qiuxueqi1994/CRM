using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    /// <summary>
    /// 交往记录
    /// </summary>
    public class Activitys
    {
        public int ActID { get; set; }
        /// <summary>
        /// 客户编号
        /// </summary>
        public int? CusID { get; set; }
        /// <summary>
        /// 交往时间
        /// </summary>
        public DateTime? ActDate { get; set; }
        /// <summary>
        /// 交往地点
        /// </summary>
        public string ActAdd { get; set; }
        /// <summary>
        /// 概要
        /// </summary>
        public string ActTitle { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string ActMemo { get; set; }
        /// <summary>
        /// 详细信息
        /// </summary>
        public string ActDesc { get; set; }
    }
}
