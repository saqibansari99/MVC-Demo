using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Skill_Matrix_Model;
using Dapper;

namespace Skill_Matrix_Repository
{
    public class LoginRepository
    {
        public Login GetloginDetails(int EmpId, string EmpPassword, string Mode)
        {
            Login logindetails = new Login();
            using (IDbConnection connection = new SqlConnection(ConnectionStringRepo.ConnectionString))
            {
                var dynamicparameters = new DynamicParameters();
                dynamicparameters.Add(name: "@EMP_ID", EmpId);
                dynamicparameters.Add(name: "@PASSWORD", EmpPassword);
                dynamicparameters.Add(name: "@MODE", Mode);
                //dynamicparameters.Add(name: "@RESULT", direction: ParameterDirection.Output);

                logindetails = connection.QueryFirstOrDefaultAsync<Login>(sql: "USP_LOGINDETAILS", param: dynamicparameters, transaction: null,
                    commandTimeout: 0, commandType: CommandType.StoredProcedure).Result;
            }
            return logindetails;
        }
        public int UpdateloginDetails(int EmpId, string EmpPassword, string Mode)
        {
            int rowaffected = 0;
            using (IDbConnection connection = new SqlConnection(ConnectionStringRepo.ConnectionString))
            {
                var dynamicparameters = new DynamicParameters();
                dynamicparameters.Add(name: "@EMP_ID", EmpId);
                dynamicparameters.Add(name: "@PASSWORD", EmpPassword);
                dynamicparameters.Add(name: "@MODE", Mode);
                rowaffected = connection.Execute(sql: "USP_LOGINDETAILS", param: dynamicparameters, transaction: null,
                    commandTimeout: 0, commandType: CommandType.StoredProcedure);
            }
            return rowaffected;
        }
    }
}
