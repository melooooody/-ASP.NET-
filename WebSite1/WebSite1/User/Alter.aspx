<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Alter.aspx.cs" Inherits="User_Alter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        .auto-style6 {
            width:450px;
            height:398px;
            position:absolute;
            left:30%;
            top:5%;
        }
         .auto-style8 {
            text-align:right;
            width: 214px;
            height: 36px;
        }
         .auto-style13 {
            text-align: center;
            height: 37px;
        }
         .auto-style19 {
            text-align: right;
            width: 214px;
            height: 37px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style6">
                    <tr>
                        <td colspan="2" style="text-align:center;" class="auto-style14"><strong>个人信息修改</strong></td>
                    </tr>
                    <tr>
                        <td class="auto-style8">用户名：</td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">密码：</td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">姓名：</td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">性别：</td>
                        <td class="auto-style12">
                            <asp:DropDownList ID="drop" runat="server">
                                <asp:ListItem>男</asp:ListItem>
                                <asp:ListItem>女</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">收货地址：</td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8">电话：</td>
                        <td class="auto-style12">
                            <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19">邮箱：</td>
                        <td class="auto-style20">
                            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19">密保问题1：<asp:Label ID="lblQ1" runat="server"></asp:Label>：
                        </td>
                        <td class="auto-style20">
                            <asp:TextBox ID="txtA1" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style19">密保问题2：<asp:Label ID="lblQ2" runat="server"></asp:Label>：
                        </td>
                        <td class="auto-style20">
                            <asp:TextBox ID="txtA2" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style13" colspan="2">
                            <asp:Button ID="btnSubmit" runat="server" Text="提交" OnClick="btnAlter_Click" />&nbsp;&nbsp;
                            <asp:Button ID="btnBack" runat="server" Text="返回" OnClick="btnBack_Click" />
                        </td>
                    </tr>
                </table>
        </div>
    </form>
</body>
</html>
