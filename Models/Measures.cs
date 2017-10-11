using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    /// <summary>
    /// 流失措施表
    /// </summary>
    public class Measures
    {
        public int MeID { get; set; }
        /// <summary>
        /// 客户流失ID
        /// </summary>
        public int? CLID { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime? MeDate { get; set; }
        /// <summary>
        /// 措施细节
        /// </summary>
        public string MeDesc { get; set; }

    }
}
