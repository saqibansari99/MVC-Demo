using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Skill_Matrix_BusinessLogic;
using Skill_Matrix_Model;

namespace Skill_Matrix_WebApplication.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        ILoginBL iloginBL = new LoginBL();
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken()]
        public ActionResult Index(Login login)
        {
            Login objlogin = iloginBL.GetloginDetails(login.Emp_Id, login.Emp_Password, "S");

            if (objlogin.Result == 0 && objlogin.Emp_Id == 0)
            {
                ModelState.AddModelError("Emp_Id", "Emp Id not exist contact HR");
                return View(login);
            }
            else if (objlogin.Result == 1)
            {
                return RedirectToActionPermanent("ChangePassword", "Login", new { @EmpId = login.Emp_Id });
            }
            else if (objlogin.Result == 2)
            {
                ModelState.AddModelError("Emp_Id", "Emp Id and password not match.");
                return View(login);
            }
            Session["EmpId"] = login.Emp_Id;
            return RedirectToActionPermanent("Index", "Home");
        }

        public ActionResult ChangePassword(int EmpId)
        {
            if (Request.UrlReferrer == null)
            {
                return RedirectToAction("LogOut", "Login");
            }

            Login objlogin = new Login();
            objlogin.Emp_Id = EmpId;
            return View(objlogin);
        }

        [HttpPost]
        [ValidateAntiForgeryToken()]
        public ActionResult ChangePassword(Login login)
        {
            int rowaffected = iloginBL.UpdateloginDetails(login.Emp_Id, login.Emp_Password, "C");
            if (rowaffected > 0)
                return RedirectToActionPermanent("ChangePasswordSuccessfull", "Login");
            else
                return RedirectToActionPermanent("Index", "Login");
        }

        public ActionResult ChangePasswordSuccessfull()
        {
            return View();
        }

        public ActionResult LogOut()
        {
            Session.Clear();
            Session.Abandon();
            Session.RemoveAll();

            this.Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            this.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            this.Response.Cache.SetNoStore();
            return RedirectToActionPermanent("Index", "Login");
        }

    }
}