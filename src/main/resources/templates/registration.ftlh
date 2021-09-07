<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <center>
    Регистрация
    ${message!""}
    <@l.login "/registration" />
    <a href="/login">у меня есть аккаунт</a>
    </center>
</@c.page>