using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
namespace Skill_Matrix_Repository
{
    internal class ConnectionStringRepo
    {
        public static string ConnectionString => ConfigurationManager.ConnectionStrings["SkillMatrixDb"].ConnectionString;
    }
}
