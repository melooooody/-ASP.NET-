using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_UserManage : System.Web.UI.Page
{
    MyShoppingWebDataContext db = new MyShoppingWebDataContext();
    protected void Page_Load(object sender, EventArgs e)    
    {
        this.Title = "管理员页面";
    }

    protected void btnShowAll_Click(object sender, EventArgs e)
    {
        switch (drop.Text)
        {
            case "全部":
                GridView1.DataSource = LinqDataSource1;
                GridView1.DataBind();
                checkSex();
                checkStatus();
                break;
            case "已审核":
                var userTab = db.User.Where(m => m.status==1);
                GridView1.DataSource = userTab;
                GridView1.DataBind();
                checkSex();
                checkStatus();
                break;
            case "未审核":
                var userTab1 = db.User.Where(m => m.status == 0);
                GridView1.DataSource = userTab1;
                GridView1.DataBind();
                checkSex();
                checkStatus();
                break;
        }
    }

    protected void btnFind_Click(object sender, EventArgs e)
    {
        if (txt.Text == "")
        {
            ClientScript.RegisterStartupScript(GetType(), "Warning", "<script>alert('请输入用户名！')</script>");
            return;
        }
        else
        {
            var result = db.User.SingleOrDefault(m => m.UserName == txt.Text);
            if (result != null)
            {
                var userTab = db.User.Where(m=>m.UserName.Contains(txt.Text));
                GridView1.DataSource = userTab;
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script language=javascript>alert('未找到该用户！');</script>");
                return;
            }
            checkSex();
            checkStatus();
        }
    }

    protected void btnCheck_Click1(object sender, EventArgs e)
    {
        int flag = 0;
        for(int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox cb = new CheckBox();
            cb = (CheckBox)GridView1.Rows[i].FindControl("chk");
            if (cb.Checked && GridView1.Rows[i].Cells[8].Text == "未审核")
            {
                var Tab = db.User.Single(m => m.UserName == GridView1.Rows[i].Cells[1].Text);
                Tab.status = 1;
                flag++;
                db.SubmitChanges();
                checkSex();
                checkStatus();
                Response.Write("<script language=javascript>alert('申请审核成功！');</script>");
            }
            else if (cb.Checked && GridView1.Rows[i].Cells[8].Text == "已审核")
            {
                Response.Write("<script language=javascript>alert('请选择未审核的用户！');</script>");
                return;
            }
        }
        if (flag == 0)
        {
            Response.Write("<script language=javascript>alert('请选择用户！');</script>");
            return;
        }
    }

    public void checkSex()
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            if (GridView1.Rows[i].Cells[4].Text == "1")
            {
                GridView1.Rows[i].Cells[4].Text = "男";
            }
            else if (GridView1.Rows[i].Cells[4].Text == "2")
            {
                GridView1.Rows[i].Cells[4].Text = "女";
            }
        }
    }

    public void checkStatus()
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            if (GridView1.Rows[i].Cells[8].Text == "1")
            {
                GridView1.Rows[i].Cells[8].Text = "已审核";
            }
            else if(GridView1.Rows[i].Cells[8].Text == "0")
            {
                GridView1.Rows[i].Cells[8].Text = "未审核";
            }
        }
    }

    protected void btnAlter_Click(object sender, EventArgs e)
    {
        int flag = 0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox cb = new CheckBox();
            cb = (CheckBox)GridView1.Rows[i].FindControl("chk");
            if (cb.Checked)
            {
                Session["Name"] = GridView1.Rows[i].Cells[1].Text;
                flag++;
                Response.Redirect("UserAlter.aspx");
            }
        }
        if (flag == 0)
        {
            Response.Write("<script language=javascript>alert('请选择用户！');</script>");
            return;
        }
    }

    protected void btnDel_Click(object sender, EventArgs e)
    {
        int flag = 0;
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox cb = new CheckBox();
            cb = (CheckBox)GridView1.Rows[i].FindControl("chk");
            if (cb.Checked)
            {
                db.ExecuteCommand("delete from [User] where [UserName]='" + GridView1.Rows[i].Cells[1].Text + "'");
                Response.Write("<script language=javascript>alert('已删除选中用户！');</script>");
                flag++;
                db.SubmitChanges();
            }
        }
        if (flag == 0)
        {
            Response.Write("<script language=javascript>alert('请选择用户！');</script>");
            return;
        }
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSource =LinqDataSource1;               //引用刚才建立的数据源
        GridView1.DataBind();
        checkStatus();
        checkSex();
    }
}