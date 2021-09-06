<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <a href="/">main</a>
    логин
    <@l.login "/login" />
    <a href="/registration">я лох и у меня нет аккаунта</a>
</@c.page>