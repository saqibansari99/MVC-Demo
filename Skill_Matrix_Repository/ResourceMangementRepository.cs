using Dapper;
using Skill_Matrix_Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Skill_Matrix_Repository
{
    public class ResourceMangementRepository
    {
        public IEnumerable<ProjectModel> GetAllProject()
        {
            IEnumerable<ProjectModel> listofproject;
            using (IDbConnection connection = new SqlConnection(ConnectionStringRepo.ConnectionString))
            {
                var dynamicparameters = new DynamicParameters();
                dynamicparameters.Add(name: "@MODE", "P");
                listofproject = connection.Query<ProjectModel>(sql: "USP_GETALL_RESOURCE_DETAILS", param: dynamicparameters, transaction: null, commandTimeout: 0,
                    commandType: CommandType.StoredProcedure);
            }
            return listofproject;
        }
    }
}
