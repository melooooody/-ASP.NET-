<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserManage.aspx.cs" Inherits="Manager_UserManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #menu{
            float:left;
            height:65%;
            width:20%;
            background-color:#4D87D6;
        }
        #menuUrl{
            margin:5%;
            width:90%;
            height:95%;
            background-color:#99CCFF;
        }
        .auto-style1 {
            height:30%;
            width: 100%;
        }
        #menuUrl td{
            text-align:center;
        }
        #manage{
            text-align:center;
            float:right;
            height:65%;
            width:80%;
            background-color:rgb(255,252,241);
        }
    </style>
</head>
<body style="margin:0;">
    <form id="form1" runat="server">
        <div style="height:100%;width:100%;position:absolute;">
            <div id="TopLogo" style="height:35%;width:100%;">  
                <asp:Image ID="img" runat="server" Height="100%" Width="100%" ImageUrl="~/Image/Login/welcome.jpg" />
            </div>
            <div id="menu">
                <div id="menuUrl">

                    <table class="auto-style1">
                        <tr>
                            <td style="background-color:white; font-size:medium;font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;font-weight:bold;">用户管理</td>
                        </tr>
                        <tr>
                            <td>

                                <asp:HyperLink ID="LinkUser" runat="server" NavigateUrl="~/Manager/UserManage.aspx">消费者管理</asp:HyperLink>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="LinkShopkeeper" runat="server" NavigateUrl="~/Manager/ShopkeeperManage.aspx">商家管理</asp:HyperLink>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:HyperLink ID="Exit" runat="server" NavigateUrl="~/ManagerLogin.aspx">退出</asp:HyperLink>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div id="manage">
                <div style="height:10%;width:100%;text-align:center;font-size:x-large;font-weight:bold;"><br /><strong>消费者账号管理</strong></div>
                <br />
                <asp:DropDownList ID="drop" runat="server">
                    <asp:ListItem>全部</asp:ListItem>
                    <asp:ListItem>已审核</asp:ListItem>
                    <asp:ListItem>未审核</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="txt" runat="server"></asp:TextBox>
                <asp:Button ID="btnFind" runat="server" Text="查询" OnClick="btnFind_Click" />
                <asp:Button ID="btnShowAll" runat="server" Text="显示全部" OnClick="btnShowAll_Click" />

                <asp:Button ID="btnCheck" runat="server" Text="通过审核" OnClick="btnCheck_Click1" />

                <asp:Button ID="btnAlter" runat="server" Text="修改信息" OnClick="btnAlter_Click" />
                <asp:Button ID="btnDel" runat="server" Text="删除" OnClick="btnDel_Click" />

                <br /><br />
                <asp:GridView ID="GridView1" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowSorting="True" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:CheckBox ID="chk" runat="server" Checked="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="UserName" HeaderText="用户名"></asp:BoundField>
                        <asp:BoundField DataField="Password" HeaderText="密码"></asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="姓名"></asp:BoundField>
                        <asp:BoundField DataField="Sex" HeaderText="性别"></asp:BoundField>
                        <asp:BoundField DataField="Address" HeaderText="地址"></asp:BoundField>
                        <asp:BoundField DataField="PhoneNum" HeaderText="电话"></asp:BoundField>
                        <asp:BoundField DataField="Email" HeaderText="邮箱"></asp:BoundField>
                        <asp:BoundField DataField="status" HeaderText="审核状态"></asp:BoundField>
                        <asp:BoundField DataField="RegisterDate" HeaderText="注册时间"
                             DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="false"></asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="MyShoppingWebDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="User">
                </asp:LinqDataSource>
            </div>
        </div>
    </form>
</body>
</html>
