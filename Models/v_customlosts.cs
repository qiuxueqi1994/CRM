using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class v_customlosts
    {
        /// <summary>
        /// 客户流失ID 
        /// </summary>
        public int CLID { get; set; }
        /// <summary>
        /// 客户编号
        /// </summary>
        public int? CusID { get; set; }
        /// <summary>
        /// 最后下单时间
        /// </summary>
        public DateTime? CLOrderDate { get; set; }
        /// <summary>
        /// 流失报警时间
        /// </summary>
        public DateTime? CLDate { get; set; }
        /// <summary>
        /// 不知道干嘛用的
        /// </summary>
        public string CLMeasures { get; set; }
        /// <summary>
        /// 流失确认时间
        /// </summary>
        public DateTime? CLEnterDate { get; set; }
        /// <summary>
        /// 流失原因
        /// </summary>
        public string CLReason { get; set; }
        /// <summary>
        /// 流失状态，1=流失报警，2=暂缓流失，3=确认流失 
        /// </summary>
        public int? CLState { get; set; }
        /// <summary>
        /// 客户名称
        /// </summary>
        public string CusName { get; set; }

    }
}
