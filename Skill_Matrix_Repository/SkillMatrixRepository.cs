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
    public class SkillMatrixRepository
    {

        public IEnumerable<SkillModel> GetAllSkills(string Skillcode)
        {
            IEnumerable<SkillModel> listofskill;
            using (IDbConnection connection = new SqlConnection(ConnectionStringRepo.ConnectionString))
            {
                var dynamicparameters = new DynamicParameters();
                dynamicparameters.Add(name: "@SKILL_CODE", Skillcode);
                listofskill = connection.Query<SkillModel>(sql: "USP_GETALL_SKILLS", param: dynamicparameters, transaction: null, commandTimeout: 0,
                    commandType: CommandType.StoredProcedure);
            }
            return listofskill;
        }

        public int InsertSkillsDetails(int EmpId, string Skillcode, int SkillId)
        {
            int rowaffected = 0;
            using (IDbConnection connection = new SqlConnection(ConnectionStringRepo.ConnectionString))
            {
                try
                {
                    var dynamicparameters = new DynamicParameters();
                    dynamicparameters.Add(name: "@EMP_ID", EmpId);
                    dynamicparameters.Add(name: "@SKILL_CODE", Skillcode);
                    dynamicparameters.Add(name: "@SKILL_ID", SkillId);
                    //dynamicparameters.Add(name: "@COUNTER", Counter);
                    rowaffected = connection.Execute(sql: "USP_INSERT_SKILLS", param: dynamicparameters, transaction: null,
                        commandTimeout: 0, commandType: CommandType.StoredProcedure);
                }
                catch (Exception exception)
                {
                    exception.ToString();
                }
            }
            return rowaffected;
        }

        public IEnumerable<SkillTransactionModel> GetSubmittedSkills(int EmpId)
        {
            IEnumerable<SkillTransactionModel> listofsubmittedskill;
            using (IDbConnection connection = new SqlConnection(ConnectionStringRepo.ConnectionString))
            {
                var dynamicparameters = new DynamicParameters();
                dynamicparameters.Add(name: "@EMP_ID", EmpId);
                dynamicparameters.Add(name: "@MODE", "S");
                listofsubmittedskill = connection.Query<SkillTransactionModel>(sql: "USP_SUBMITTED_SKILLS", param: dynamicparameters, transaction: null, commandTimeout: 0,
                    commandType: CommandType.StoredProcedure);
            }
            return listofsubmittedskill;
        }

        public void UpdateSkillScore(int EmpId, int SkillScore, int SkillId, string Mode)
        {
            using (IDbConnection connection = new SqlConnection(ConnectionStringRepo.ConnectionString))
            {
                try
                {
                    var dynamicparameters = new DynamicParameters();
                    dynamicparameters.Add(name: "@EMP_ID", EmpId);
                    dynamicparameters.Add(name: "@MODE", Mode);
                    dynamicparameters.Add(name: "@SKILLSCORE", SkillScore);
                    dynamicparameters.Add(name: "@SKILLID", SkillId);                    
                    connection.Execute(sql: "USP_SUBMITTED_SKILLS", param: dynamicparameters, transaction: null,
                        commandTimeout: 0, commandType: CommandType.StoredProcedure);
                }
                catch (Exception exception)
                {
                    exception.ToString();
                }
            }
        }
    }
}
