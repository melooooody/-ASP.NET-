<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShopAlter.aspx.cs" Inherits="Manager_ShopAlter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width:450px;
            height:256px;
            position:absolute;
            left:30%;
            top:10%;
        }
        .auto-style26 {
            text-align:center;
            height: 38px;
        }
        .auto-style31 {
            height: 38px;
            text-align: right;
            width: 224px;
        }
        .auto-style32 {
            height: 38px;
            width: 224px;
        }
        .auto-style33 {
            text-align: right;
            height: 39px;
            width: 224px;
        }
        .auto-style34 {
            height: 39px;
            width: 224px;
        }
        .auto-style35 {
            text-align: center;
            height: 39px;
            margin-left: 40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height:100%;width:100%;position:absolute;">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style26" colspan="2"><strong>商家信息修改</strong></td>
                </tr>
                <tr>
                    <td class="auto-style31">商家名：</td>
                    <td class="auto-style32">
                        <asp:TextBox ID="txtShopName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style31">密码：</td>
                    <td class="auto-style32">
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style31">店长姓名：</td>
                    <td class="auto-style32">
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style33">电话：</td>
                    <td class="auto-style34">
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style33">邮箱：</td>
                    <td class="auto-style34">
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style35" colspan="2">
                        <asp:Button ID="btnOk" runat="server" Text="提交" OnClick="btnOk_Click" />&nbsp;&nbsp;
                        <asp:Button ID="btnBack" runat="server" Text="返回" OnClick="btnBack_Click1" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
