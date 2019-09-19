using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Skill_Matrix_Model;
using Skill_Matrix_Repository;

namespace Skill_Matrix_BusinessLogic
{
    public class ResourceBL : IResourceBL
    {
        public IEnumerable<ProjectModel> GetAllProject()
        {
            return new ResourceMangementRepository().GetAllProject();
        }
    }
}
