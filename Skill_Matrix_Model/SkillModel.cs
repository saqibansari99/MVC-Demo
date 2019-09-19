using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Skill_Matrix_Model
{
    public class SkillModel
    {
        public int Id { get; set; }
        public string Skill_Category_Code { get; set; }
        public string Skill_Category_Description { get; set; }
        public string Skill_Name { get; set; }
        public IEnumerable<SkillModel> lstPLskills { get; set; }
        public IEnumerable<SkillModel> lstDBskills { get; set; }
        public IEnumerable<SkillModel> lstWDskills { get; set; }
        public IEnumerable<SkillModel> lstSLskills { get; set; }
        public IEnumerable<SkillModel> lstOSskills { get; set; }
        public IEnumerable<SkillModel> lstFMSskills { get; set; }

    }
    public class SkillTransactionModel
    {
        
        public int Skill_Id { get; set; }
        public string Skill_Code { get; set; }             
        public string Skill_Score { get; set; }
        public string Skill_Name { get; set; }

        public IEnumerable<SkillTransactionModel> lstskillTransactionModels { get; set; }
    }
}
