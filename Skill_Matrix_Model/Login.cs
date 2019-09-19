using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace Skill_Matrix_Model
{
    public class Login
    {
        [Required(ErrorMessage = "Employee Id is required.")]
        public int Emp_Id { get; set; }

        [Required(ErrorMessage = "Employee password is required.")]
        public string Emp_Password { get; set; }
        public DateTime Password_Expire { get; set; }
        public string Password_Reset { get; set; }
        public bool Active { get; set; }

        [Required(ErrorMessage = "Confirm Password is required.")]
        [Compare("Emp_Password")]
        public string ConfirmPassword { get; set; }

        public string Mode { get; set; }

        public int Result { get; set; }
    }
}
