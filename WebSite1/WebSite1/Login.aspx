<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height:120px;
            width: 360px;
        }
        .auto-style17 {
            text-align: center;
            height: 30px;
        }
        .auto-style18 {
            text-align: center;
            height: 30px;
            width: 179px;
        }
    </style>
</head>
<body style="margin:0;">
    <form id="form1" runat="server">
        <div style="height:100%;width:100%;background-color:aqua;position:absolute;">
            <div style="height:35%;width:25%;top:33%;left:38%;position:absolute;background-color:white;border-radius:5px;"><br />
                <span style="font-family:Impact, Haettenschweiler, ‘Arial Narrow Bold’, sans-serif;color:cornflowerblue;font-size:32px;">&nbsp;LOGIN</span>
                
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style17" colspan="2">用户名：<asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17" colspan="2">密&nbsp;&nbsp;&nbsp;码：<asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style17" colspan="2">
						    <asp:RadioButton ID="rbUser" runat="server" Text="用户" GroupName="check" Checked="true"/>  
                            <asp:RadioButton ID="rbShopper" runat="server" Text="商家" GroupName="check"/> 
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style18">
                            <asp:Button ID="btnLogin" runat="server" Text="登录" OnClick="btnLogin_Click" style="cursor: pointer;" />
                        </td>
                        <td class="auto-style18">
                            <asp:Button ID="btnCreat" runat="server" Text="注册" OnClick="btnCreat_Click" style="cursor: pointer;" />
                        </td>
                    </tr>
                </table>
                <asp:HyperLink ID="ResetPassword" runat="server" NavigateUrl="~/FindPassword.aspx">&nbsp;&nbsp;忘记密码</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
