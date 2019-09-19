using Skill_Matrix_BusinessLogic;
using Skill_Matrix_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Skill_Matrix_Utility;

namespace Skill_Matrix_WebApplication.Controllers
{
    public class HomeController : Controller
    {
        //private IStudentBL istudentBL;
        //public HomeController(IStudentBL _istudentBL)
        //{
        //    istudentBL = _istudentBL;
        //}

        IStudentBL istudentBL = new StudentBL();
        ISkillMatrixBL iskillMatrixBL = new SkillMatrixBL();
        public ActionResult Index()
        {
            if (Request.UrlReferrer == null || Session["EmpId"] == null)
            {
                return RedirectToAction("LogOut", "Login");
            }

            //StudentModel objstudentmodel = new StudentModel();
            //objstudentmodel.name = "Ansari";           
            //istudentBL.AddNewStudent(objstudentmodel);
            return View();
        }

        public ActionResult About()
        {
            //if (Request.UrlReferrer == null)
            //{
            //    return RedirectToAction("LogOut", "Login");
            //}

            //ViewBag.Message = "Your application description page."; 
            //IEnumerable<StudentModel> listofstudent = istudentBL.GetStudentsRecords();
            //return Content(listofstudent.Count().ToString());
            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult AddYourSkills()
        {
            if (Request.UrlReferrer == null || Session["EmpId"] == null)
            {
                return RedirectToAction("LogOut", "Login");
            }

            SkillModel skillModel = new SkillModel();
            skillModel.lstPLskills = iskillMatrixBL.GetAllSkills("PL");
            skillModel.lstDBskills = iskillMatrixBL.GetAllSkills("DB");
            skillModel.lstWDskills = iskillMatrixBL.GetAllSkills("WD");
            skillModel.lstSLskills = iskillMatrixBL.GetAllSkills("SL");
            skillModel.lstOSskills = iskillMatrixBL.GetAllSkills("OS");
            skillModel.lstFMSskills = iskillMatrixBL.GetAllSkills("FMS");

            return View(skillModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken()]
        public ActionResult AddYourSkills(int[] Ddl_Pl, int[] Ddl_Data, int[] Ddl_Wd, int[] Ddl_Sl, int[] Ddl_Os, int[] Ddl_Fms)
        {
            int result = 0;

            if (Ddl_Pl == null && Ddl_Data == null && Ddl_Wd == null && Ddl_Sl == null && Ddl_Os == null && Ddl_Fms == null)
            {
                TempData["ErrorMsg"] = "Select atleast one of the skills.";
                return RedirectToActionPermanent("AddYourSkills", "Home");
            }

            if (Ddl_Pl != null)
            {
                foreach (int item in Ddl_Pl)
                {
                    result = iskillMatrixBL.InsertSkillsDetails((int)Session["EmpId"], "PL", item);
                }
            }

            if (Ddl_Data != null)
            {
                foreach (int item in Ddl_Data)
                {
                    result = iskillMatrixBL.InsertSkillsDetails((int)Session["EmpId"], "DB", item);
                }
            }

            if (Ddl_Wd != null)
            {
                foreach (int item in Ddl_Wd)
                {
                    result = iskillMatrixBL.InsertSkillsDetails((int)Session["EmpId"], "WD", item);
                }
            }

            if (Ddl_Sl != null)
            {
                foreach (int item in Ddl_Sl)
                {
                    result = iskillMatrixBL.InsertSkillsDetails((int)Session["EmpId"], "SL", item);
                }
            }

            if (Ddl_Os != null)
            {
                foreach (int item in Ddl_Os)
                {
                    result = iskillMatrixBL.InsertSkillsDetails((int)Session["EmpId"], "OS", item);
                }
            }

            if (Ddl_Fms != null)
            {
                foreach (int item in Ddl_Fms)
                {
                    result = iskillMatrixBL.InsertSkillsDetails((int)Session["EmpId"], "FMS", item);
                }
            }

            return RedirectToActionPermanent("SelectedSkills", "Home");
        }
        public ActionResult SelectedSkills()
        {
            if (Request.UrlReferrer == null || Session["EmpId"] == null)
            {
                return RedirectToAction("LogOut", "Login");
            }

            SkillTransactionModel skillTransactionModel = new SkillTransactionModel();
            skillTransactionModel.lstskillTransactionModels = iskillMatrixBL.GetSubmittedSkills((int)Session["EmpId"]);
            TempData["LstCount"] = skillTransactionModel.lstskillTransactionModels.Count() + 1;
            //return View(skillTransactionModel);
            return View("~/Views/Home/SelectedSkills_New.cshtml", skillTransactionModel);
        }

        [HttpPost]
        [ValidateAntiForgeryToken()]
        public ActionResult SelectedSkills(FormCollection formCollection)
        {

            if (Convert.ToInt32(TempData["LstCount"]) != formCollection.Keys.Count)
            {
                TempData.Keep();
                SkillTransactionModel skillTransactionModel = new SkillTransactionModel();
                skillTransactionModel.lstskillTransactionModels = iskillMatrixBL.GetSubmittedSkills((int)Session["EmpId"]);
                ModelState.AddModelError("Skill_Name", "Provide rating for all your skills.");
                //return View(skillTransactionModel);
                return View("~/Views/Home/SelectedSkills_New.cshtml", skillTransactionModel);
            }
            foreach (var item in formCollection.AllKeys)
            {
                if (item != "__RequestVerificationToken")
                {
                    iskillMatrixBL.UpdateSkillScore((int)Session["EmpId"], Convert.ToInt32(formCollection[item]), Convert.ToInt32(Common.DecryptData(item)), "U");
                }
            }
            TempData["SuccessMessage"] = "You have Successfully submitted your skills";
            return RedirectToActionPermanent("SelectedSkills", "Home");
            //return View("~/Views/Home/SuccessMessage.cshtml");
        }

        [HttpPost]
        [ValidateAntiForgeryToken()]
        public ActionResult DeleteSkills(string SkillId)
        {
            if (Request.UrlReferrer == null || Session["EmpId"] == null)
            {
                return RedirectToAction("LogOut", "Login");
            }

            iskillMatrixBL.UpdateSkillScore((int)Session["EmpId"], 0, Convert.ToInt32(Common.DecryptData(SkillId)), "D");
            return RedirectToAction("SelectedSkills", "Home");
        }
    }
}