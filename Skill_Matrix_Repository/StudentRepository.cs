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
    public class StudentRepository
    {
        public CustomMessageModel AddNewStudent(StudentModel objstudentModel)
        {
            CustomMessageModel objcustommessage = new CustomMessageModel();
            using (IDbConnection connection = new SqlConnection(ConnectionStringRepo.ConnectionString))
            {
                connection.Open();
                using (var transaction = connection.BeginTransaction())
                {
                    try
                    {
                        var dynamicparameters = new DynamicParameters();
                        dynamicparameters.Add(name: "@StudentName", objstudentModel.name);
                        objcustommessage = connection.QueryFirstOrDefault<CustomMessageModel>(sql: "addnewstudent", dynamicparameters, transaction,
                            commandTimeout: 0, commandType: CommandType.StoredProcedure);
                        transaction.Commit();
                    }
                    catch (Exception exception)
                    {
                        transaction.Rollback();
                        objcustommessage = new CustomMessageModel()
                        {
                            CustomMessage = exception.Message
                        };
                    }
                }                
            }
            return objcustommessage;
        }

        public IEnumerable<StudentModel> GetStudentsRecords()
        {
            IEnumerable<StudentModel> listofstudent;
            using (IDbConnection connection = new SqlConnection(ConnectionStringRepo.ConnectionString))
            {
                listofstudent = connection.Query<StudentModel>(sql: "Getstudentcount", param: null, transaction: null, commandTimeout: 0,
                    commandType: CommandType.StoredProcedure);
            }
            return listofstudent;
        }
    }
}
