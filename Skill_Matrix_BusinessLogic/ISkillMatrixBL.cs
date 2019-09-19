using Skill_Matrix_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Skill_Matrix_BusinessLogic
{
    public interface ISkillMatrixBL
    {
        IEnumerable<SkillModel> GetAllSkills(string Skillcode);
        int InsertSkillsDetails(int EmpId, string Skillcode, int SkillId);
        IEnumerable<SkillTransactionModel> GetSubmittedSkills(int EmpId);
        void UpdateSkillScore(int EmpId, int SkillScore, int SkillId, string Mode);
    }
}
