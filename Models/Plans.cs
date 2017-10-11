using System;

namespace Models
{
    /// <summary>
    ///  销售计划表
    /// </summary>
    public class Plans
    {
        public int PlanID { get; set; }
        public int? ChanID { get; set; }
        public DateTime? PlanDate { get; set; }
        public string PlanContent { get; set; }
        public DateTime? PlanResultDate { get; set; }
        public string PlanResult { get; set; }

    }
}
