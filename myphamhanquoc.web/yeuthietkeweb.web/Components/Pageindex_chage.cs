using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using vpro.functions;

namespace GiaNguyen.Components
{
    public class Pageindex_chage
    {
        public string result(int tongsotin, int sotin, string cat_seo_url, string _keyword, int _catid, string _idbrand, int _sortvl, string _price, int _typepri, int _page, int type)
        {
            string _re = string.Empty;
            int kiemtradu = tongsotin % sotin;
            int _sotrang;
            if (_page == 0)
            {
                _page = 1;
            }
            if (kiemtradu != 0)
            {
                _sotrang = (tongsotin / sotin) + 1;
            }
            else
            {
                _sotrang = (tongsotin / sotin);
            }
            if (_sotrang == 1)
            {
                _re = "";
            }
            else
            {
                int s = 1;
                if (_sotrang > 7)
                {
                    if (_page >= 7 && _page < _sotrang)
                    {
                        _sotrang = _page + 1;
                        s = _page - 7 + 2;
                    }
                    else if (_page == _sotrang)
                    {
                        _sotrang = _page;
                        s = _page - 7 + 1;
                    }
                    else _sotrang = 7;
                }
                for (int i = s; i <= _sotrang; i++)
                {
                    if (_page == i)
                    {
                        _re += "<li><a><b>" + i + "</b></a></li>";
                    }
                    else
                    {
                        if (type == 2)
                        {
                            if (i == _sotrang && _page >= 7)
                            {
                                _re += "<li><a href='/tim-kiem.html?page=" + (_page + 1) + "&keyword=" + _keyword + "&catid=" + _catid + "'> >> </a></li>";
                            }
                            else if (i == s && _page >= 7)
                            {
                                _re += "<li><a href='/tim-kiem.html?page=" + (_page - 1) + "&keyword=" + _keyword + "&catid=" + _catid + "'> >> </a></li>";
                            }
                            else
                                _re += "<li><a href='/tim-kiem.html?page=" + i + "&keyword=" + _keyword + "&catid=" + _catid + "'>" + i + "</a></li>";
                        }
                        else if (type == 1)
                        {
                            string getUrl = "&idbrand=" + _idbrand + "&sort=" + _sortvl + "&price=" + _price + "&typepri=" + _typepri;
                            if (i == _sotrang && _page >= 7)
                            {
                                _re += "<li><a href='/" + cat_seo_url + ".html?page=" + (_page + 1) + getUrl + "'> >> </a></li>";
                            }
                            else if (i == s && _page >= 7)
                            {
                                _re += "<li><a href='/" + cat_seo_url + ".html?page=" + (_page - 1) + getUrl + "'> << </a></li>";
                            }
                            else
                                _re += "<li><a href='/" + cat_seo_url + ".html?page=" + i + getUrl + "'>" + i + "</a></li>";
                        }
                        else if (type == 3)
                        {
                            if (i == _sotrang && _page >= 7)
                            {
                                _re += "<li><a href='/" + cat_seo_url + ".html?page=" + (_page + 1) + "&thuonghieu=" + _idbrand + "'> >> </a></li>";
                            }
                            else if (i == s && _page >= 7)
                            {
                                _re += "<li><a href='/" + cat_seo_url + ".html?page=" + (_page - 1) + "&thuonghieu=" + _idbrand + "'> << </a></li>";
                            }
                            else
                                _re += "<li><a href='/" + cat_seo_url + ".html?page=" + i + "&thuonghieu=" + _idbrand + "'>" + i + "</a></li>";
                        }

                    }
                }
            }
            return _re;
        }
    }
}