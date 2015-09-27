using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using vpro.functions;

namespace Controller
{
    public class Userinfo
    {
        #region Decclare
        dbShopDataContext db = new dbShopDataContext();
        #endregion
        public List<ESHOP_PROPERTy> Loadcity()
        {
            try
            {
                var list = db.ESHOP_PROPERTies.Where(n => n.PROP_RANK == 2).ToList();
                return list;
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public List<ESHOP_PROPERTy> Loaddistric(int idpro)
        {
            try
            {
                var list = db.ESHOP_PROPERTies.Where(n => n.PROP_RANK == 3&&n.PROP_PARENT_ID==idpro).ToList();
                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<ESHOP_CUSTOMER> Loaduserinfo(int userid)
        {
            var _vUser = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_ID == userid).ToList();
            return _vUser;
        }
        public bool Updateuser(int userid,string name,string phone,string address,string city,string company)
        {
            var _vUser = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_ID == userid);
            foreach (var i in _vUser)
            {
                //if (!string.IsNullOrEmpty(pass2))
                //{
                //    if (pass1.Trim() != pass2.Trim())
                //    {
                //        return false;
                //    }
                //    i.CUSTOMER_PW = passfm;
                //}
                i.CUSTOMER_FULLNAME = name;
                i.CUSTOMER_PHONE1 = phone;
                i.CUSTOMER_ADDRESS = address;
                i.CUSTOMER_FIELD1 = company;
                i.CUSTOMER_FIELD2 = city;
                db.SubmitChanges();
                return true;
            }
            return false;
        }
        public bool UpdatePassword(int userid, string passnew)
        {
            var _vUser = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_ID == userid);
            foreach (var i in _vUser)
            {
                i.CUSTOMER_PW = passnew;
                db.SubmitChanges();
                return true;
            }
            return false;
        }
        public bool CheckPasswordOld(int userid, string pass)
        {
            var _vUser = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_ID == userid);
            foreach (var i in _vUser)
            {
                if(i.CUSTOMER_PW == pass)
                    return true;
                else
                    return false;
            }
            return false;
        }
        public decimal getShip(int id)
        {
            var list = db.ESHOP_PROPERTies.Where(n => n.PROP_ID == id).ToList();
            if (list.Count > 0)
                return Utils.CIntDef(list[0].PROP_SHIPPING_FEE);
            return 0;
        }
        public string getnamePro(int id)
        {
            var list = db.ESHOP_PROPERTies.Where(n => n.PROP_ID == id).ToList();
            if (list.Count > 0)
                return list[0].PROP_NAME;
            return "";
        }
        public bool Updateuser(int userid, string name, string phone, string address, string city, string district, string sex, DateTime time, string pass1, string pass2, string passfm)
        {
            var _vUser = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_ID == userid);
            foreach (var i in _vUser)
            {
                if (!string.IsNullOrEmpty(pass2))
                {
                    if (pass1.Trim() != pass2.Trim())
                    {
                        return false;
                    }
                    i.CUSTOMER_PW = passfm;
                }
                i.CUSTOMER_FULLNAME = name;
                i.CUSTOMER_PHONE1 = phone;
                i.CUSTOMER_ADDRESS = address;
                i.CUSTOMER_FIELD1 = city;
                i.CUSTOMER_FIELD2 = district;
                i.CUSTOMER_FIELD3 = sex;
                i.CUSTOMER_UPDATE = time;
                db.SubmitChanges();
                return true;
            }
            return false;
        }
        public bool Updateuserprofile(int userid, string name, string phone, string address)
        {
            var _vUser = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_ID == userid);
            foreach (var i in _vUser)
            {
                i.CUSTOMER_FULLNAME = name;
                i.CUSTOMER_PHONE1 = phone;
                i.CUSTOMER_ADDRESS = address;
                db.SubmitChanges();
                return true;
            }
            return false;
        }
        public bool Updateuseraddress(int userid, string address, string city, string district)
        {
            var _vUser = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_ID == userid);
            foreach (var i in _vUser)
            {
                i.CUSTOMER_FIELD1 = city;
                i.CUSTOMER_FIELD2 = district;
                i.CUSTOMER_ADDRESS = address;
                db.SubmitChanges();
                return true;
            }
            return false;
        }
        public bool Change_pass(int userid, string passfm)
        {
            var _vUser = db.GetTable<ESHOP_CUSTOMER>().Where(a => a.CUSTOMER_ID == userid);
            foreach (var i in _vUser)
            {
                i.CUSTOMER_PW = passfm;
                db.SubmitChanges();
                return true;
            }
            return false;
        }
    }
}
