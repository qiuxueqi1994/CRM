using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    /// <summary>
    /// List of columns of the table 销售机会表
    /// </summary>
    public class Chances
    {
        /// <summary>
        /// 销售机会ID 
        /// </summary>
        public int ChanID { get; set; }
        /// <summary>
        /// 客户名称
        /// </summary>
        public string ChanName { get; set; }
        /// <summary>
        /// 成功几率
        /// 0-100之间的数字 
        /// </summary>
        public int? ChanRate { get; set; }
        /// <summary>
        /// 联系人
        /// </summary>
        public string ChanLinkMan { get; set; }
        /// <summary>
        /// 联系电话
        /// </summary>
        public string ChanLinkTel { get; set; }
        /// <summary>
        /// 概要
        /// </summary>
        public string ChanTitle { get; set; }
        /// <summary>
        /// 机会描述
        /// </summary>
        public string ChanDesc { get; set; }
        /// <summary>
        /// 创建人
        /// 关联用户表的用户ID 
        /// </summary>
        public int? ChanCreateMan { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime? ChanCreateDate { get; set; }
        /// <summary>
        /// 指派人
        /// 关联用户表的用户ID
        /// 创建销售机会时指派人和指派时间为null，只有分配指派人后才会有数据 
        /// </summary>
        public int? ChanDueMan { get; set; }
        /// <summary>
        /// 指派时间
        /// </summary>
        public DateTime? ChanDueDate { get; set; }
        /// <summary>
        /// 销售机会状态
        /// 1=未指派,创建销售机会时的状态
        /// 2=开发中，当分配了指派人后，修改为该状态
        /// 3=开发成功
        /// 4=开发失败 
        /// </summary>
        public int? ChanState { get; set; }
        /// <summary>
        /// 失败原因
        /// 当状态为开发失败时，需要填写失败原因 
        /// </summary>
        public string ChanError { get; set; }

    }

}
