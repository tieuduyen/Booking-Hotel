<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Email with Spring MVC</title>
</head>
<body>
    <center>
        <h1>Sending e-mail with Spring MVC</h1>
        <form action="sendEmail" method="post" >
            <table border="0" width="80%">
                <tr>
                    <td>To:</td>
                    <td><input type="text" name="to" size="65" /></td>
                </tr>
                <tr>
                    <td>Subject:</td>
                    <td><input type="text" name="subject" size="65" /></td>
                </tr>
                <tr>
                    <td>Text:</td>
                    <td><textarea cols="50" rows="10" name="text"></textarea></td>
                </tr>               
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Send E-mail" />
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>
