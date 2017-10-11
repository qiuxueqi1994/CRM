using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Controller
{
    public class PagingList<T>
    {
        public List<T> Data { get; set; }
        public int Total { get; set; }
    }
        
    public class BaseDAL
    {
        #region 数据库连接字符串
        public static string ConnectionString { get; set; }

        static BaseDAL()
        {
            ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["conn"].ConnectionString;
        }
        #endregion

        #region 操作数据库方法

        public static int ExecuteNonQuery(string sql, params SqlParameter[] pars)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                if (pars != null) cmd.Parameters.AddRange(pars);
                return cmd.ExecuteNonQuery();
            }
        }

        public static object ExecuteScalar(string sql, params SqlParameter[] pars)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                if (pars != null) cmd.Parameters.AddRange(pars);
                return cmd.ExecuteScalar();
            }
        }

        public static SqlDataReader ExecuteReader(string sql, params SqlParameter[] pars)
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (pars != null) cmd.Parameters.AddRange(pars);
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);
        }

        public static DataSet ExecuteDataSet(string sql, params SqlParameter[] pars)
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlDataAdapter da = new SqlDataAdapter(sql, conn);
            if (pars != null) da.SelectCommand.Parameters.AddRange(pars);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public static DataTable ExecuteDataTable(string sql, params SqlParameter[] pars)
        {
            DataSet ds = ExecuteDataSet(sql, pars);
            return ds.Tables.Count == 0 ? null : ds.Tables[0];
        }

        public static DataRow ExecuteDataRow(string sql, params SqlParameter[] pars)
        {
            DataTable dt = ExecuteDataTable(sql, pars);
            return dt == null || dt.Rows.Count == 0 ? null : dt.Rows[0];
        }
        #endregion

        #region 对象Insert方法
        /// <summary>
        /// 往对象反射类对应的表中添加一条数据
        /// </summary>
        /// <param name="entity">要添加的映射实体</param>
        /// <returns>添加成功返回ID，添加失败返回0</returns>
        public static int Insert(object entity)
        {
            if (entity == null) return int.MinValue;
            Type type = entity.GetType();
            PropertyInfo[] ptys = type.GetProperties();
            if (ptys.Length == 0) throw new Exception("类" + type.Name + "不具有任何属性");
            if (ptys[0].PropertyType != typeof(int)) throw new Exception("类" + type.Name + "的第一个属性必须为Int类型");
            // 拼接SQL语句
            StringBuilder sql = new StringBuilder();
            sql.Append("insert into ").Append(type.Name).Append("(");
            for (int i = 1; i < ptys.Length; i++)
                sql.Append(ptys[i].Name).Append(",");
            sql.Remove(sql.Length - 1, 1).Append(") ").Append(" values(");
            for (int i = 1; i < ptys.Length; i++)
                sql.Append("@").Append(ptys[i].Name).Append(",");
            sql.Remove(sql.Length - 1, 1).Append(") select @@identity");

            SqlParameter[] pars = new SqlParameter[ptys.Length - 1];
            for (int i = 1; i < ptys.Length; i++)
                pars[i - 1] = new SqlParameter("@" + ptys[i].Name, ptys[i].GetValue(entity, null) ?? DBNull.Value);

            int id = Convert.ToInt32(ExecuteScalar(sql.ToString(), pars));
            ptys[0].SetValue(entity, id, null);
            return id;
        }
        #endregion

        #region 对象Update方法
        /// <summary>
        /// 更新实体反射类对应的表数据
        /// 会将除主键外的所有字段更新
        /// </summary>
        /// <param name="entity">要更新的映射实体</param>
        /// <returns>受影响的额行数</returns>
        public static int Update(object entity)
        {
            if (entity == null) return int.MinValue;
            Type type = entity.GetType();
            PropertyInfo[] ptys = type.GetProperties();
            if (ptys.Length == 0) throw new Exception("类" + type.Name + "不具有任何属性");
            if (ptys[0].PropertyType != typeof(int)) throw new Exception("类" + type.Name + "的第一个属性必须为Int类型");
            // 拼接SQL语句
            StringBuilder sql = new StringBuilder();
            sql.AppendFormat("update {0} set ", type.Name);
            for (int i = 1; i < ptys.Length; i++)
                sql.AppendFormat("{0}=@{0},", ptys[i].Name);
            sql.Remove(sql.Length - 1, 1).AppendFormat(" where {0}=@{0}", ptys[0].Name);

            SqlParameter[] pars = new SqlParameter[ptys.Length];
            for (int i = 0; i < ptys.Length; i++)
                pars[i] = new SqlParameter("@" + ptys[i].Name, ptys[i].GetValue(entity, null) ?? DBNull.Value);

            return ExecuteNonQuery(sql.ToString(), pars);
        }
        #endregion

        #region 对象Delete方法
        /// <summary>
        /// 根据指定ID删除一条记录
        /// </summary>
        /// <param name="entity">要删除的映射实体</param>
        /// <returns>受影响的额行数</returns>
        public static int Delete(object entity)
        {
            if (entity == null) return int.MinValue;
            Type type = entity.GetType();
            PropertyInfo[] ptys = type.GetProperties();
            if (ptys.Length == 0) throw new Exception("类" + type.Name + "不具有任何属性");
            if (ptys[0].PropertyType != typeof(int)) throw new Exception("类" + type.Name + "的第一个属性必须为Int类型");
            // 拼接SQL语句
            StringBuilder sql = new StringBuilder();
            sql.AppendFormat("delete {0} where {1}=@{1}", type.Name, ptys[0].Name);

            SqlParameter[] pars = new SqlParameter[]{
                new SqlParameter("@"+ptys[0].Name, ptys[0].GetValue(entity, null))
            };

            return ExecuteNonQuery(sql.ToString(), pars);
        }
        #endregion

        #region 对象Delete<T>方法
        /// <summary>
        /// 根据指定ID删除一条记录
        /// </summary>
        /// <typeparam name="T">要删除的数据表名映射类</typeparam>
        /// <param name="id">指定ID</param>
        /// <returns>受影响的行数</returns>
        public static int Delete<T>(int id)
        {
            Type type = typeof(T);
            PropertyInfo[] ptys = type.GetProperties();
            if (ptys.Length == 0) throw new Exception("类" + type.Name + "不具有任何属性");
            if (ptys[0].PropertyType != typeof(int)) throw new Exception("类" + type.Name + "的第一个属性必须为Int类型");
            // 拼接SQL语句
            StringBuilder sql = new StringBuilder();
            sql.AppendFormat("delete {0} where {1}=@{1}", type.Name, ptys[0].Name);

            SqlParameter[] pars = new SqlParameter[]{
                new SqlParameter("@"+ptys[0].Name, id)
            };

            return ExecuteNonQuery(sql.ToString(), pars);
        }
        #endregion

        #region 查询单个对象的方法
        /// <summary>
        /// 查询单个
        /// </summary>
        /// <param name="id">主键值</param>
        /// <returns>对象</returns>
        public static T Find<T>(int id)
        {
            Type type = typeof(T);
            PropertyInfo[] ptys = type.GetProperties();
            if (ptys.Length == 0) throw new Exception("类" + type.Name + "不具有任何属性");
            if (ptys[0].PropertyType != typeof(int)) throw new Exception("类" + type.Name + "的第一个属性必须为Int类型");
            // 拼接SQL语句
            StringBuilder sql = new StringBuilder();
            sql.AppendFormat("select * from {0} where {1}=@{1}", type.Name, ptys[0].Name);
            SqlParameter[] pars = new SqlParameter[]{
                new SqlParameter("@"+ptys[0].Name, id)
            };
            using (SqlDataReader dr = ExecuteReader(sql.ToString(), pars))
            {
                if (dr.Read())
                {
                    //创建结果对象
                    T result = Activator.CreateInstance<T>();
                    //为结果对象的每一个属性赋值
                    foreach (PropertyInfo pty in ptys)
                    {
                        object value = dr[pty.Name];
                        if (value != DBNull.Value)
                            pty.SetValue(result, value, null);
                    }
                    //返回结果对象
                    return result;
                }
                else
                {
                    return default(T);
                }
            }
        }

        public static T Find<T>(string sql, params SqlParameter[] pars)
            where T : new()
        {
            List<T> list = Select<T>(sql, pars);
            return list.Count == 0 ? default(T) : list[0];
        }
        #endregion

        #region 查询所有数据的方法
        /// <summary>
        /// 查询所有数据
        /// </summary>
        /// <returns>对象集合</returns>
        public static List<T> SelectAll<T>()
        {
            Type type = typeof(T);
            PropertyInfo[] ptys = type.GetProperties();
            if (ptys.Length == 0) throw new Exception("类" + type.Name + "不具有任何属性");
            if (ptys[0].PropertyType != typeof(int)) throw new Exception("类" + type.Name + "的第一个属性必须为Int类型");
            // 拼接SQL语句
            StringBuilder sql = new StringBuilder();
            sql.AppendFormat("select * from {0}", type.Name);
            List<T> list = new List<T>();
            using (SqlDataReader dr = ExecuteReader(sql.ToString()))
            {
                while (dr.Read())
                {
                    //创建结果对象
                    T result = Activator.CreateInstance<T>();
                    //为结果对象的每一个属性赋值
                    foreach (PropertyInfo pty in ptys)
                    {
                        object value = dr[pty.Name];
                        if (value != DBNull.Value)
                            pty.SetValue(result, value, null);
                    }
                    //将结果对象添加到集合中
                    list.Add(result);
                }
            }
            return list;
        }
        #endregion

        #region 根据sql语句查询
        public static List<T> Select<T>(string sql, params SqlParameter[] pars)
            where T : new()
        {
            //反射
            Type type = typeof(T);
            PropertyInfo[] ptys = type.GetProperties();
            if (ptys.Length == 0)
                throw new Exception("实体类 " + type.Name + " 一个属性也没有！");
            PropertyInfo ptyKey = ptys[0]; //主键
            if (ptyKey.PropertyType != typeof(int))
                throw new Exception("实体类 " + type.Name + " 的第0个属性（主键）不是 int 类型！");

            //创建结果集
            List<T> list = new List<T>();
            //执行SQL语句
            using (SqlDataReader dr = ExecuteReader(sql, pars))
            {
                while (dr.Read())
                {
                    //创建结果对象
                    T result = new T();
                    //为结果对象的每一个属性赋值
                    foreach (PropertyInfo pty in ptys)
                    {
                        object value = dr[pty.Name];
                        if (value != DBNull.Value)
                            pty.SetValue(result, value, null);
                    }
                    //返回结果对象
                    list.Add(result);
                }
            }

            //返回结果集
            return list;
        }
        #endregion

        #region 分页查询10个重载

        /// <summary>
        /// 分页查询
        /// </summary>
        /// <param name="pageSize">页大小</param>
        /// <param name="pageIndex">页码</param>
        /// <param name="whereSql">where条件</param>
        /// <param name="pars">标量参数数组</param>
        /// <param name="orderSql">排序字段清单</param>
        /// <returns></returns>
        public static PagingList<T> Paging<T>(int pageSize, int pageIndex, string whereSql, SqlParameter[] pars, string orderSql)
        {
            //反射
            Type type = typeof(T);
            PropertyInfo[] ptys = type.GetProperties();
            if (ptys.Length == 0)
                throw new Exception("实体类 " + type.Name + " 一个属性也没有！");
            PropertyInfo ptyKey = ptys[0]; //主键
            if (ptyKey.PropertyType != typeof(int))
                throw new Exception("实体类 " + type.Name + " 的第0个属性（主键）不是 int 类型！");

            //处理参数
            if (pageSize <= 0)
                pageSize = 10;
            if (pageIndex <= 0)
                pageIndex = 1;
            if (string.IsNullOrEmpty(orderSql))
                orderSql = ptyKey.Name + " desc";

            //生成分页SQL语句
            StringBuilder sql = new StringBuilder();
            //select top 3 * from student where id not in (select top 3 id from student 
            //  where (sex='女')
            //  order by id) 
            //  and (sex=@sex)
            //order by id
            sql.AppendFormat("select top {0} * from {1} where {2} not in (select top {3} {2} from {1} "
                , pageSize, type.Name, ptyKey.Name, (pageIndex - 1) * pageSize);
            if (!string.IsNullOrEmpty(whereSql))
                sql.AppendFormat(" where ({0})", whereSql);
            sql.AppendFormat(" order by {0} )", orderSql);
            if (!string.IsNullOrEmpty(whereSql))
                sql.AppendFormat(" and ({0})", whereSql);
            sql.AppendFormat(" order by {0}", orderSql);

            //创建分页结果集
            PagingList<T> list = new PagingList<T>();
            list.Data = new List<T>();

            //执行SQL语句
            using (SqlDataReader dr = ExecuteReader(sql.ToString(), pars))
            {
                while (dr.Read())
                {
                    //创建结果对象
                    T result = Activator.CreateInstance<T>();
                    //为结果对象的每一个属性赋值
                    foreach (PropertyInfo pty in ptys)
                    {
                        object value = dr[pty.Name];
                        if (value != DBNull.Value)
                            pty.SetValue(result, value, null);
                    }
                    //返回结果对象
                    list.Data.Add(result);
                }
            }

            //在不分页的情况下，总记录数有多少条，生成SQL语句
            sql.Clear();
            sql.AppendFormat("select count(*) from {0} ", type.Name);
            if (!string.IsNullOrEmpty(whereSql))
                sql.AppendFormat("where {0} ", whereSql);

            //将标量参数复制一份
            SqlParameter[] pars2 = null;
            if (pars != null)
            {
                pars2 = new SqlParameter[pars.Length];
                for (int i = 0; i < pars.Length; i++)
                    pars2[i] = new SqlParameter(pars[i].ParameterName, pars[i].Value);
            }

            //执行，得到总记录数
            list.Total = Convert.ToInt32(ExecuteScalar(sql.ToString(), pars2));

            //返回分页结果集
            return list;
        }

        public static PagingList<T> Paging<T>(int pageIndex, string whereSql, SqlParameter[] pars, string orderSql)
        {
            return Paging<T>(10, pageIndex, whereSql, pars, orderSql);
        }

        public static PagingList<T> Paging<T>(int pageSize, int pageIndex, string whereSql, SqlParameter[] pars)
        {
            return Paging<T>(pageSize, pageIndex, whereSql, pars, "");
        }

        public static PagingList<T> Paging<T>(int pageIndex, string whereSql, SqlParameter[] pars)
        {
            return Paging<T>(pageIndex, whereSql, pars, "");
        }

        public static PagingList<T> Paging<T>(int pageSize, int pageIndex, string whereSql, string orderSql)
        {
            return Paging<T>(pageSize, pageIndex, whereSql, null, orderSql);
        }

        public static PagingList<T> Paging<T>(int pageIndex, string whereSql, string orderSql)
        {
            return Paging<T>(pageIndex, whereSql, null, orderSql);
        }

        public static PagingList<T> Paging<T>(int pageSize, int pageIndex, string whereSql)
        {
            return Paging<T>(pageSize, pageIndex, whereSql, null, "");
        }

        public static PagingList<T> Paging<T>(int pageIndex, string whereSql)
        {
            return Paging<T>(pageIndex, whereSql, null, "");
        }

        public static PagingList<T> Paging<T>(int pageSize, int pageIndex)
        {
            return Paging<T>(pageSize, pageIndex, "", null, "");
        }

        public static PagingList<T> Paging<T>(int pageIndex)
        {
            return Paging<T>(pageIndex, "", null, "");
        } 
        #endregion
    }

}
