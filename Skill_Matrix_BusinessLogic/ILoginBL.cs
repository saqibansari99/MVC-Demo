using Skill_Matrix_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Skill_Matrix_BusinessLogic
{
    public interface ILoginBL
    {
        Login GetloginDetails(int EmpId, string EmpPassword, string Mode);

        int UpdateloginDetails(int EmpId, string EmpPassword, string Mode);
    }
}
