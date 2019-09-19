using Skill_Matrix_BusinessLogic;
using Skill_Matrix_Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Skill_Matrix_WebApplication.Controllers
{
    public class ResourceManagerController : Controller
    {
        IResourceBL iresourceBL = new ResourceBL();

        [ActionName("AddResource")]
        public ActionResult Index()
        {
            if (Request.UrlReferrer == null || Session["EmpId"] == null)
            {
                return RedirectToAction("LogOut", "Login");
            }

            ProjectModel projectModel = new ProjectModel();
            projectModel.lstprojectModel = iresourceBL.GetAllProject();
            return View(projectModel);
        }
    }
}