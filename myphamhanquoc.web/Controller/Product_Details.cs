﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using vpro.functions;
using System.Web;
using System.IO;
using System.Web.UI;

namespace Controller
{
    public class Product_Details
    {
        #region Decclare
        dbShopDataContext db = new dbShopDataContext();
        #endregion
        public List<Pro_details_entity> Load_Product_Detail(string _News_seo_url)
        {
            try
            {
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where (b.NEWS_SEO_URL==_News_seo_url)
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3,b.NEWS_PRICE1,b.NEWS_PRICE2, b.NEWS_DESC, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE,b.NEWS_CODE, c.CAT_SEO_URL, b.NEWS_FIELD2, b.UNIT_ID1 }).OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_ORDER =Utils.CIntDef(i.NEWS_ORDER);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                    pro.NEWS_PUBLISHDATE =Utils.CDateDef(i.NEWS_PUBLISHDATE,DateTime.Now);
                    pro.NEWS_CODE = i.NEWS_CODE;
                    pro.CAT_SEO_URL = i.CAT_SEO_URL;
                    pro.NEWS_FIELD2 = i.NEWS_FIELD2;
                    pro.UNIT_ID1 = Utils.CIntDef(i.UNIT_ID1);
                    l.Add(pro);
                }
                return l;
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public List<Pro_details_entity> Load_Product_Cungloai(string _News_seo_url)
        {
            try
            {
                var s = (from c in db.ESHOP_NEWS_CATs
                         join a in db.ESHOP_NEWs on c.NEWS_ID equals a.NEWS_ID
                         join b in db.ESHOP_CATEGORies on c.CAT_ID equals b.CAT_ID
                         where a.NEWS_SEO_URL == _News_seo_url
                         select new { b.CAT_ID }).ToList();
                List<Pro_details_entity> l = new List<Pro_details_entity>();
                var list = (from a in db.ESHOP_NEWS_CATs
                            join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                            where (b.NEWS_SEO_URL != _News_seo_url)
                            && (c.CAT_ID == s[0].CAT_ID || c.CAT_PARENT_PATH.Contains(s[0].CAT_ID.ToString()))
                            select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_PRICE1, b.NEWS_PRICE2, b.NEWS_PRICE3, b.NEWS_DESC, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, b.NEWS_SENDDATE, b.NEWS_CODE, c.CAT_SEO_URL, b.NEWS_FIELD1, b.NEWS_FIELD2, b.NEWS_FIELD3, b.NEWS_FIELD4 }).OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER).ToList();
                foreach (var i in list)
                {
                    Pro_details_entity pro = new Pro_details_entity();
                    pro.NEWS_ID = i.NEWS_ID;
                    pro.NEWS_TITLE = i.NEWS_TITLE;
                    pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                    pro.NEWS_DESC = i.NEWS_DESC;
                    pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                    pro.NEWS_URL = i.NEWS_URL;
                    pro.NEWS_ORDER = Utils.CIntDef(i.NEWS_ORDER);
                    pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                    pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                    pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                    //pro.NEWS_PRICE3 = Utils.CDecDef(i.NEWS_PRICE3);
                    pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                    //pro.NEWS_SENDDATE = Utils.CDateDef(i.NEWS_SENDDATE, DateTime.Now);
                    pro.NEWS_CODE = i.NEWS_CODE;
                    pro.CAT_SEO_URL = i.CAT_SEO_URL;
                    //pro.NEWS_FIELD1 = i.NEWS_FIELD1;
                    pro.NEWS_FIELD2 = i.NEWS_FIELD2;
                    //pro.NEWS_FIELD3 = i.NEWS_FIELD3;
                    //pro.NEWS_FIELD4 = i.NEWS_FIELD4;
                    l.Add(pro);
                }
                return l;
            }
            catch (Exception)
            {

                throw;
            }
        }
        //Load similar
        public List<Pro_details_entity> Load_Similar_Product(string News_Seo_Url,int limit)
        {
            try
            {
                List<Pro_details_entity> l=new List<Pro_details_entity>();
                var _vCatID = from a in db.ESHOP_NEWS_CATs
                              join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                              join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                              where b.NEWS_SEO_URL == News_Seo_Url
                              select new { c.CAT_ID, c.CAT_PARENT_ID, b.NEWS_TYPE };
                if (_vCatID.ToList().Count > 0)
                {
                    var _vProduct = (from c in db.ESHOP_NEWS_CATs
                                     join a in db.ESHOP_NEWs on c.NEWS_ID equals a.NEWS_ID
                                     where a.NEWS_TYPE == _vCatID.ToList()[0].NEWS_TYPE && (c.CAT_ID == _vCatID.ToList()[0].CAT_ID || c.CAT_ID == _vCatID.ToList()[0].CAT_PARENT_ID)
                                     && a.NEWS_SHOWINDETAIL == 1 && a.NEWS_SEO_URL != News_Seo_Url
                                     select new { a.NEWS_ID, a.NEWS_TITLE, a.NEWS_IMAGE3, a.NEWS_DESC, a.NEWS_SEO_URL, a.NEWS_URL, a.NEWS_ORDER, a.NEWS_ORDER_PERIOD, a.NEWS_PUBLISHDATE, a.NEWS_PRICE1, a.NEWS_PRICE2,a.NEWS_FIELD3 }).Distinct().OrderByDescending(n=>n.NEWS_PUBLISHDATE).Take(limit);
                    foreach (var i in _vProduct)
                    {
                        Pro_details_entity pro = new Pro_details_entity();
                        pro.NEWS_ID = i.NEWS_ID;
                        pro.NEWS_TITLE = i.NEWS_TITLE;
                        pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                        pro.NEWS_DESC = i.NEWS_DESC;
                        pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                        pro.NEWS_URL = i.NEWS_URL;
                        pro.NEWS_ORDER = Utils.CIntDef(i.NEWS_ORDER);
                        pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                        pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                        pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                        pro.NEWS_PRICE2 = Utils.CDecDef(i.NEWS_PRICE2);
                        
                        l.Add(pro);
                    }
                }
                return l;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        //Load random
        public List<Pro_details_entity> loadPro_Random(string _new_seo,int limit)
        {
            List<int> lpos = new List<int>();
            List<Pro_details_entity> l = new List<Pro_details_entity>();
            Random rdom = new Random();
            var getallList = (from a in db.ESHOP_NEWS_CATs
                        join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                        join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                              where b.NEWS_SEO_URL!=_new_seo && b.NEWS_TYPE==1
                        select new { b.NEWS_ID, b.NEWS_TITLE, b.NEWS_IMAGE3, b.NEWS_PRICE1, b.NEWS_PRICE2, b.NEWS_DESC, b.NEWS_SEO_URL, b.NEWS_URL, b.NEWS_ORDER, b.NEWS_ORDER_PERIOD, b.NEWS_PUBLISHDATE, b.NEWS_CODE, b.NEWS_FIELD2, b.NEWS_FIELD3 }) .Distinct().OrderByDescending(n => n.NEWS_PUBLISHDATE).OrderByDescending(n => n.NEWS_ORDER).ToList();
            if (getallList.Count > 0)
            {
                for (int i = 0; i < limit; i++)
                {

                    int pos = rdom.Next(1, getallList.Count - 1);
                    if (!lpos.Contains(pos))
                    {
                        lpos.Add(pos);
                        Pro_details_entity pro = new Pro_details_entity();
                        pro.NEWS_ID = getallList[pos].NEWS_ID;
                        pro.NEWS_TITLE = getallList[pos].NEWS_TITLE;
                        pro.NEWS_IMAGE3 = getallList[pos].NEWS_IMAGE3;
                        pro.NEWS_DESC = getallList[pos].NEWS_DESC;
                        pro.NEWS_SEO_URL = getallList[pos].NEWS_SEO_URL;
                        pro.NEWS_URL = getallList[pos].NEWS_URL;
                        pro.NEWS_ORDER = Utils.CIntDef(getallList[pos].NEWS_ORDER);
                        pro.NEWS_ORDER_PERIOD = Utils.CIntDef(getallList[pos].NEWS_ORDER_PERIOD);
                        pro.NEWS_PUBLISHDATE = Utils.CDateDef(getallList[pos].NEWS_PUBLISHDATE, DateTime.Now);
                        pro.NEWS_PRICE1 = Utils.CDecDef(getallList[pos].NEWS_PRICE1);
                        pro.NEWS_PRICE2 = Utils.CDecDef(getallList[pos].NEWS_PRICE2);

                        l.Add(pro);
                    }
                   
                }
            }
            return l;

        }
        
        public void Addsee(string _news_seo)
        {
            var list = db.ESHOP_NEWs.Where(n => n.NEWS_SEO_URL == _news_seo).ToList();
            if (list.Count > 0)
            {
                if (String.IsNullOrEmpty(Utils.CStrDef(HttpContext.Current.Session["seeIP_" + _news_seo + ""])))
                {
                    if (list[0].NEWS_COUNT == null)
                        list[0].NEWS_COUNT = 1;
                    else
                        list[0].NEWS_COUNT++;
                    db.SubmitChanges();
                    HttpContext.Current.Session["seeIP_" + _news_seo + ""] = HttpContext.Current.Request.UserHostAddress;
                }
            }
           
        }
        // Show html
        public string Show_File_HTML(int _newsID)
        {
            try
            {
                string pathFile;
                string strHTMLContent;
                string _result=string.Empty;
                if (_newsID > 0)
                {
                    var newsInfo = db.GetTable<ESHOP_NEW>().Where(n => n.NEWS_ID == _newsID);

                    if (newsInfo.ToList().Count > 0)
                    {
                        pathFile = HttpContext.Current.Server.MapPath(PathFiles.GetPathNews(_newsID) + "/" + newsInfo.ToList()[0].NEWS_FILEHTML);

                        if ((File.Exists(pathFile)))
                        {
                            StreamReader objNewsReader;
                            objNewsReader = new StreamReader(pathFile);
                            strHTMLContent = objNewsReader.ReadToEnd();
                            objNewsReader.Close();

                            _result = strHTMLContent;
                        }
                       
                    }
                    
                }
                return _result;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return "";
            }
        }
        //Load similar
        public List<Pro_details_entity> Load_Similar_Product(string News_Seo_Url)
        {
            try
            {
                List<Pro_details_entity> l=new List<Pro_details_entity>();
                var _vCatID = from a in db.ESHOP_NEWS_CATs
                              join b in db.ESHOP_NEWs on a.NEWS_ID equals b.NEWS_ID
                              join c in db.ESHOP_CATEGORies on a.CAT_ID equals c.CAT_ID
                              where b.NEWS_SEO_URL == News_Seo_Url
                              select new { c.CAT_ID, c.CAT_PARENT_ID, b.NEWS_TYPE };
                if (_vCatID.ToList().Count > 0)
                {
                    var _vProduct = (from c in db.ESHOP_NEWS_CATs
                                     join a in db.ESHOP_NEWs on c.NEWS_ID equals a.NEWS_ID
                                     where a.NEWS_TYPE == _vCatID.ToList()[0].NEWS_TYPE && (c.CAT_ID == _vCatID.ToList()[0].CAT_ID || c.CAT_ID == _vCatID.ToList()[0].CAT_PARENT_ID)
                                     && a.NEWS_SHOWINDETAIL == 1 && a.NEWS_SEO_URL != News_Seo_Url
                                     select new { a.NEWS_ID, a.NEWS_TITLE, a.NEWS_IMAGE3, a.NEWS_DESC, a.NEWS_SEO_URL, a.NEWS_URL, a.NEWS_ORDER, a.NEWS_ORDER_PERIOD, a.NEWS_PUBLISHDATE,a.NEWS_PRICE1, c.ESHOP_CATEGORy.CAT_SEO_URL });
                    foreach (var i in _vProduct)
                    {
                        Pro_details_entity pro = new Pro_details_entity();
                        pro.NEWS_ID = i.NEWS_ID;
                        pro.NEWS_TITLE = i.NEWS_TITLE;
                        pro.NEWS_IMAGE3 = i.NEWS_IMAGE3;
                        pro.NEWS_DESC = i.NEWS_DESC;
                        pro.NEWS_SEO_URL = i.NEWS_SEO_URL;
                        pro.NEWS_URL = i.NEWS_URL;
                        pro.NEWS_ORDER = Utils.CIntDef(i.NEWS_ORDER);
                        pro.NEWS_ORDER_PERIOD = Utils.CIntDef(i.NEWS_ORDER_PERIOD);
                        pro.NEWS_PUBLISHDATE = Utils.CDateDef(i.NEWS_PUBLISHDATE, DateTime.Now);
                        pro.NEWS_PRICE1 = Utils.CDecDef(i.NEWS_PRICE1);
                        pro.CAT_SEO_URL = i.CAT_SEO_URL;
                        l.Add(pro);
                    }
                }
                return l;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        //Load album img
        public List<ESHOP_NEWS_IMAGE> Load_albumimg(int _Newsid)
        {
            try
            {
                var list = db.ESHOP_NEWS_IMAGEs.Where(n => n.NEWS_ID == _Newsid).ToList();
                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public List<ESHOP_NEWS_IMAGE> Load_albumimg(int _Newsid,int skip,int limit)
        {
            try
            {
                var list = db.ESHOP_NEWS_IMAGEs.Where(n => n.NEWS_ID == _Newsid).Skip(skip).Take(limit).ToList();
                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }
        //Load comment
        public List<ESHOP_NEWS_COMMENT> Load_comment(int _Newsid)
        {
            try
            {
                var list = db.ESHOP_NEWS_COMMENTs.Where(n => n.NEWS_ID == _Newsid).ToList();
                return list;
            }
            catch (Exception)
            {

                throw;
            }
        }
        //Insert comment
        public bool Insert_comment(int _Newsid, string name, string email, string content)
        {
            ESHOP_NEWS_COMMENT cm = new ESHOP_NEWS_COMMENT();
            cm.NEWS_ID = _Newsid;
            cm.COMMENT_CHECK = 0;
            cm.COMMENT_STATUS = 0;
            cm.COMMENT_NAME = name;
            cm.COMMENT_EMAIL = email;
            cm.COMMENT_CONTENT = content;
            cm.COMMENT_PUBLISHDATE = DateTime.Now;
            db.ESHOP_NEWS_COMMENTs.InsertOnSubmit(cm);
            db.SubmitChanges();
            return true;
        }
        //Get name categories
        public string getnamecate(object newsid)
        {
            try
            {
                int id = Utils.CIntDef(newsid);
                var list = (from a in db.ESHOP_NEWs
                            join b in db.ESHOP_NEWS_CATs on a.NEWS_ID equals b.NEWS_ID
                            join c in db.ESHOP_CATEGORies on b.CAT_ID equals c.CAT_ID
                            where a.NEWS_ID == id
                            select new
                            {
                                c.CAT_NAME
                            }).ToList();
                if (list.Count > 0)
                {
                    return list[0].CAT_NAME;
                }
                return "";
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string Getnameattfile(int news_id)
        {
            return PathFiles.GetPathNews(news_id) + "baogia_" + news_id + ".doc";
        }
    }
}
