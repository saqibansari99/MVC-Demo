using Skill_Matrix_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Skill_Matrix_BusinessLogic
{
    public interface IStudentBL
    {
        CustomMessageModel AddNewStudent(StudentModel objstudentModel);
        IEnumerable<StudentModel> GetStudentsRecords();
    }
}
