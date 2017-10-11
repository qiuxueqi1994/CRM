using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Models
{
    public class V_Customers
    {
        /// <summary>
        /// 客户编号
        /// </summary>
        public int CusID { get; set; }
        /// <summary>
        /// 客户经理编号
        /// </summary>
        public int? UserID { get; set; }
        /// <summary>
        /// 客户姓名
        /// </summary>
        public string CusName { get; set; }
        /// <summary>
        /// 地址
        /// </summary>
        public string CusAddress { get; set; }
        /// <summary>
        /// 邮编
        /// </summary>
        public string CusZip { get; set; }
        /// <summary>
        /// 传真
        /// </summary>
        public string CusFax { get; set; }
        /// <summary>
        /// 网址
        /// </summary>
        public string CusWebsite { get; set; }
        /// <summary>
        /// 营业执照注册号
        /// </summary>
        public string CusLicenceNo { get; set; }
        /// <summary>
        /// 法人
        /// </summary>
        public string CusChieftain { get; set; }
        /// <summary>
        /// 注册资金, 单位（万元） 
        /// </summary>
        public int? CusBankroll { get; set; }
        /// <summary>
        /// 年营业额, 单位（万元） 
        /// </summary>
        public int? CusTurnover { get; set; }
        /// <summary>
        /// 开户银行
        /// </summary>
        public string CusBank { get; set; }
        /// <summary>
        /// 银行账号
        /// </summary>
        public string CusBankNo { get; set; }
        /// <summary>
        /// 地税登记号
        /// </summary>
        public string CusLocalTaxNo { get; set; }
        /// <summary>
        /// 国税登记号
        /// </summary>
        public string CusNationalTaxNo { get; set; }
        /// <summary>
        /// 建立时间,系统时间
        /// </summary>
        public DateTime? CusDate { get; set; }
        /// <summary>
        /// 客户状态
        /// 1=正常, 2=流失 
        /// </summary>
        public int? CusState { get; set; }
        /// <summary>
        /// 本公司客户经理
        /// </summary>
        public string UserName { get; set; }
    }
}
