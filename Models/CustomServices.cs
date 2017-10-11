using System;

namespace Models
{
    /// <summary>
    /// 客户服务处理
    /// </summary>
    public class CustomServices
    {
        /// <summary>
        /// 客户服务处理ID 
        /// </summary>
        public int CSID { get; set; }
        /// <summary>
        /// 服务类型ID 
        /// </summary>
        public int? STID { get; set; }
        /// <summary>
        /// 客户编号
        /// </summary>
        public int? CusID { get; set; }
        /// <summary>
        /// 概要
        /// </summary>
        public string CSTitle { get; set; }
        /// <summary>
        /// 服务状态
        /// 1=新创建，2=已分配，3=已处理，4=已归档 
        /// </summary>
        public int? CSState { get; set; }
        /// <summary>
        /// 服务请求
        /// </summary>
        public string CSDesc { get; set; }
        /// <summary>
        /// 创建人ID
        /// </summary>
        public int? CSCreateID { get; set; }
        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime? CSCreateDate { get; set; }
        /// <summary>
        /// 指派人ID 
        /// </summary>
        public int? CSDueID { get; set; }
        /// <summary>
        /// 指派时间
        /// </summary>
        public DateTime? CSDueDate { get; set; }
        /// <summary>
        /// 服务处理
        /// </summary>
        public string CSDeal { get; set; }
        /// <summary>
        /// 处理时间
        /// </summary>
        public DateTime? CSDealDate { get; set; }
        /// <summary>
        /// 处理结果
        /// </summary>
        public string CSResult { get; set; }
        /// <summary>
        /// 满意度
        /// 1-5之间数字 
        /// </summary>
        public int? CSSatisfy { get; set; }

    }
}
