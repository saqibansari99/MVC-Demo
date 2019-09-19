using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Skill_Matrix_Model;
using Skill_Matrix_Repository;

namespace Skill_Matrix_BusinessLogic
{
    public class LoginBL : ILoginBL
    {
        public Login GetloginDetails(int EmpId, string EmpPassword, string Mode)
        {
            return new LoginRepository().GetloginDetails(EmpId, EmpPassword, Mode);
        }

        public int UpdateloginDetails(int EmpId, string EmpPassword, string Mode)
        {
            return new LoginRepository().UpdateloginDetails(EmpId, EmpPassword, Mode);
        }
    }
}
