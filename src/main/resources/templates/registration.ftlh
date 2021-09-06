<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <a href="/">main</a>
    регистрация
    ${message!""}
    <@l.login "/registration" />
    <a href="/login">у меня есть аккаунт</a>
</@c.page>