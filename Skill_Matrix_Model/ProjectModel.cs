using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Skill_Matrix_Model
{
    public class ProjectModel
    {
        public int ID { get; set; }
        public string Project_Name { get; set; }

        public IEnumerable<ProjectModel> lstprojectModel { get; set; }
    }
}
