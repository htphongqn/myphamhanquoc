using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using System.Web;
using System.Web.UI;
using vpro.functions;

namespace Controller
{
    public class Account
    {
        #region Decclare
        dbShopDataContext db = new dbShopDataContext();
        #endregion
        public  bool Login(string Email, string MatKhau)
        {
            var dangnhap = from a in db.ESHOP_CUSTOMERs
                           where a.CUSTOMER_EMAIL == Email && a.CUSTOMER_PW == MatKhau
                           select a;
            if (dangnhap.ToList().Count > 0)
            {
                Load_All_Cuss(Email);
                return true;
            }
            else
                return false;
        }
        private void Load_All_Cuss(string email)
        {
            try
            {
                var _cus = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_EMAIL == email);
                if (_cus.ToList().Count > 0)
                {
                    HttpContext.Current.Session["User_Name"] = _cus.ToList()[0].CUSTOMER_FULLNAME;
                    HttpContext.Current.Session["User_ID"] = _cus.ToList()[0].CUSTOMER_ID;
                    HttpContext.Current.Session["User_Phone"] = _cus.ToList()[0].CUSTOMER_PHONE1;
                    HttpContext.Current.Session["User_Email"] = _cus.ToList()[0].CUSTOMER_EMAIL;
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public bool Check_email(string _email)
        {
            try
            {
                var _user = db.GetTable<ESHOP_CUSTOMER>().Where(u => u.CUSTOMER_EMAIL == _email.Trim());

                if (_user.ToList().Count > 0)
                    return true;

                return false;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return true;
            }
        }
        public bool Check_username(string username)
        {
            try
            {
                var _user = db.GetTable<ESHOP_CUSTOMER>().Where(u => u.CUSTOMER_UN == username.Trim());

                if (_user.ToList().Count > 0)
                    return true;

                return false;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return true;
            }
        }
        public bool Register(string _sFullName, string _Address, string _Phone, string _Email, string _Pass)
        {
            try
            {
                ESHOP_CUSTOMER user = new ESHOP_CUSTOMER();

                user.CUSTOMER_FULLNAME = _sFullName;
                user.CUSTOMER_ADDRESS = _Address;
                user.CUSTOMER_PHONE1 = _Phone;
                //user.CUSTOMER_SEX = sex;
                //if(ngaysinh != DateTime.MinValue)
                //    user.CUSTOMER_BIRTHDAY = ngaysinh;
                //user.CUSTOMER_FIELD1 = cityId;

                user.CUSTOMER_PW = _Pass;
                user.CUSTOMER_EMAIL = _Email;
                user.CUSTOMER_PUBLISHDATE = DateTime.Now;
                user.CUSTOMER_SHOWTYPE = 1;
                db.ESHOP_CUSTOMERs.InsertOnSubmit(user);
                db.SubmitChanges();
                Load_All_Cuss(_Email);
                return true;
            }
            catch (Exception)
            {

                return false;
            }              
            
        }
        #region Forgetpass
        public string Name;
        public void Sendpass(string _email, string _pass)
        {
            try
            {
                var list = db.ESHOP_CUSTOMERs.Where(n => n.CUSTOMER_EMAIL == _email);
                foreach (var i in list)
                {
                    Name = i.CUSTOMER_FULLNAME;
                    i.CUSTOMER_PW = _pass;
                    db.SubmitChanges();
                }

            }
            catch (Exception)
            {

                throw;
            }
        }
        #endregion
    }
}
