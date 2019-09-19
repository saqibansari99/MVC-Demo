using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Skill_Matrix_Model;
using Skill_Matrix_Repository;

namespace Skill_Matrix_BusinessLogic
{
    public class StudentBL : IStudentBL
    {
        CustomMessageModel IStudentBL.AddNewStudent(StudentModel objstudentModel)
        {
            return new StudentRepository().AddNewStudent(objstudentModel);
        }

        IEnumerable<StudentModel> IStudentBL.GetStudentsRecords()
        {
            return new StudentRepository().GetStudentsRecords();
        }
    }
}
