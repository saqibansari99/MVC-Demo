using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Skill_Matrix_Model;
using Skill_Matrix_Repository;

namespace Skill_Matrix_BusinessLogic
{
    public class SkillMatrixBL : ISkillMatrixBL
    {
        public IEnumerable<SkillModel> GetAllSkills(string Skillcode)
        {
            return new SkillMatrixRepository().GetAllSkills(Skillcode);
        }

        public IEnumerable<SkillTransactionModel> GetSubmittedSkills(int EmpId)
        {
            return new SkillMatrixRepository().GetSubmittedSkills(EmpId);
        }

        public void UpdateSkillScore(int EmpId, int SkillScore, int SkillId, string Mode)
        {
            new SkillMatrixRepository().UpdateSkillScore(EmpId, SkillScore, SkillId, Mode);
        }

        int ISkillMatrixBL.InsertSkillsDetails(int EmpId, string Skillcode, int SkillId)
        {
            return new SkillMatrixRepository().InsertSkillsDetails(EmpId, Skillcode, SkillId);
        }
    }
}
