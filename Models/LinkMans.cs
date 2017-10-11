using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    /// <summary>
    /// 客户联系人表
    /// </summary>
    public class LinkMans
    {
        /// <summary>
        /// 联系人编号
        /// </summary>
        public int LMID { get; set; }
        /// <summary>
        /// 客户编号
        /// </summary>
        public int? CusID { get; set; }
        public string LMName { get; set; }
        public string LMSex { get; set; }
        /// <summary>
        /// 职位
        /// </summary>
        public string LMDuty { get; set; }
        /// <summary>
        /// 移动手机号码
        /// </summary>
        public string LMMobileNo { get; set; }
        /// <summary>
        /// 办公室电话
        /// </summary>
        public string LMOfficeNo { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string LMMemo { get; set; }
    }
}
