using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Shopkeeper_NewGoods : System.Web.UI.Page
{
    MyShoppingWebDataContext db = new MyShoppingWebDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Title = "添加商品";
        txtTitle.Focus();
    }

    protected void btnOk_Click(object sender, EventArgs e)
    {
        Goods g = new Goods();
        g.Title = txtTitle.Text.Trim();
        g.ShopId = Session["ShopId"].ToString();
        g.Price = float.Parse(txtPrice.Text);
        g.Num = int.Parse(txtNum.Text);
        if (g.Num <= 10)
        {
            Response.Write("<script language=javascript>alert('添加数量不少10！');</script>");
            return;
        }
        var result = db.Goods.SingleOrDefault(m => m.Title == g.Title&&m.ShopId==g.ShopId);
        if (result!=null)
        {
            Response.Write("<script language=javascript>alert('该商品已存在！');</script>");
            return;
        }
        if (txtPrice.Text == "" || txtNum.Text == "")
        {
            Response.Write("<script language=javascript>alert('请把信息输入完整！');</script>");
            return;
        }
        string imgname = DateTime.Now.ToString("yyyy") + DateTime.Now.ToString("MM") + DateTime.Now.ToString("dd") + DateTime.Now.ToString("hh") + DateTime.Now.ToString("mm") + DateTime.Now.ToString("ss")+Path.GetExtension(UpImg.FileName);
        string imgpath = "~/Image/Goods/" + imgname;
        UpImg.SaveAs(MapPath(imgpath));
        g.Img = imgpath.ToString();
        g.Detail = txtDetail.Text;
        g.AddDate = DateTime.Now;
        g.status = 1;
        Response.Write("<script language=javascript>alert('添加成功！');</script>");
        db.Goods.InsertOnSubmit(g);
        db.SubmitChanges();
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("ShopkeeperHome.aspx");
    }
}